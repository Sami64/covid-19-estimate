import 'package:covid_impact/core/error/exception.dart';
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
    if (await networkInfo.isConnected) {
      //device online
      try {
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
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      //device offline
      try {
        final localEstimates = await localDataSource.getLastEstimate();
        return Right(localEstimates);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
