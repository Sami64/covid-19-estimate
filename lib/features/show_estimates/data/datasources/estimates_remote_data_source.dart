import 'dart:convert';

import 'package:covid_impact/core/error/exception.dart';
import 'package:covid_impact/features/show_estimates/data/models/estimates_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

abstract class EstimatesRemoteDataSource {
  ///Calls the https://covid-19-dev-c.herokuapp.com/api/v1/on-covid-19 endpoint
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
      int totalHospitalBeds);
}

class EstimatesRemoteDataSourceImpl implements EstimatesRemoteDataSource {
  final http.Client client;

  EstimatesRemoteDataSourceImpl({@required this.client});

  @override
  Future<EstimatesModel> getEstimates(
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
    final response = await client.post(
      'https://covid-19-dev-c.herokuapp.com/api/v1/on-covid-19',
      body: {
        'region': {
              'name': name,
              'avgAge': avgAge,
              'avgDailyIncomeInUSD': avgDailyIncomeInUSD,
              'avgDailyIncomePopulation': avgDailyIncomePopulation
            },
            'periodType': periodType,
            'timeToElapse': timeToElapse,
            'reportedCases': reportedCases,
            'population': population,
            'totalHospitalBeds': totalHospitalBeds
      }
    );

    if(response.statusCode == 200){
      return EstimatesModel.fromJson(json.decode(response.body));
    }else {
      throw ServerException();
    }
  }
}
