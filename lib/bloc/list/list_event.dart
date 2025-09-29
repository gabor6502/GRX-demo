import 'package:grx_demo/model/item.dart';

abstract class ListEvent {
  final Item item;

  ListEvent(this.item);
}

class AddToList extends ListEvent {
  AddToList(super.item);
}

class RemoveFromList extends ListEvent {
  RemoveFromList(super.item);
}

class RenameItem extends ListEvent {
  final String newName;

  RenameItem(this.newName, super.item);
}
