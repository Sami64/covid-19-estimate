import 'dart:convert';

import 'package:covid_impact/core/error/failures.dart';
import 'package:covid_impact/core/network/network_info.dart';
import 'package:covid_impact/features/show_estimates/data/datasources/estimates_local_data_source.dart';
import 'package:covid_impact/features/show_estimates/data/datasources/estimates_remote_data_source.dart';
import 'package:covid_impact/features/show_estimates/domain/entities/estimates.dart';
import 'package:covid_impact/features/show_estimates/domain/repositories/estimates_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class EstimatesRepositoryImpl implements EstimatesRepository {
  final EstimatesRemoteDataSource remoteDataSource;
  final EstimatesLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  EstimatesRepositoryImpl(
      {@required this.remoteDataSource,
      @required this.localDataSource,
      @required this.networkInfo});

  @override
  Future<Either<Failure, Estimates>> getEstimates(
      String name,
      double avgAge,
      double avgDailyIncomeInUSD,
      double avgDailyIncomePopulation,
      String periodType,
      int timeToElapse,
      int reportedCases,
      int population,
      int totalHospitalBeds) async {
    // TODO: implement getEstimates
    networkInfo.isConnected;

    final remoteEstimates = await remoteDataSource.getEstimates(
        name,
        avgAge,
        avgDailyIncomeInUSD,
        avgDailyIncomePopulation,
        periodType,
        timeToElapse,
        reportedCases,
        population,
        totalHospitalBeds);
        localDataSource.cacheEstimates(remoteEstimates);

    return Right(remoteEstimates);
  }
}
