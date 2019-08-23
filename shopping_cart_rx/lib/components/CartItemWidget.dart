import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoppingcart_bloc/blocs/CartBloc.dart';
import 'package:shoppingcart_bloc/model/CartItem.dart';

class CartItemWidget extends StatefulWidget {
  final CartItem item;
  const CartItemWidget({Key key, this.item}) : super(key: key);

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  CartBloc _cartBloc;

  @override
  void initState() {
    _cartBloc = BlocProvider.getBloc<CartBloc>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: Colors.red,
      ),
      secondaryBackground: Container(
        color: Colors.red,
      ),
      key: UniqueKey(),
      direction: DismissDirection.horizontal,
      // quando o usuário faz um swipe para a direita
      // ou esquerda , a função onDismissed é ativada
      //e o item é deletado carrinho de compras
      onDismissed: (DismissDirection direction) {
        _cartBloc.delete = widget.item;
        print("deletado");
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        color: Colors.grey,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                width: 90,
                height: 95,
                child: CachedNetworkImage(
                  imageUrl:
                      "http://images.guiadohamburguer.com/wp-content/uploads/2015/11/13-hamburguer-costela-oburguer-foodtruck.jpg",
                  fit: BoxFit.cover,
                  placeholder: (BuildContext context, String text) {
                    return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  errorWidget: (BuildContext context, String text, Object e) {
                    return Center(
                      child: Text(
                        "Erro ao carregar imagem :(",
                        style: const TextStyle(color: Colors.red, fontSize: 21),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // espaçando entre os widgets os widgets filhos
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        widget.item.product.name,
                        // define a quebra suave do texto em vírgular
                        // e espaços , caso seja false , o texto se comporta
                        // como se tivesse espaço horizontal infinito
                        softWrap: true,
                        // define que o texto deve ocupar no máximo 2 linhas
                        // antes de sofrer o overflow
                        maxLines: 2,
                        // overflow ellipsis define que após o texto exceder
                        // o maxLines ele sofrerá um corte e adicionará 3 pontos no fim do texto
                        // e.g : text...
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,

                            // modelo de fonte customizado
                            fontFamily: "Comic Sans"),
                      ),
                      // cria uma caixa com espaços constantes
                      // aqui usamos o sizedbox para apenas espaçar 10 pixels
                      // entre o texto de nome e o preço
                      SizedBox(height: 10),
                      StreamBuilder(
                        initialData: 0.0,
                        stream: null,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          return Text(
                            "Preço R\$ ${widget.item.total.toStringAsFixed(2)}",
                            style: TextStyle(color: Colors.black),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // ta ouvindo ? nao
            Container(
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {},
                  ),
                  StreamBuilder(
                    initialData: 0,
                    stream: null,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return Text("${widget.item.amount}");
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
