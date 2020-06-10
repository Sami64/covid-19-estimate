import 'dart:convert';

import 'package:covid_impact/core/error/exception.dart';
import 'package:covid_impact/features/show_estimates/data/datasources/estimates_local_data_source.dart';
import 'package:covid_impact/features/show_estimates/data/models/estimates_model.dart';
import 'package:covid_impact/features/show_estimates/data/models/infection_data_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  EstimatesLocalDataSourceImpl estimatesLocalDataSourceImpl;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    estimatesLocalDataSourceImpl =
        EstimatesLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group('getLastEstimate', () {
    final tEstimatesModel =
        EstimatesModel.fromJson(json.decode(fixture('estimates.json')));
    test(
      'should return Estimates from shared preferences when present in cache',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any))
            .thenReturn(fixture('estimates.json'));

        // act
        final result = await estimatesLocalDataSourceImpl.getLastEstimate();

        // assert
        verify(mockSharedPreferences.getString(CACHED_ESTIMATES));
        expect(result, equals(tEstimatesModel));
      },
    );

    test(
      'should return a CacheException when there is no estimate in cache',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(null);

        // act
        final call = estimatesLocalDataSourceImpl.getLastEstimate;

        // assert
        expect(() => call(), throwsA(TypeMatcher<CacheException>()));
      },
    );
  });

  group('cacheEstimates', () {
    final tInfectionDataModel = InfectionDataModel(
      currentlyInfected: 6740,
      infectionsByRequestedTime: 3533701120,
      severeCasesByRequestedTime: 530055168,
      hospitalBedsByRequestedTime: -529571953,
      casesForVentilatorsByRequestedTime: 176685056,
      casesForICUByRequestedTime: 70674022,
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
      severe: tInfectionDataModel,
    );

    test(
      'should call SharedPreferences to cache the estimates',
          () async {
        // act
        estimatesLocalDataSourceImpl.cacheEstimates(tEstimatesModel);
        // assert
        final expectedJsonString = json.encode(tEstimatesModel.toJson());
        verify(mockSharedPreferences.setString(
            CACHED_ESTIMATES, expectedJsonString));
      },
    );
  });
}
