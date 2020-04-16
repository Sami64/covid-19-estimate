import 'package:covid_impact/core/error/failures.dart';
import 'package:covid_impact/core/estimates/domain/entities/estimates_data.dart';
import 'package:dartz/dartz.dart';

abstract class EstimatesDataRepository {
  Future<Either<Failure, EstimatesData>> getInput(
    String name,
    int avgAge,
    int avgDailyIncomeInUSD,
    double avgDailyIncomePopulation,
    String periodType,
    int timeToElapse,
    int reportedCases,
    int population,
    int totalHospitalBeds
  );

  Future<Either<Failure, EstimatesData>> getEstimates(
    int impactCurrentlyInfected,
    int impactInfectionsByRequestedTime,
    int impactSevereCasesByRequestedTime,
    int impactHospitalBedsByRequestedTime,
    int impactCasesForICUByRequestedTime,
    int impactCasesForVentilatorsByRequestedTime,
    int impactDollarsInFlight,
    int severeImpactCurrentlyInfected,
    int severeImpactInfectionsByRequestedTime,
    int severeImpactSevereCasesByRequestedTime,
    int severeImpactHospitalBedsByRequestedTime,
    int severeImpactCasesForICUByRequestedTime,
    int severeImpactCasesForVentilatorsByRequestedTime,
    int severeImpactDollarsInFlight
  );

}