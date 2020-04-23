import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

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
  final int impactCurrentlyInfected;
  final int impactInfectionsByRequestedTime;
  final int impactSevereCasesByRequestedeTime;
  final int impactHospitalBedsByRequestedTime;
  final int impactCasesForICUByRequestedTime;
  final int impactCasesForVentilatorsByRequestedTime;
  final int impactdollarsInFlight;
  final int severeCurrentlyInfected;
  final int severeInfectionsByRequestedTime;
  final int severeSevereCasesByRequestedeTime;
  final int severeHospitalBedsByRequestedTime;
  final int severeCasesForICUByRequestedTime;
  final int severeCasesForVentilatorsByRequestedTime;
  final int severedollarsInFlight;

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
      @required this.impactCurrentlyInfected,
      @required this.impactInfectionsByRequestedTime,
      @required this.impactSevereCasesByRequestedeTime,
      @required this.impactHospitalBedsByRequestedTime,
      @required this.impactCasesForICUByRequestedTime,
      @required this.impactCasesForVentilatorsByRequestedTime,
      @required this.impactdollarsInFlight,
      @required this.severeCurrentlyInfected,
      @required this.severeInfectionsByRequestedTime,
      @required this.severeSevereCasesByRequestedeTime,
      @required this.severeHospitalBedsByRequestedTime,
      @required this.severeCasesForICUByRequestedTime,
      @required this.severeCasesForVentilatorsByRequestedTime,
      @required this.severedollarsInFlight
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
    impactCurrentlyInfected,
    impactInfectionsByRequestedTime,
    impactSevereCasesByRequestedeTime,
    impactHospitalBedsByRequestedTime,
    impactCasesForICUByRequestedTime,
    impactCasesForVentilatorsByRequestedTime,
    impactdollarsInFlight,
    severeCurrentlyInfected,
    severeInfectionsByRequestedTime,
    severeSevereCasesByRequestedeTime,
    severeHospitalBedsByRequestedTime,
    severeCasesForICUByRequestedTime,
    severeCasesForVentilatorsByRequestedTime,
    severedollarsInFlight
  ];
}
