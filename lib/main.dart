import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grx_demo/bloc/list/list_bloc.dart';
import 'package:grx_demo/list_page.dart';

void main() {
  runApp(GrxDemo());
}

class GrxDemo extends StatelessWidget {
  const GrxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => ListBloc())],
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text('GRX Demo'),
          ),
          body: ListPage(),
        ),
      ),
    );
  }
}
