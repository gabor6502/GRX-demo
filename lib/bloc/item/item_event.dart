abstract class ItemEvent {
  final String name;

  ItemEvent(this.name);
}

class RenameItem extends ItemEvent {
  RenameItem(super.name);
}
