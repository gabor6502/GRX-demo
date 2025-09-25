import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grx_demo/bloc/item/item_event.dart';
import 'package:grx_demo/bloc/item/item_state.dart';
import 'package:grx_demo/bloc/item/item_bloc.dart';
import 'package:grx_demo/bloc/list/list_bloc.dart';
import 'package:grx_demo/bloc/list/list_event.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({super.key});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  bool editing = true; // do we show textfield for editing name or plaintext
  //final _textEditingController = TextEditingController();

  /*
  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
*/
  @override
  Widget build(BuildContext context) {
    //final itemBloc = context.read<ItemBloc>();
    // final listBloc = context.read<ListBloc>();

    /*
    changeName(String name) {
      editing = false;
      itemBloc.add(RenameItem(name));
    }*/

    return BlocBuilder<ItemBloc, ItemState>(
      builder: (context, state) {
        return /*editing
            ? TextField(
                controller: _textEditingController,
                onEditingComplete: () {
                  changeName(_textEditingController.text);
                },
                onTapOutside: (event) {
                  changeName(_textEditingController.text);
                },
                autofocus: true,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.green),
                  hintText: "Enter item name",
                ),
              )
            : */ Text(state.name + state.id.toString());
      },
    );
  }
}
