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
      body: Row(
        children: [
          TextField(),
          BlocBuilder<ListBloc, ListState>(
            builder: (context, state) {
              return ListView(
                children: state.items.reversed.map((elem) {
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider(create: (context) => elem),
                      BlocProvider(create: (context) => listBloc),
                    ],
                    child: ItemWidget(),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
