import 'package:grx_demo/model/item.dart';

class ItemList {
  final List<Item> _items = [];

  operator [](int index) {
    return _items[index];
  }

  length() {
    return _items.length;
  }

  add(Item item) {
    _items.add(item);
  }

  remove(Item item) {
    _items.removeWhere((elem) => elem.id == item.id);
  }

  renameItem(int id, String newName) {
    Item i = _items.firstWhere((elem) => elem.id == id);
    i.name = newName;
  }

  ItemList();
}
