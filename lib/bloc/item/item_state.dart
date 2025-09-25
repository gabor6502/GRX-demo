class ItemState {
  static int nextId = 0;

  final int id;
  String name;

  ItemState(this.name) : id = ItemState.nextId++;
}
