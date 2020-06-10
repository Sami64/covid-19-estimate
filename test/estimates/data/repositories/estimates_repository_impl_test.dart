import 'package:covid_impact/core/error/exception.dart';
import 'package:covid_impact/core/error/failures.dart';
import 'package:covid_impact/core/network/network_info.dart';
import 'package:covid_impact/features/show_estimates/data/datasources/estimates_local_data_source.dart';
import 'package:covid_impact/features/show_estimates/data/datasources/estimates_remote_data_source.dart';
import 'package:covid_impact/features/show_estimates/data/models/estimates_model.dart';
import 'package:covid_impact/features/show_estimates/data/models/infection_data_model.dart';
import 'package:covid_impact/features/show_estimates/data/repositories/estimates_repository_impl.dart';
import 'package:covid_impact/features/show_estimates/domain/entities/estimates.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockEstimatesRemoteDataSource extends Mock
    implements EstimatesRemoteDataSource {}

class MockEstimatesLocalDataSource extends Mock
    implements EstimatesLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  EstimatesRepositoryImpl repository;
  MockEstimatesLocalDataSource mockEstimatesLocalDataSource;
  MockEstimatesRemoteDataSource mockEstimatesRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockEstimatesLocalDataSource = MockEstimatesLocalDataSource();
    mockEstimatesRemoteDataSource = MockEstimatesRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = EstimatesRepositoryImpl(
        remoteDataSource: mockEstimatesRemoteDataSource,
        localDataSource: mockEstimatesLocalDataSource,
        networkInfo: mockNetworkInfo);
  });

  void runOnlineTests(Function body) {
    group('device online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runOfflineTests(Function body) {
    group('device offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  final tName = 'Africa';
  final tAvgAge = 19.7;
  final tAvgDailyIncomeInUSD = 5.0;
  final tAvgDailyIncomePopulation = 0.71;
  final tPeriodType = 'days';
  final tTimeToElapse = 58;
  final tReportedCases = 674;
  final tPopulation = 66622705;
  final tTotalHospitalBeds = 1380614;
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

  final Estimates tEstimates = tEstimatesModel;

  test(
    'should test if device is online',
    () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getEstimates(
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
      verify(mockNetworkInfo.isConnected);
    },
  );

  group('getEstimates', () {
    runOnlineTests(() {
      test(
        'should return remote data when call to remote data source is successfull',
        () async {
          // arrange
          when(mockEstimatesRemoteDataSource.getEstimates(
                  any, any, any, any, any, any, any, any, any))
              .thenAnswer((_) async => tEstimatesModel);
          // act
          final result = await repository.getEstimates(
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
          verify(mockEstimatesRemoteDataSource.getEstimates(
              tName,
              tAvgAge,
              tAvgDailyIncomeInUSD,
              tAvgDailyIncomePopulation,
              tPeriodType,
              tTimeToElapse,
              tReportedCases,
              tPopulation,
              tTotalHospitalBeds));
          expect(result, equals(Right(tEstimates)));
        },
      );

      test(
        'should cache estimates locally when call to remote data source is successfull',
        () async {
          // arrange
          when(mockEstimatesRemoteDataSource.getEstimates(
                  any, any, any, any, any, any, any, any, any))
              .thenAnswer((_) async => tEstimatesModel);
          // act
          await repository.getEstimates(
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
          verify(mockEstimatesRemoteDataSource.getEstimates(
              tName,
              tAvgAge,
              tAvgDailyIncomeInUSD,
              tAvgDailyIncomePopulation,
              tPeriodType,
              tTimeToElapse,
              tReportedCases,
              tPopulation,
              tTotalHospitalBeds));

          verify(mockEstimatesLocalDataSource.cacheEstimates(tEstimatesModel));
        },
      );

      test(
        'should throw server exception when call to remote data source is unsuccessfull',
        () async {
          // arrange
          when(mockEstimatesRemoteDataSource.getEstimates(
                  any, any, any, any, any, any, any, any, any))
              .thenThrow(ServerException());
          // act
          final result = await repository.getEstimates(
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
          verify(mockEstimatesRemoteDataSource.getEstimates(
              tName,
              tAvgAge,
              tAvgDailyIncomeInUSD,
              tAvgDailyIncomePopulation,
              tPeriodType,
              tTimeToElapse,
              tReportedCases,
              tPopulation,
              tTotalHospitalBeds));
          verifyZeroInteractions(mockEstimatesLocalDataSource);
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    runOfflineTests(() {
      test(
        'should return last cached estimates when cached estimates is present',
        () async {
          // arrange
          when(mockEstimatesLocalDataSource.getLastEstimate())
              .thenAnswer((_) async => tEstimatesModel);
          // act
          final result = await repository.getEstimates(
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
          verifyZeroInteractions(mockEstimatesRemoteDataSource);
          verify(mockEstimatesLocalDataSource.getLastEstimate());
          expect(result, equals(Right(tEstimates)));
        },
      );

      test(
        'should return cache failure when cached estimates are not present',
        () async {
          // arrange
          when(mockEstimatesLocalDataSource.getLastEstimate())
              .thenThrow(CacheException());
          // act
          final result = await repository.getEstimates(
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
          verifyZeroInteractions(mockEstimatesRemoteDataSource);
          verify(mockEstimatesLocalDataSource.getLastEstimate());
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });
}
