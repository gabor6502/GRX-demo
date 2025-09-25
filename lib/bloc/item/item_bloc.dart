import 'package:flutter_bloc/flutter_bloc.dart';
import './item_event.dart';
import './item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(ItemState("")) {
    on<RenameItem>((event, emit) {
      emit(
        ItemState(event.name),
      ); // this is causing issues! Figure out how to emit a property change in bloc
    });
  }
}
