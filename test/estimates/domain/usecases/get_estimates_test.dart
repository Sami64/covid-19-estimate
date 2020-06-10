import 'package:covid_impact/features/show_estimates/domain/entities/estimates.dart';
import 'package:covid_impact/features/show_estimates/domain/entities/infection_data.dart';
import 'package:covid_impact/features/show_estimates/domain/repositories/estimates_repository.dart';
import 'package:covid_impact/features/show_estimates/domain/usecases/get_estimates.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockEstimatesRepository extends Mock implements EstimatesRepository {}

void main() {
  GetEstimates usecase;
  MockEstimatesRepository mockEstimatesRepository;
  setUp(() {
    mockEstimatesRepository = MockEstimatesRepository();
    usecase = GetEstimates(mockEstimatesRepository);
  });

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
      severe: tInfectionData);

  test(
    'should get estimates from repository',
    () async {
      // arrange
      when(mockEstimatesRepository.getEstimates(
              any, any, any, any, any, any, any, any, any))
          .thenAnswer((_) async => Right(tEstimates));
      // act
      final result = await usecase(EstimateParams(
          name: tName,
          avgAge: tAvgAge,
          avgDailyIncomeInUSD: tAvgDailyIncomeInUSD,
          avgDailyIncomePopulation: tAvgDailyIncomePopulation,
          periodType: tPeriodType,
          timeToElapse: tTimeToElapse,
          reportedCases: tReportedCases,
          population: tPopulation,
          totalHospitalBeds: tTotalHospitalBeds));
      // assert
      expect(result, Right(tEstimates));
      verify(mockEstimatesRepository.getEstimates(
          tName,
          tAvgAge,
          tAvgDailyIncomeInUSD,
          tAvgDailyIncomePopulation,
          tPeriodType,
          tTimeToElapse,
          tReportedCases,
          tPopulation,
          tTotalHospitalBeds));
      verifyNoMoreInteractions(mockEstimatesRepository);
    },
  );
}
