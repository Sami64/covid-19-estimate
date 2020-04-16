import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class EstimatesData extends Equatable {
  final String name;
  final int avgAge;
  final int avgDailyIncomeInUSD;
  final double avgDailyIncomePopulation;
  final String periodType;
  final int timeToElapse;
  final int reportedCases;
  final int population;
  final int totalHospitalBeds;
  final int impactCurrentlyInfected;
  final int impactInfectionsByRequestedTime;
  final int impactSevereCasesByRequestedTime;
  final int impactHospitalBedsByRequestedTime;
  final int impactCasesForICUByRequestedTime;
  final int impactCasesForVentilatorsByRequestedTime;
  final int impactDollarsInFlight;
  final int severeImpactCurrentlyInfected;
  final int severeImpactInfectionsByRequestedTime;
  final int severeImpactSevereCasesByRequestedTime;
  final int severeImpactHospitalBedsByRequestedTime;
  final int severeImpactCasesForICUByRequestedTime;
  final int severeImpactCasesForVentilatorsByRequestedTime;
  final int severeImpactDollarsInFlight;

  EstimatesData({
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
      @required this.impactSevereCasesByRequestedTime,
      @required this.impactHospitalBedsByRequestedTime,
      @required this.impactCasesForICUByRequestedTime,
      @required this.impactCasesForVentilatorsByRequestedTime,
      @required this.impactDollarsInFlight,
      @required this.severeImpactCurrentlyInfected,
      @required this.severeImpactInfectionsByRequestedTime,
      @required this.severeImpactSevereCasesByRequestedTime,
      @required this.severeImpactHospitalBedsByRequestedTime,
      @required this.severeImpactCasesForICUByRequestedTime,
      @required this.severeImpactCasesForVentilatorsByRequestedTime,
      @required this.severeImpactDollarsInFlight
      });

  @override
  // TODO: implement props
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
    impactCasesForICUByRequestedTime,
    impactCurrentlyInfected,
    impactInfectionsByRequestedTime,
    impactSevereCasesByRequestedTime,
    impactHospitalBedsByRequestedTime,
    impactCasesForVentilatorsByRequestedTime,
    impactDollarsInFlight,
    severeImpactCurrentlyInfected,
    severeImpactInfectionsByRequestedTime,
    severeImpactSevereCasesByRequestedTime,
    severeImpactHospitalBedsByRequestedTime,
    severeImpactCasesForICUByRequestedTime,
    severeImpactCasesForVentilatorsByRequestedTime,
    severeImpactDollarsInFlight
  ];
}
