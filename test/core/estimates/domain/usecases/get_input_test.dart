import 'package:covid_impact/core/estimates/domain/entities/estimates_data.dart';
import 'package:covid_impact/core/estimates/domain/repositories/estimates_data_repository.dart';
import 'package:covid_impact/core/estimates/domain/usecases/get_input.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockEstimatesDataRepository extends Mock
 implements EstimatesDataRepository {}

 void main() {
   GetInput usecase;
   MockEstimatesDataRepository mockEstimatesDataRepository;

   setUp(() {
     mockEstimatesDataRepository = MockEstimatesDataRepository();
     usecase = GetInput(mockEstimatesDataRepository);
   });

   final tEstimatesData = EstimatesData(
     name: 'Africa',
     avgAge: 19,
     avgDailyIncomeInUSD: 5,
     avgDailyIncomePopulation: 0.71,
     periodType: 'days',
     timeToElapse: 58,
     reportedCases: 674,
     population: 66622705,
     totalHospitalBeds: 1380614,
     impactCasesForICUByRequestedTime: 176685056,
     impactCasesForVentilatorsByRequestedTime: 70674022,
     impactCurrentlyInfected: 6740,
     impactDollarsInFlight: 216286878,
     impactHospitalBedsByRequestedTime: -529571953,
     impactInfectionsByRequestedTime: 3533701120,
     impactSevereCasesByRequestedTime: 530055168,
     severeImpactCasesForICUByRequestedTime: 883425280,
     severeImpactCasesForVentilatorsByRequestedTime: 353370112,
     severeImpactCurrentlyInfected: 33700,
     severeImpactDollarsInFlight: 1081434394,
     severeImpactHospitalBedsByRequestedTime: -2649792625,
     severeImpactInfectionsByRequestedTime: 17668505600,
     severeImpactSevereCasesByRequestedTime: 2650275840
   );

   final tName = 'Africa';
   final tAvgAge = 19;
   final tAvgDailyIncomeInUSD = 5;
   final tAvgDailyIncomePopulation = 0.71;
   final tPeriodType = 'days';
   final tTimeToElapse = 58;
   final tReportedCases = 674;
   final tPopulation = 66622705;
   final tTotalHospitalBeds = 1380614;

   test(
    'should get estimates data from repository',
    () async {
      // arrange
      when(mockEstimatesDataRepository.getInput(any, any, any, any, any, any, any, any, any))
          .thenAnswer((_) async => Right(tEstimatesData));
      // act
      final result = await usecase(
        Params(name: tName,
         avgAge: tAvgAge,
         avgDailyIncomeInUSD: tAvgDailyIncomeInUSD, 
         avgDailyIncomePopulation: tAvgDailyIncomePopulation,
         totalHospitalBeds: tTotalHospitalBeds,
         timeToElapse: tTimeToElapse,
         periodType: tPeriodType,
         reportedCases: tReportedCases,
         population: tPopulation
          ));
      
      // assert
      expect(result, Right(tEstimatesData));
      verify(mockEstimatesDataRepository.getInput(
        tName, 
        tAvgAge, 
        tAvgDailyIncomeInUSD, 
        tAvgDailyIncomePopulation, 
        tPeriodType, 
        tTimeToElapse, 
        tReportedCases, 
        tPopulation, 
        tTotalHospitalBeds));
      verifyNoMoreInteractions(mockEstimatesDataRepository);
      
    },
   );
 }