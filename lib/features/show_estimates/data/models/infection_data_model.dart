import 'package:covid_impact/features/show_estimates/domain/entities/infection_data.dart';
import 'package:meta/meta.dart';

/// Model data for [InfectionData]
class InfectionDataModel extends InfectionData {
  InfectionDataModel({
    @required int currentlyInfected,
    @required int infectionsByRequestedTime,
    @required int severeCasesByRequestedTime,
    @required int hospitalBedsByRequestedTime,
    @required int casesForICUByRequestedTime,
    @required int casesForVentilatorsByRequestedTime,
    @required int dollarsInFlight,
  }) : super(
          currentlyInfected: currentlyInfected,
          infectionsByRequestedTime: infectionsByRequestedTime,
          severeCasesByRequestedTime: severeCasesByRequestedTime,
          hospitalBedsByRequestedTime: hospitalBedsByRequestedTime,
          casesForICUByRequestedTime: casesForICUByRequestedTime,
          casesForVentilatorsByRequestedTime:
              casesForVentilatorsByRequestedTime,
          dollarsInFlight: dollarsInFlight,
        );

  factory InfectionDataModel.fromJson(Map<String, dynamic> json) {
    return InfectionDataModel(
      currentlyInfected: json['currentlyInfected'],
      infectionsByRequestedTime: json['infectionsByRequestedTime'],
      severeCasesByRequestedTime: json['severeCasesByRequestedTime'],
      hospitalBedsByRequestedTime: json['hospitalBedsByRequestedTime'],
      casesForICUByRequestedTime: json['casesForICUByRequestedTime'],
      casesForVentilatorsByRequestedTime:
          json['casesForVentilatorsByRequestedTime'],
      dollarsInFlight: json['dollarsInFlight'],
    );
  }

  static Map<String, int> toJson(InfectionData data) {
    return {
      'currentlyInfected': data.currentlyInfected,
      'infectionsByRequestedTime': data.infectionsByRequestedTime,
      'severeCasesByRequestedTime': data.severeCasesByRequestedTime,
      'hospitalBedsByRequestedTime': data.hospitalBedsByRequestedTime,
      'casesForICUByRequestedTime': data.casesForICUByRequestedTime,
      'casesForVentilatorsByRequestedTime':
          data.casesForVentilatorsByRequestedTime,
      'dollarsInFlight': data.dollarsInFlight
    };
  }
}
