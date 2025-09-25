import 'package:grx_demo/bloc/item/item_bloc.dart';

abstract class ListEvent {
  final ItemBloc item;

  ListEvent(this.item);
}

class AddToList extends ListEvent {
  AddToList(super.item);
}

class RemoveFromList extends ListEvent {
  RemoveFromList(super.item);
}
