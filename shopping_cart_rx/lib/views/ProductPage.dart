import 'package:flutter/material.dart';
import 'package:shoppingcart_bloc/components/DiagonallyImage.dart';
import 'package:shoppingcart_bloc/model/Product.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key key, this.product}) : super(key: key);

  final Product product;

  _ProductPage createState() => _ProductPage();
}

class _ProductPage extends State<ProductPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  Widget _buildHeader() {
    return Stack(
      alignment: Alignment(0, 0),
      overflow: Overflow.visible,
      children: <Widget>[
        DiagonallyImage(
          hero: Hero(
            tag: widget.product.id,
            child: Container(
              color: Colors.grey,
              width: double.infinity,
              height: 320,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Container(
                    color: Colors.blueGrey,
                  ),
                  Container(
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 45,
          child: TabPageSelector(
            controller: _tabController,
            color: Colors.purple,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: BackButton(
            color: Colors.white,
          ),
        ),
        Positioned(
          bottom: 35,
          right: 10,
          // alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {},
            child: Icon(Icons.favorite),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.product.name ?? "Alguma coisa 1",
            softWrap: true,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              "Alguma coisa 2",
              softWrap: true,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              widget.product.description ??
                  "SADASDASDASDSADSADSADASDASAS"
                  "ASDSADASDASDASDASDSADSASAAASD"
                  "SADSADASDASDASDASDASDASDSAASD"
                  "ASDSADSADASDSADASDASDSADSADAS"
                  "SADASDSADASDSADASDSADSADSADSA",
              softWrap: true,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8),
                child: Text(
                  "R\$ ${widget.product.price}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.purple,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                _buildHeader(),
                _buildBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
