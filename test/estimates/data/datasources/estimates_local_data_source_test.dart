import 'dart:convert';

import 'package:covid_impact/core/error/exception.dart';
import 'package:covid_impact/features/show_estimates/data/datasources/estimates_local_data_source.dart';
import 'package:covid_impact/features/show_estimates/data/models/estimates_model.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:matcher/matcher.dart';

import '../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  EstimatesLocalDataSourceImpl estimatesLocalDataSourceImpl;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    estimatesLocalDataSourceImpl = EstimatesLocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences
    );
  });

  group('getLastEstimate', () {
    final tEstimatesModel = EstimatesModel.fromJson(json.decode(fixture('estimates.json')));
    test(
     'should return Estimates from sharedpreferences when present in cache',
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
       when(mockSharedPreferences.getString(any))
       .thenReturn(null);
       
       // act
       final call = estimatesLocalDataSourceImpl.getLastEstimate;
       
       // assert
       expect(() => call(), throwsA(TypeMatcher<CacheException>()));
       
     },
    );

  });

  group('cacheEstimates', () {
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
       'should call SharedPreferences to cache the estimates',
       () async {
         // act
         estimatesLocalDataSourceImpl.cacheEstimates(tEstimatesModel);
         // assert
         final expectedJsonString = json.encode(tEstimatesModel.toJson());
         verify(mockSharedPreferences.setString(CACHED_ESTIMATES, expectedJsonString));
       },
      );
  });
}