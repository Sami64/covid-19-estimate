import 'dart:convert';

import 'package:covid_impact/features/show_estimates/domain/entities/estimates.dart';
import 'package:meta/meta.dart';

class EstimatesModel extends Estimates {
  EstimatesModel({
      @required String name,
      @required double avgAge,
      @required double avgDailyIncomeInUSD,
      @required double avgDailyIncomePopulation,
      @required String periodType,
      @required int timeToElapse,
      @required int reportedCases,
      @required int population,
      @required int totalHospitalBeds,
      @required int impactCurrentlyInfected,
      @required int impactInfectionsByRequestedTime,
      @required int impactSevereCasesByRequestedeTime,
      @required int impactHospitalBedsByRequestedTime,
      @required int impactCasesForICUByRequestedTime,
      @required int impactCasesForVentilatorsByRequestedTime,
      @required int impactdollarsInFlight,
      @required int severeCurrentlyInfected,
      @required int severeInfectionsByRequestedTime,
      @required int severeSevereCasesByRequestedeTime,
      @required int severeHospitalBedsByRequestedTime,
      @required int severeCasesForICUByRequestedTime,
      @required int severeCasesForVentilatorsByRequestedTime,
      @required int severedollarsInFlight
      }) : super(
        name: name,
        avgAge: avgAge,
        avgDailyIncomeInUSD: avgDailyIncomeInUSD,
        avgDailyIncomePopulation: avgDailyIncomePopulation,
        periodType: periodType,
        timeToElapse: timeToElapse,
        reportedCases: reportedCases,
        population: population,
        totalHospitalBeds: totalHospitalBeds,
        impactCurrentlyInfected: impactCurrentlyInfected,
        impactInfectionsByRequestedTime: impactInfectionsByRequestedTime,
        impactSevereCasesByRequestedeTime: impactSevereCasesByRequestedeTime,
        impactHospitalBedsByRequestedTime: impactHospitalBedsByRequestedTime,
        impactCasesForICUByRequestedTime: impactCasesForICUByRequestedTime,
        impactCasesForVentilatorsByRequestedTime: impactCasesForVentilatorsByRequestedTime,
        impactdollarsInFlight: impactdollarsInFlight,
        severeCurrentlyInfected: severeCurrentlyInfected,
        severeInfectionsByRequestedTime: severeInfectionsByRequestedTime,
        severeSevereCasesByRequestedeTime: severeSevereCasesByRequestedeTime,
        severeHospitalBedsByRequestedTime: severeHospitalBedsByRequestedTime,
        severeCasesForICUByRequestedTime: severeCasesForICUByRequestedTime,
        severeCasesForVentilatorsByRequestedTime: severeCasesForVentilatorsByRequestedTime,
        severedollarsInFlight: severedollarsInFlight,
      );


      factory EstimatesModel.fromJson(Map<String, dynamic> json) {
        return EstimatesModel(
          name: json['data']['region']['name'],
          avgAge: (json['data']['region']['avgAge']as num).toDouble(),
          avgDailyIncomeInUSD: (json['data']['region']['avgDailyIncomeInUSD'] as num).toDouble(),
          avgDailyIncomePopulation: json['data']['region']['avgDailyIncomePopulation'],
          periodType: json['data']['periodType'],
          timeToElapse: json['data']['timeToElapse'],
          reportedCases: json['data']['reportedCases'],
          population: json['data']['population'],
          totalHospitalBeds: json['data']['totalHospitalBeds'],
          impactCurrentlyInfected: json['impact']['currentlyInfected'],
          impactInfectionsByRequestedTime: json['impact']['infectionsByRequestedTime'],
          impactSevereCasesByRequestedeTime: json['impact']['severeCasesByRequestedTime'],
          impactHospitalBedsByRequestedTime: json['impact']['hospitalBedsByRequestedTime'],
          impactCasesForICUByRequestedTime: json['impact']['casesForICUByRequestedTime'],
          impactCasesForVentilatorsByRequestedTime: json['impact']['casesForVentilatorsByRequestedTime'],
          impactdollarsInFlight: json['impact']['dollarsInFlight'],
          severeCurrentlyInfected: json['severeImpact']['currentlyInfected'],
          severeInfectionsByRequestedTime: json['severeImpact']['infectionsByRequestedTime'],
          severeSevereCasesByRequestedeTime: json['severeImpact']['severeCasesByRequestedTime'],
          severeHospitalBedsByRequestedTime: json['severeImpact']['hospitalBedsByRequestedTime'],
          severeCasesForICUByRequestedTime: json['severeImpact']['casesForICUByRequestedTime'],
          severeCasesForVentilatorsByRequestedTime: json['severeImpact']['casesForVentilatorsByRequestedTime'],
          severedollarsInFlight: json['severeImpact']['dollarsInFlight']
        );
      }

      Map<String, dynamic> toJson() {
        return {
          'data': {
            'region': {
              'name': name,
              'avgAge': avgAge,
              'avgDailyIncomeInUSD': avgDailyIncomeInUSD,
              'avgDailyIncomePopulation': avgDailyIncomePopulation,
            },
            'periodType': periodType,
            'timeToElapse': timeToElapse,
            'reportedCases': reportedCases,
            'population': population,
            'totalHospitalBeds': totalHospitalBeds
          },
          'impact': {
            'currentlyInfected': impactCurrentlyInfected,
            'infectionsByRequestedTime': impactInfectionsByRequestedTime,
            'severeCasesByRequestedTime': impactSevereCasesByRequestedeTime,
            'hospitalBedsByRequestedTime': impactHospitalBedsByRequestedTime,
            'casesForICUByRequestedTime': impactCasesForICUByRequestedTime,
            'casesForVentilatorsByRequestedTime': impactCasesForVentilatorsByRequestedTime,
            'dollarsInFlight': impactdollarsInFlight
          },
          'severeImpact': {
            'currentlyInfected':          severeCurrentlyInfected,
            'infectionsByRequestedTime':  severeInfectionsByRequestedTime,
            'severeCasesByRequestedTime': severeSevereCasesByRequestedeTime,
            'hospitalBedsByRequestedTime':severeHospitalBedsByRequestedTime,
            'casesForICUByRequestedTime': severeCasesForICUByRequestedTime,
    'casesForVentilatorsByRequestedTime': severeCasesForVentilatorsByRequestedTime,
            'dollarsInFlight':            severedollarsInFlight
          }
        };
      }
}
