part of 'show_estimates_bloc.dart';

abstract class ShowEstimatesEvent extends Equatable {
  const ShowEstimatesEvent();
}

class GetEstimatesForUser extends ShowEstimatesEvent {
  final String name;
  final double avgAge;
  final double avgDailyIncomeInUSD;
  final double avgDailyIncomePopulation;
  final String periodType;
  final int timeToElapse;
  final int reportedCases;
  final int population;
  final int totalHospitalBeds;

  GetEstimatesForUser(
      this.name,
      this.avgAge,
      this.avgDailyIncomeInUSD,
      this.avgDailyIncomePopulation,
      this.periodType,
      this.timeToElapse,
      this.reportedCases,
      this.population,
      this.totalHospitalBeds);

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
