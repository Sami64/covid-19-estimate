import 'package:flutter/material.dart';

class ResultsSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0.0),
      width: MediaQuery.of(context).size.width,
      child: DraggableScrollableSheet(
        initialChildSize: 0.1,
        minChildSize: 0.1,
        maxChildSize: 1.0,
        builder: (BuildContext context, ScrollController scrollController){
          return Container(
            color: Colors.blue,
            child: ListView.builder(
              controller: scrollController,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text('Estimate Results', textAlign: TextAlign.center,),);
            }),
          );
        },
      ),
    );
  }
}