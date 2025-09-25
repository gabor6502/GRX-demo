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
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => state.items[index],
                    lazy: false,
                  ),
                  BlocProvider(create: (context) => listBloc),
                ],
                child: ItemWidget(),
              );
            },
          );
        },
      ),
    );
  }
}

/*
ListView(
            children: state.items.reversed.map((elem) {
              // FIX!!!last elem in reversed list (i.e. first) is always every elem
              return MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => elem, lazy: false),
                  BlocProvider(create: (context) => listBloc),
                ],
                child: ItemWidget(),
              );
            }).toList(),);*/
