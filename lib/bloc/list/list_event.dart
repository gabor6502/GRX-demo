import 'package:grx_demo/bloc/item/item_state.dart';

abstract class ListEvent {
  final ItemState item;

  ListEvent(this.item);
}

class AddToList extends ListEvent {
  AddToList(super.item);
}

class RemoveFromList extends ListEvent {
  RemoveFromList(super.item);
}
