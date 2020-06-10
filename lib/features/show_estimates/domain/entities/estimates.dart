import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'infection_data.dart';

class Estimates extends Equatable {
  final String name;
  final double avgAge;
  final double avgDailyIncomeInUSD;
  final double avgDailyIncomePopulation;
  final String periodType;
  final int timeToElapse;
  final int reportedCases;
  final int population;
  final int totalHospitalBeds;
  final InfectionData impact;
  final InfectionData severe;

  Estimates({
    @required this.name,
    @required this.avgAge,
    @required this.avgDailyIncomeInUSD,
    @required this.avgDailyIncomePopulation,
    @required this.periodType,
    @required this.timeToElapse,
    @required this.reportedCases,
    @required this.population,
    @required this.totalHospitalBeds,
    @required this.impact,
    @required this.severe,
  });

  @override
  List<Object> get props => [
        name,
        avgAge,
        avgDailyIncomeInUSD,
        avgDailyIncomePopulation,
        periodType,
        timeToElapse,
        reportedCases,
        population,
        totalHospitalBeds,
        severe,
        impact,
      ];
}
