import 'dart:convert';

import 'package:covid_impact/core/error/exception.dart';
import 'package:covid_impact/features/show_estimates/data/datasources/estimates_remote_data_source.dart';
import 'package:covid_impact/features/show_estimates/data/models/estimates_model.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:convert/convert.dart';
import 'package:http/http.dart' as http;
import 'package:matcher/matcher.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  EstimatesRemoteDataSourceImpl estimatesRemoteDataSourceImpl;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    estimatesRemoteDataSourceImpl =
        EstimatesRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.post(any, body: anyNamed('body')))
        .thenAnswer((_) async => http.Response(fixture('estimates.json'), 200));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.post(any, body: anyNamed('body')))
        .thenAnswer((_) async => http.Response('Something up dude', 404));
  }

  group('getEstimates', () {
    final tName = 'Africa';
    final tAvgAge = 19.7;
    final tAvgDailyIncomeInUSD = 5.0;
    final tAvgDailyIncomePopulation = 0.71;
    final tPeriodType = 'days';
    final tTimeToElapse = 58;
    final tReportedCases = 674;
    final tPopulation = 66622705;
    final tTotalHospitalBeds = 1380614;

    final tEstimatesModel =
        EstimatesModel.fromJson(json.decode(fixture('estimates.json')));

    test(
      'should perform a POST request on url with respective body params and with application/json header',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        estimatesRemoteDataSourceImpl.getEstimates(
            tName,
            tAvgAge,
            tAvgDailyIncomeInUSD,
            tAvgDailyIncomePopulation,
            tPeriodType,
            tTimeToElapse,
            tReportedCases,
            tPopulation,
            tTotalHospitalBeds);
        // assert
        verify(mockHttpClient.post(
            'https://covid-19-dev-c.herokuapp.com/api/v1/on-covid-19',
            body: {
              'region': {
                'name': tName,
                'avgAge': tAvgAge,
                'avgDailyIncomeInUSD': tAvgDailyIncomeInUSD,
                'avgDailyIncomePopulation': tAvgDailyIncomePopulation
              },
              'periodType': tPeriodType,
              'timeToElapse': tTimeToElapse,
              'reportedCases': tReportedCases,
              'population': tPopulation,
              'totalHospitalBeds': tTotalHospitalBeds
            }));
      },
    );

    test(
      'should return estimates when response code is 200',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result = await estimatesRemoteDataSourceImpl.getEstimates(
            tName,
            tAvgAge,
            tAvgDailyIncomeInUSD,
            tAvgDailyIncomePopulation,
            tPeriodType,
            tTimeToElapse,
            tReportedCases,
            tPopulation,
            tTotalHospitalBeds);
        // assert
        expect(result, equals(tEstimatesModel));
      },
    );

    test(
      'should throw a ServerException error when response code is 404',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = estimatesRemoteDataSourceImpl.getEstimates;
        // assert
        expect(
            () => call(
                tName,
                tAvgAge,
                tAvgDailyIncomePopulation,
                tAvgDailyIncomeInUSD,
                tPeriodType,
                tTimeToElapse,
                tReportedCases,
                tPopulation,
                tTotalHospitalBeds),
            throwsA(TypeMatcher<ServerException>()));
      },
    );
  });
}
