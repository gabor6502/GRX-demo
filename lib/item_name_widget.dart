import 'dart:math';

import 'package:flutter/material.dart';
import 'package:grx_demo/model/item.dart';

class ItemNameWidget extends StatefulWidget {
  final Item item;

  const ItemNameWidget({super.key, required this.item});

  @override
  State<ItemNameWidget> createState() => _ItemNameWidgetState();
}

class _ItemNameWidgetState extends State<ItemNameWidget> {
  bool editing = true; // do we show textfield for editing name or plaintext

  final _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    changeName(String name) {
      editing = false;
      setState(() {
        widget.item.name = name;
      });
    }

    return editing
        ? TextField(
            controller: _textEditingController..text = widget.item.name,
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
              constraints: BoxConstraints(maxWidth: 300, maxHeight: 100),
              hintText: "Enter item name",
            ),
          )
        : GestureDetector(
            onDoubleTap: () {
              setState(() {
                editing = true;
              });
            },
            child: Text(widget.item.name),
          );

    //Text(widget.item.id.toString());
  }
}
