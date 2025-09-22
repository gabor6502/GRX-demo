import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grx_demo/bloc/item/item_bloc.dart';
import 'package:grx_demo/bloc/item/item_state.dart';
import 'package:grx_demo/bloc/list/list_bloc.dart';
import 'package:grx_demo/bloc/list/list_event.dart';
import 'package:grx_demo/bloc/list/list_state.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final listBloc = context.read<ListBloc>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          listBloc.add(AddToList(ItemState("new item")));
        },
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<ListBloc, ListState>(
        builder: (context, state) {
          return ListView(
            children: state.items.reversed.map((elem) {
              return Row(
                children: [
                  Text(elem.name + elem.id.toString()),
                  IconButton(
                    onPressed: () {
                      listBloc.add(RemoveFromList(elem));
                    },
                    icon: Icon(Icons.remove),
                  ),
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

/*
return TextField(
                onSubmitted: (value) {
                  
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter item name',
                ),
              );
*/
