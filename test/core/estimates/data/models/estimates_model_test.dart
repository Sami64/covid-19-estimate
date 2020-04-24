import 'dart:convert';
import 'package:covid_impact/features/show_estimates/data/models/estimates_model.dart';
import 'package:covid_impact/features/show_estimates/domain/entities/estimates.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tEstimatesModel = EstimatesModel(
      name: 'Africa',
      avgAge: 19.7,
      avgDailyIncomeInUSD: 5,
      avgDailyIncomePopulation: 0.71,
      periodType: 'days',
      timeToElapse: 58,
      reportedCases: 674,
      population: 66622705,
      totalHospitalBeds: 1380614,
      impactCurrentlyInfected: 6740,
      impactInfectionsByRequestedTime: 3533701120,
      impactSevereCasesByRequestedeTime: 530055168,
      impactHospitalBedsByRequestedTime: -529571953,
      impactCasesForICUByRequestedTime: 176685056,
      impactCasesForVentilatorsByRequestedTime: 70674022,
      impactdollarsInFlight: 216286878,
      severeCurrentlyInfected: 33700,
      severeInfectionsByRequestedTime: 17668505600,
      severeSevereCasesByRequestedeTime: 2650275840,
      severeHospitalBedsByRequestedTime: -2649792625,
      severeCasesForICUByRequestedTime: 883425280,
      severeCasesForVentilatorsByRequestedTime: 353370112,
      severedollarsInFlight: 1081434394);

  test(
    'should be a subclass of Estimates entity',
    () async {
      // assert
      expect(tEstimatesModel, isA<Estimates>());
    },
  );

  group('fromJson', () {
    test(
      'should return valid model of json when avgDailyIncomeInUSD ! a double',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('estimates.json'));

        // act
        final result = EstimatesModel.fromJson(jsonMap);

        // assert
        expect(result, tEstimatesModel);
      },
    );

    test(
      'should return valid model of json when avgAge ! a double',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('estimates_data.json'));
        // act
        final result = EstimatesModel.fromJson(jsonMap);
        // assert
        expect(result, tEstimatesModel);
      },
    );
  });

  group(('toJson'), () {
    test(
      'should return valid json of model',
      () async {
        // act
        final result = tEstimatesModel.toJson();
        // assert
        final expectedMap = {
          "data": {
            "region": {
              "name": "Africa",
              "avgAge": 19.7,
              "avgDailyIncomeInUSD": 5,
              "avgDailyIncomePopulation": 0.71
            },
            "periodType": "days",
            "timeToElapse": 58,
            "reportedCases": 674,
            "population": 66622705,
            "totalHospitalBeds": 1380614
          },
          "impact": {
            "currentlyInfected": 6740,
            "infectionsByRequestedTime": 3533701120,
            "severeCasesByRequestedTime": 530055168,
            "hospitalBedsByRequestedTime": -529571953,
            "casesForICUByRequestedTime": 176685056,
            "casesForVentilatorsByRequestedTime": 70674022,
            "dollarsInFlight": 216286878
          },
          "severeImpact": {
            "currentlyInfected": 33700,
            "infectionsByRequestedTime": 17668505600,
            "severeCasesByRequestedTime": 2650275840,
            "hospitalBedsByRequestedTime": -2649792625,
            "casesForICUByRequestedTime": 883425280,
            "casesForVentilatorsByRequestedTime": 353370112,
            "dollarsInFlight": 1081434394
          }
        };
        expect(result, expectedMap);
      },
    );
  });
}
