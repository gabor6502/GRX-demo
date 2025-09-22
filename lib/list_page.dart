import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          listBloc.add(AddToList("Apples!"));
        },
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<ListBloc, ListState>(
        builder: (context, state) {
          return ListView(
            children: state.items.map((elemString) {
              return Text(elemString);
            }).toList(),
          );
        },
      ),
    );
  }
}
