import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_bloc_provider/src/shopping_cart/models/models.dart';
import 'package:shopping_bloc_provider/src/shopping_cart/shopping_cart_notifier.dart';

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    final _notifier = Provider.of<ShoppingCartNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart RX"),
        actions: <Widget>[
          Consumer<ShoppingCartNotifier>(
            builder: (BuildContext context, ShoppingCartNotifier value,
                Widget child) {
              return CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("${value.cart.items.length}"),
              );
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                "Items",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              color: Colors.black12,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Card(
                    child: ListTile(
                      title: Text("Smartphone"),
                      onTap: () {
                        final item = Item("Smartphone", 100);
                        _notifier.add(item);
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("Notebook"),
                      onTap: () {
                        final item = Item("Notebook", 100);
                        _notifier.add(item);
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("Headset"),
                      onTap: () {
                        final item = Item("Headset", 100);
                        _notifier.add(item);
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                "Cart",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: Consumer<ShoppingCartNotifier>(
                builder: (BuildContext context, ShoppingCartNotifier value,
                    Widget child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.cart.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text("${value.cart.items[index].name}"),
                          onTap: () =>
                              _notifier.remove(value.cart.items[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
