import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  final labelText;

  InputFieldWidget({this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText
        ),
      ),
    );
  }
}