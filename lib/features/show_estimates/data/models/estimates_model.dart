import 'package:covid_impact/features/show_estimates/data/models/infection_data_model.dart';
import 'package:covid_impact/features/show_estimates/domain/entities/estimates.dart';
import 'package:covid_impact/features/show_estimates/domain/entities/infection_data.dart';
import 'package:meta/meta.dart';

class EstimatesModel extends Estimates {
  EstimatesModel({@required String name,
    @required double avgAge,
    @required double avgDailyIncomeInUSD,
    @required double avgDailyIncomePopulation,
    @required String periodType,
    @required int timeToElapse,
    @required int reportedCases,
    @required int population,
    @required int totalHospitalBeds,
    @required int impactCurrentlyInfected,
    @required InfectionData impact,
    @required InfectionData severe})
      : super(
    name: name,
          avgAge: avgAge,
          avgDailyIncomeInUSD: avgDailyIncomeInUSD,
          avgDailyIncomePopulation: avgDailyIncomePopulation,
          periodType: periodType,
          timeToElapse: timeToElapse,
          reportedCases: reportedCases,
          population: population,
          totalHospitalBeds: totalHospitalBeds,
          impact: impact,
          severe: severe,
        );

  factory EstimatesModel.fromJson(Map<String, dynamic> json) {
    return EstimatesModel(
        name: json['data']['region']['name'],
        avgAge: (json['data']['region']['avgAge'] as num).toDouble(),
        avgDailyIncomeInUSD:
        (json['data']['region']['avgDailyIncomeInUSD'] as num).toDouble(),
        avgDailyIncomePopulation: json['data']['region']
        ['avgDailyIncomePopulation'],
        periodType: json['data']['periodType'],
        timeToElapse: json['data']['timeToElapse'],
        reportedCases: json['data']['reportedCases'],
        population: json['data']['population'],
        totalHospitalBeds: json['data']['totalHospitalBeds'],
        impactCurrentlyInfected: json['impact']['currentlyInfected'],
        impact: InfectionDataModel.fromJson(json['impact']),
        severe: InfectionDataModel.fromJson(json['severeImpact']));
  }


  Map<String, dynamic> toJson() {
    return {
      'data': {
        'region': {
          'name': name,
          'avgAge': avgAge,
          'avgDailyIncomeInUSD': avgDailyIncomeInUSD,
          'avgDailyIncomePopulation': avgDailyIncomePopulation,
        },
        'periodType': periodType,
        'timeToElapse': timeToElapse,
        'reportedCases': reportedCases,
        'population': population,
        'totalHospitalBeds': totalHospitalBeds
      },
      'impact': InfectionDataModel.toJson(impact),
      'severeImpact': InfectionDataModel.toJson(severe)
    };
  }
}
