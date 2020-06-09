import 'package:covid_impact/core/error/failures.dart';
import 'package:covid_impact/features/show_estimates/domain/entities/estimates.dart';
import 'package:covid_impact/features/show_estimates/domain/usecases/get_estimates.dart';
import 'package:covid_impact/presentation/bloc/show_estimates_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';

class MockGetEstimiates extends Mock implements GetEstimates {}

void main() {
  ShowEstimatesBloc bloc;
  MockGetEstimiates mockGetEstimates;

  setUp(() {
    mockGetEstimates = MockGetEstimiates();

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

    test('should get estimates from usecase', () async {
      //arrange
      when(mockGetEstimates(any)).thenAnswer((_) async => Right(tEstimates));
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
      await untilCalled(mockGetEstimates(any));
      //assert
      verify(mockGetEstimates(Params(
          name: tName,
          avgAge: tAvgAge,
          avgDailyIncomeInUSD: tAvgDailyIncomeInUSD,
          avgDailyIncomePopulation: tAvgDailyIncomePopulation,
          timeToElapse: tTimeToElapse,
          periodType: tPeriodType,
          reportedCases: tReportedCases,
          totalHospitalBeds: tTotalHospitalBeds,
          population: tPopulation)));
    });

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
