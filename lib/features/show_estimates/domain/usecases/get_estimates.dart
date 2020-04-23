import 'package:covid_impact/core/error/failures.dart';
import 'package:covid_impact/core/usecases/usecase.dart';
import 'package:covid_impact/features/show_estimates/domain/entities/estimates.dart';
import 'package:covid_impact/features/show_estimates/domain/repositories/estimates_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class GetEstimates implements UseCase<Estimates, Params> {
  final EstimatesRepository repository;

  GetEstimates(this.repository);

  @override
  Future<Either<Failure, Estimates>> call(Params params) async {
    return await repository.getEstimates(
        params.name,
        params.avgAge,
        params.avgDailyIncomeInUSD,
        params.avgDailyIncomePopulation,
        params.periodType,
        params.timeToElapse,
        params.reportedCases,
        params.population,
        params.totalHospitalBeds);
  }
}

class Params extends Equatable {
  final String name;
  final double avgAge;
  final double avgDailyIncomeInUSD;
  final double avgDailyIncomePopulation;
  final String periodType;
  final int timeToElapse;
  final int reportedCases;
  final int population;
  final int totalHospitalBeds;

  Params({
    @required this.name,
    @required this.avgAge,
    @required this.avgDailyIncomeInUSD,
    @required this.avgDailyIncomePopulation,
    @required this.periodType,
    @required this.timeToElapse,
    @required this.reportedCases,
    @required this.population,
    @required this.totalHospitalBeds,
  });

  @override
  List<Object> get props => [
        name,
        avgAge,
        avgDailyIncomeInUSD,
        avgDailyIncomePopulation,
        periodType,
        timeToElapse,
        reportedCases,
        population,
        totalHospitalBeds
      ];
}
