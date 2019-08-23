
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppingcart_bloc/blocs/AppBloc.dart';
import 'package:shoppingcart_bloc/blocs/CartBloc.dart';
import 'package:shoppingcart_bloc/components/CustomCard.dart';
import 'package:shoppingcart_bloc/model/Product.dart';
import 'package:shoppingcart_bloc/views/CartPage.dart';
import 'package:shoppingcart_bloc/views/ProductPage.dart';

class HomePage extends StatefulWidget {
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> with TickerProviderStateMixin {
  AppBloc _appBloc;
  TabController _tabController;

  @override
  void initState() {
    _appBloc = new AppBloc();
    _tabController = new TabController(length: 5, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    print("ECCOMERCE PAGE FECHADA");
    _tabController?.dispose();
    _appBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            title: Text("Produtos"),
            expandedHeight: 100,
          ),
          StreamBuilder<List<Product>>(
            stream: _appBloc.productFlux,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return SliverPadding(
                padding: const EdgeInsets.only(top: 20, bottom: 65),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      Product product = snapshot.data[index];
                      return ProductCard(
                        item: product,
                        function: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => ProductPage(
                                      product: product,
                                    ),
                              ),
                            ),
                      );
                    },
                    childCount: snapshot.data.length,
                  ),
                ),
              );
            },
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart),
        onPressed: () => Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => CartPage(),
              ),
            ),
      ),
    );
  }
}
