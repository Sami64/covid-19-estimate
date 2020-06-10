import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid_impact/core/error/failures.dart';
import 'package:covid_impact/features/show_estimates/domain/entities/estimates.dart';
import 'package:covid_impact/features/show_estimates/domain/usecases/get_estimates.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'show_estimates_event.dart';
part 'show_estimates_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class ShowEstimatesBloc extends Bloc<ShowEstimatesEvent, ShowEstimatesState> {
  final GetEstimates getEstimates;

  ShowEstimatesBloc({@required GetEstimates estimate})
      : assert(estimate != null),
        getEstimates = estimate;

  @override
  ShowEstimatesState get initialState => ShowEstimatesInitial();

  @override
  Stream<ShowEstimatesState> mapEventToState(
    ShowEstimatesEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is GetEstimatesForUser) {
      yield ShowEstimatesLoading();
      final failureOrEstimate = await getEstimates(EstimateParams(
          name: event.name,
          avgAge: event.avgAge,
          avgDailyIncomeInUSD: event.avgDailyIncomeInUSD,
          avgDailyIncomePopulation: event.avgDailyIncomePopulation,
          timeToElapse: event.timeToElapse,
          periodType: event.periodType,
          reportedCases: event.reportedCases,
          totalHospitalBeds: event.totalHospitalBeds,
          population: event.population));

      yield failureOrEstimate.fold(
              (fail) => ShowEstimatesError(message: _mapFailureToMessage(fail)),
              (estimate) => ShowEstimatesLoaded(estimates: estimate));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected';
    }
  }
}
