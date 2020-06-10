import 'package:covid_impact/core/error/failures.dart';
import 'package:covid_impact/features/show_estimates/domain/entities/estimates.dart';
import 'package:covid_impact/features/show_estimates/domain/entities/infection_data.dart';
import 'package:covid_impact/features/show_estimates/domain/usecases/get_estimates.dart';
import 'package:covid_impact/presentation/bloc/show_estimates_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGetEstimates extends Mock implements GetEstimates {}

void main() {
  ShowEstimatesBloc bloc;
  MockGetEstimates mockGetEstimates;

  setUp(() {
    mockGetEstimates = MockGetEstimates();

    bloc = ShowEstimatesBloc(estimate: mockGetEstimates);
  });

  test('initial state should be empty', () {
    expect(bloc.initialState, equals(ShowEstimatesInitial()));
  });

  group('Get Estimates', () {
    final tName = 'Africa';
    final tAvgAge = 19.7;
    final tAvgDailyIncomeInUSD = 5.0;
    final tAvgDailyIncomePopulation = 0.71;
    final tPeriodType = 'days';
    final tTimeToElapse = 58;
    final tReportedCases = 674;
    final tPopulation = 66622705;
    final tTotalHospitalBeds = 1380614;
    final tInfectionData = InfectionData(
      currentlyInfected: 6740,
      infectionsByRequestedTime: 3533701120,
      severeCasesByRequestedTime: 530055168,
      hospitalBedsByRequestedTime: -529571953,
      casesForVentilatorsByRequestedTime: 176685056,
      casesForICUByRequestedTime: 70674022,
      dollarsInFlight: 216286878,
    );
    final tEstimates = Estimates(
      name: 'Africa',
      avgAge: 19.7,
      avgDailyIncomeInUSD: 5,
      avgDailyIncomePopulation: 0.71,
      periodType: 'days',
      timeToElapse: 58,
      reportedCases: 674,
      population: 66622705,
      totalHospitalBeds: 1380614,
      impact: tInfectionData,
      severe: tInfectionData,
    );

    test('should emit [Loading] and [Loaded]', () async {
      //arrange
      when(mockGetEstimates(any)).thenAnswer((_) async => Right(tEstimates));
      //assert lat
      final expected = [
        ShowEstimatesInitial(),
        ShowEstimatesLoading(),
        ShowEstimatesLoaded(estimates: tEstimates)
      ];
      expectLater(bloc, emitsInOrder(expected));
      //act
      bloc.add(GetEstimatesForUser(
          tName,
          tAvgAge,
          tAvgDailyIncomeInUSD,
          tAvgDailyIncomePopulation,
          tPeriodType,
          tTimeToElapse,
          tReportedCases,
          tTotalHospitalBeds,
          tPopulation));
    });

    test('should emit [Loading, Error] when Server Fails', () async {
      when(mockGetEstimates(any))
          .thenAnswer((_) async => Left(ServerFailure()));
      //assert lat
      final expected = [
        ShowEstimatesInitial(),
        ShowEstimatesLoading(),
        ShowEstimatesError(message: SERVER_FAILURE_MESSAGE)
      ];
      expectLater(bloc, emitsInOrder(expected));
      //act
      bloc.add(GetEstimatesForUser(
          tName,
          tAvgAge,
          tAvgDailyIncomeInUSD,
          tAvgDailyIncomePopulation,
          tPeriodType,
          tTimeToElapse,
          tReportedCases,
          tTotalHospitalBeds,
          tPopulation));
    });

    test('should emit [Loading, Error] when cache fail', () async {
      when(mockGetEstimates(any)).thenAnswer((_) async => Left(CacheFailure()));
      //assert lat
      final expected = [
        ShowEstimatesInitial(),
        ShowEstimatesLoading(),
        ShowEstimatesError(message: CACHE_FAILURE_MESSAGE)
      ];
      expectLater(bloc, emitsInOrder(expected));
      //act
      bloc.add(GetEstimatesForUser(
          tName,
          tAvgAge,
          tAvgDailyIncomeInUSD,
          tAvgDailyIncomePopulation,
          tPeriodType,
          tTimeToElapse,
          tReportedCases,
          tTotalHospitalBeds,
          tPopulation));
    });
  });
}
