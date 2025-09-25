import 'package:flutter_bloc/flutter_bloc.dart';
import 'list_event.dart';
import 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListState([])) {
    on<AddToList>((event, emit) {
      state.items.add(event.item);
      emit(
        ListState(state.items),
      ); // do we really need to re-init list every time?
    });
    on<RemoveFromList>((event, emit) {
      // remove by id only
      state.items.removeWhere((item) => item.state.id == event.item.state.id);
      emit(ListState(state.items));
    });
  }
}
