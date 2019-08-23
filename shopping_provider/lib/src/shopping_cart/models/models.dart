class ShoppingCart {
  List<Item> items = List<Item>();

  add(Item item) => items.add(item);
  remove(Item item) => items.remove(item);
}

class Item {
  final String name;
  final double value;

  Item(this.name, this.value);
}
