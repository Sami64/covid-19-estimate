import 'dart:convert';

import 'package:covid_impact/core/error/exception.dart';
import 'package:covid_impact/features/show_estimates/data/models/estimates_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

abstract class EstimatesLocalDataSource {
  ///Gets the cached [EstimatesModel] the last time
  ///user was connected to the internet
  ///
  ///Throws [CacheException] if not present
  Future<EstimatesModel> getLastEstimate();

  Future<void> cacheEstimates(EstimatesModel estimatesToCache);
}

const CACHED_ESTIMATES = 'CACHED_ESTIMATES';

class EstimatesLocalDataSourceImpl implements EstimatesLocalDataSource {
  final SharedPreferences sharedPreferences;
  EstimatesLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<EstimatesModel> getLastEstimate() {
    final jsonString = sharedPreferences.getString(CACHED_ESTIMATES);
    if (jsonString != null) {
      return Future.value(EstimatesModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheEstimates(EstimatesModel estimatesToCache) {
    return sharedPreferences.setString(
        CACHED_ESTIMATES, json.encode(estimatesToCache.toJson()));
  }
}
