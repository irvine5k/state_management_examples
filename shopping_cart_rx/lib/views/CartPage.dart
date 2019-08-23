import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:shoppingcart_bloc/blocs/CartBloc.dart';
import 'package:shoppingcart_bloc/components/CartItemWidget.dart';
import 'package:shoppingcart_bloc/model/CartItem.dart';

class CartPage extends StatefulWidget {
  _CartPage createState() => _CartPage();
}

class _CartPage extends State<CartPage> {
  CartBloc _cartBloc;

  @override
  void initState() {
    _cartBloc = BlocProvider.getBloc<CartBloc>();
    super.initState();
  }

  Widget _buildBody(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          StreamBuilder<List<CartItem>>(
            initialData: [],
            stream: _cartBloc.itens,
            builder:
                (BuildContext context, AsyncSnapshot<List<CartItem>> snapshot) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: snapshot.hasData && snapshot.data.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return CartItemWidget(item: snapshot.data[index]);
                        },
                      )
                    : const Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "O carrinho está vazio :(",
                            style: TextStyle(color: Colors.red, fontSize: 21),
                          ),
                        ),
                      ),
              );
            },
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Card(
              child: ListTile(
                title: const Text(
                  "Cupom",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Use o seu cupom"),
                trailing: const Icon(Icons.add),
                leading: const Icon(Icons.card_membership),
              ),
            ),
          ),

// espaçamentos de 12 pixels na horizontal para manter o padrão
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, left: 12, right: 12, bottom: 35),
            child: Card(
              elevation: 15,
              child: Container(
                width: size.width,
                color: Colors.green,
                child: Column(
                  children: <Widget>[
                    Card(
                      color: Colors.green,
                      child: ListTile(
                        leading: Text(
                          "Desconto",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        trailing: Text(
                          "R\$14.99",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    // cards com elevação
                    Card(
                      color: Colors.green,
                      child: ListTile(
                        leading: Text(
                          "Total",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        trailing: StreamBuilder(
                          initialData: 0.0,
                          stream: _cartBloc.total,
                          builder: (BuildContext context,
                              AsyncSnapshot<double> snapshot) {
                            double value = snapshot.data;
                            return Text(
                              "R\$ "
                              "${value.toStringAsFixed(2)}",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 35, left: 12, right: 12),
            child: Container(
              height: size.height / 16,
              width: size.width,
              child: FlatButton(
                color: Colors.black,
                onPressed: () async {},
                child: Text(
                  "Finalizar pedido",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Carrinho de compras",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _buildBody(context),
    );
  }
}
