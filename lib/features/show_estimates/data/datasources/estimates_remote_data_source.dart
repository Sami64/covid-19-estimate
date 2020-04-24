import 'package:covid_impact/features/show_estimates/data/models/estimates_model.dart';

abstract class EstimatesRemoteDataSource {
  ///Calls the https://covid-19-dev-c/api/v1/on-covid-19 endpoint
  ///
  ///Throws [ServerExceptioin] for all errors
  Future<EstimatesModel> getEstimates(
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