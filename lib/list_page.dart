import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grx_demo/bloc/list/list_bloc.dart';
import 'package:grx_demo/bloc/list/list_state.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final listBloc = context.read<ListBloc>();

    return Scaffold(body: const Text("I'm the list page"));
  }
}
