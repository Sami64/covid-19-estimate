import 'package:covid_impact/presentation/bloc/show_estimates_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({
    Key key,
    @required this.halfWidth,
  }) : super(key: key);

  final double halfWidth;

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final controller = TextEditingController();
  String name;
  double avgAge;
  double avgDailyIncomeUSD;
  double avgPopulation;
  String periodType;
  int reportedCases;
  int timeToElapse;
  int population;
  int totalHospitalBeds;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Text('Input Values'),
        Row(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              width: widget.halfWidth,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Name'),
                  onChanged: (value) {
                    name = value;
                  },
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              width: widget.halfWidth,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Average Age'),
                  onChanged: (value) {
                    avgAge = double.parse(value);
                  },
                ),
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              width: widget.halfWidth,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'AvgDaily IncomeUSD'),
                      onChanged: (value) {
                        avgDailyIncomeUSD = double.parse(value);
                      },
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              width: widget.halfWidth,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'AvgPopulation Income'),
                      onChanged: (value) {
                        avgPopulation = double.parse(value);
                      },
                ),
              ),
            )
          ],
        ),
        Container(
          alignment: Alignment.topCenter,
          width: widget.halfWidth,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Period Type'),
                  onChanged: (value) {
                    periodType = value;
                  },
            ),
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          width: widget.halfWidth,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Time To Elapse'),
                  onChanged: (value) {
                    timeToElapse = int.parse(value);
                  },
            ),
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          width: widget.halfWidth,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Reported Cases'),
                  onChanged: (value) {
                    reportedCases = int.parse(value);
                  },
            ),
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          width: widget.halfWidth,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Population'),
                  onChanged: (value) {
                    population = int.parse(value);
                  },
            ),
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          width: widget.halfWidth,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Total Hospital Beds'),
                  onChanged: (value) {
                    totalHospitalBeds = int.parse(value);
                  },
            ),
          ),
        ),
        RaisedButton(
          child: Text('Estimate Me'),
          onPressed: () {
            print('$name, $avgAge, $avgDailyIncomeUSD, $avgPopulation, $periodType, $timeToElapse, $reportedCases, $population, $totalHospitalBeds');
            BlocProvider.of<ShowEstimatesBloc>(context)
            .add(GetEstimatesForUser(
              name,
              avgAge,
              avgDailyIncomeUSD,
              avgPopulation,
              periodType,
              timeToElapse,
              reportedCases,
              population,
              totalHospitalBeds,
            ));
          },
          color: Theme.of(context).accentColor,
        ),
      ],
    );
  }
}
