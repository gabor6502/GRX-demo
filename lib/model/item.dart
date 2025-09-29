class Item {
  static int nextId = 0;

  final int id;
  String name;

  Item(this.name) : id = Item.nextId++;
}
