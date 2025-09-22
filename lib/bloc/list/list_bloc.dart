import 'package:flutter_bloc/flutter_bloc.dart';
import 'list_event.dart';
import 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListState([])) {
    on<AddToList>((event, emit) {
      state.items.add(event.item);
      emit(ListState(state.items));
    });
    on<RemoveFromList>((event, emit) {
      state.items.remove(event.item);
      emit(ListState(state.items));
    });
  }
}
