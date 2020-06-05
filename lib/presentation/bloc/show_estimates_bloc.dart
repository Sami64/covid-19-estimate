import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid_impact/features/show_estimates/domain/entities/estimates.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'show_estimates_event.dart';
part 'show_estimates_state.dart';

class ShowEstimatesBloc extends Bloc<ShowEstimatesEvent, ShowEstimatesState> {
  @override
  ShowEstimatesState get initialState => ShowEstimatesInitial();

  @override
  Stream<ShowEstimatesState> mapEventToState(
    ShowEstimatesEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
