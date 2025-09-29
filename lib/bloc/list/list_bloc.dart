import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grx_demo/model/item_list.dart';
import 'list_event.dart';
import 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListState(ItemList())) {
    on<AddToList>((event, emit) {
      state.items.add(event.item);
      emit(ListState(state.items));
    });
    on<RemoveFromList>((event, emit) {
      state.items.remove(event.item);
      emit(ListState(state.items));
    });
    on<RenameItem>((event, emit) {
      state.items.renameItem(event.item.id, event.newName);
    });
  }
}
