import 'package:covid_impact/features/show_estimates/data/models/estimates_model.dart';

abstract class EstimatesLocalDataSource {
  ///Gets the cached [EstimatesModel] the last time
  ///user was connected to the internet
  ///
  ///Throws [CacheException] if not present
  Future<EstimatesModel> getLastEstimate();

  Future<void> cacheEstimates(EstimatesModel estimatesToCache);

}