import 'package:covid_impact/core/error/failures.dart';
import 'package:covid_impact/core/estimates/domain/entities/estimates_data.dart';
import 'package:covid_impact/core/estimates/domain/repositories/estimates_data_repository.dart';
import 'package:covid_impact/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class GetInput implements UseCase<EstimatesData, Params> {
  final EstimatesDataRepository estimatesDataRepository;
  GetInput(this.estimatesDataRepository);

  @override
  Future<Either<Failure, EstimatesData>> call(Params params) async {
    return await estimatesDataRepository.getInput(
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
  final int avgAge;
  final int avgDailyIncomeInUSD;
  final double avgDailyIncomePopulation;
  final String periodType;
  final int timeToElapse;
  final int reportedCases;
  final int population;
  final int totalHospitalBeds;

  Params({
    @required String this.name,
    @required int this.avgAge,
    @required int this.avgDailyIncomeInUSD,
    @required double this.avgDailyIncomePopulation,
    @required String this.periodType,
    @required int this.timeToElapse,
    @required int this.reportedCases,
    @required int this.population,
    @required int this.totalHospitalBeds
  });

  @override
  List<Object> get props => [
    name,
    avgAge,
    avgDailyIncomePopulation,
    avgDailyIncomeInUSD,
    periodType,
    timeToElapse,
    reportedCases,
    population,
    totalHospitalBeds
  ];
}