import 'package:flutter/material.dart';

class EstimatesInputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Name',
        ),
      ),
    );
  }
}