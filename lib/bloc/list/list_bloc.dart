import 'package:flutter_bloc/flutter_bloc.dart';
import 'list_event.dart';
import 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListState([])) {
    on<AddToList>((event, emit) {
      // add item object to front
      state.items.add(event.item);
      emit(ListState(state.items));
    });
    on<RemoveFromList>((event, emit) {
      // remove by id only
      state.items.removeWhere((item) => item.id == event.item.id);
      emit(ListState(state.items));
    });
  }
}
