abstract class ListEvent {
  final String item;

  ListEvent(this.item);
}

class AddToList extends ListEvent {
  AddToList(super.item);
}

class RemoveFromList extends ListEvent {
  RemoveFromList(super.item);
}
