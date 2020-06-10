import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// Entity class for Infection Data to
/// prevent duplicates in severe and impact fields in
/// [Estimates] entity
class InfectionData extends Equatable {
  final int currentlyInfected;
  final int infectionsByRequestedTime;
  final int severeCasesByRequestedTime;
  final int hospitalBedsByRequestedTime;
  final int casesForICUByRequestedTime;
  final int casesForVentilatorsByRequestedTime;
  final int dollarsInFlight;

  InfectionData(
      {@required this.currentlyInfected,
      @required this.infectionsByRequestedTime,
      @required this.severeCasesByRequestedTime,
      @required this.hospitalBedsByRequestedTime,
      @required this.casesForICUByRequestedTime,
      @required this.casesForVentilatorsByRequestedTime,
      @required this.dollarsInFlight});

  @override
  List<Object> get props => [
        currentlyInfected,
        infectionsByRequestedTime,
        severeCasesByRequestedTime,
        hospitalBedsByRequestedTime,
        casesForICUByRequestedTime,
        casesForVentilatorsByRequestedTime,
        dollarsInFlight
      ];
}
