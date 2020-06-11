part of 'show_estimates_bloc.dart';

abstract class ShowEstimatesState extends Equatable {
  const ShowEstimatesState();
}

class ShowEstimatesInitial extends ShowEstimatesState {
  @override
  List<Object> get props => [];
}

class ShowEstimatesLoading extends ShowEstimatesState {
  @override
  List<Object> get props => [];
}

class ShowEstimatesLoaded extends ShowEstimatesState {
  final Estimates estimates;

  ShowEstimatesLoaded({@required this.estimates});

  @override
  List<Object> get props => [estimates];
}

class ShowEstimatesError extends ShowEstimatesState {
  final String message;

  ShowEstimatesError({@required this.message});

  @override
  List<Object> get props => [message];
}