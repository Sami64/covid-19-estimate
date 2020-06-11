import 'package:covid_impact/presentation/widgets/InputFieldWidget.dart';
import 'package:covid_impact/presentation/widgets/results_sheet.dart';
import 'package:flutter/material.dart';

class InputEstimatesPage extends StatefulWidget {
  @override
  _InputEstimatesPageState createState() => _InputEstimatesPageState();
}

class _InputEstimatesPageState extends State<InputEstimatesPage> {
  @override
  Widget build(BuildContext context) {
    final halfWidth = MediaQuery.of(context).size.width / 2.0;

    return Stack(children: <Widget>[
      Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text('Input Values'),
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                width: halfWidth,
                child: InputFieldWidget(labelText: 'Name'),
              ),
              Container(
                alignment: Alignment.topCenter,
                width: halfWidth,
                child: InputFieldWidget(
                  labelText: 'Average Age',
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                width: halfWidth,
                child: InputFieldWidget(labelText: 'AvgDaily IncomeUSD'),
              ),
              Container(
                alignment: Alignment.topCenter,
                width: halfWidth,
                child: InputFieldWidget(
                  labelText: 'AvgPopulation Income',
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.topCenter,
            width: halfWidth,
            child: InputFieldWidget(
              labelText: 'Period Type',
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            width: halfWidth,
            child: InputFieldWidget(labelText: 'Time To Elapse'),
          ),
          Container(
            alignment: Alignment.topCenter,
            width: halfWidth,
            child: InputFieldWidget(
              labelText: 'Reported Cases',
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            width: halfWidth,
            child: InputFieldWidget(
              labelText: 'Population',
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            width: halfWidth,
            child: InputFieldWidget(labelText: 'Total Hospital Beds'),
          ),
          RaisedButton(
            child: Text('Estimate Me'),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
      ResultsSheet()
    ]);
  }
}
