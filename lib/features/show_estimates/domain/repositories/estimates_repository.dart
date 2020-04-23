import 'package:covid_impact/core/error/failures.dart';
import 'package:covid_impact/features/show_estimates/domain/entities/estimates.dart';
import 'package:dartz/dartz.dart';

abstract class EstimatesRepository {
  Future <Either<Failure, Estimates>> getEstimates(
    String name,
    double avgAge,
    double avgDailyIncomeInUSD,
    double avgDailyIncomePopulation,
    String periodType,
    int timeToElapse,
    int reportedCases,
    int population,
    int totalHospitalBeds
  );
}