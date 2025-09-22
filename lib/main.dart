import 'package:flutter/material.dart';
import 'package:grx_demo/list_page.dart';

void main() {
  runApp(GrxDemo());
}

class GrxDemo extends StatelessWidget {
  const GrxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('GRX Demo'),
        ),
        body: ListPage(),
      ),
    );
  }
}
