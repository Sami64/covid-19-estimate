import 'dart:convert';

import 'package:covid_impact/features/show_estimates/data/models/estimates_model.dart';
import 'package:covid_impact/features/show_estimates/data/models/infection_data_model.dart';
import 'package:covid_impact/features/show_estimates/domain/entities/estimates.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tInfectionDataModel = InfectionDataModel(
    currentlyInfected: 6740,
    infectionsByRequestedTime: 3533701120,
    severeCasesByRequestedTime: 530055168,
    hospitalBedsByRequestedTime: -529571953,
    casesForVentilatorsByRequestedTime: 70674022,
    casesForICUByRequestedTime: 176685056,
    dollarsInFlight: 216286878,
  );
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
      impact: tInfectionDataModel,
      severe: tInfectionDataModel);

  group('Estimate model tests', () {
    test(
      'should be a subclass of Estimates entity',
      () async {
        // assert
        expect(tEstimatesModel, isA<Estimates>());
      },
    );

    test(
      'should return valid model of json',
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
      'should return valid json of model',
          () async {
        // act
        final result = tEstimatesModel.toJson();
        // assert
        final expectedMap = json.decode(fixture('estimates.json'));
        expect(result, expectedMap);
      },
    );
  });
}
