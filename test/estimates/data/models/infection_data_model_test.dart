import 'dart:convert';

import 'package:covid_impact/features/show_estimates/data/models/infection_data_model.dart';
import 'package:covid_impact/features/show_estimates/domain/entities/infection_data.dart';
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

  group('Test Infection Data Model', () {
    test(
      'should be a subclass of InfectionData entity',
      () async {
        // assert
        expect(tInfectionDataModel, isA<InfectionData>());
      },
    );

    test(
      'should return valid model of json',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('infection_data.json'));

        // act
        final result = InfectionDataModel.fromJson(jsonMap);

        // assert
        expect(result, tInfectionDataModel);
      },
    );

    test(
      'should return valid json of model',
      () async {
        // act
        final result = InfectionDataModel.toJson(tInfectionDataModel);
        // assert
        final expectedMap = json.decode(fixture('infection_data.json'));
        expect(result, expectedMap);
      },
    );
  });
}
