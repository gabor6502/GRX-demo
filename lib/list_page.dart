import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grx_demo/bloc/item/item_bloc.dart';
import 'package:grx_demo/bloc/list/list_bloc.dart';
import 'package:grx_demo/bloc/list/list_event.dart';
import 'package:grx_demo/bloc/list/list_state.dart';
import 'package:grx_demo/item_widget.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final listBloc = context.read<ListBloc>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          listBloc.add(AddToList(ItemBloc()));
        },
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<ListBloc, ListState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (BuildContext context, int index) {
              return BlocProvider(
                create: (context) =>
                    state.items[index], //state.items.reversed.elementAt(index),
                child: Row(
                  children: [
                    ItemWidget(),
                    IconButton(
                      onPressed: () {
                        listBloc.add(RemoveFromList(state.items[index]));
                      },
                      icon: Icon(Icons.remove),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
