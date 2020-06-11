import 'package:covid_impact/core/network/network_info.dart';
import 'package:covid_impact/features/show_estimates/data/datasources/estimates_local_data_source.dart';
import 'package:covid_impact/features/show_estimates/data/datasources/estimates_remote_data_source.dart';
import 'package:covid_impact/features/show_estimates/data/repositories/estimates_repository_impl.dart';
import 'package:covid_impact/features/show_estimates/domain/repositories/estimates_repository.dart';
import 'package:covid_impact/features/show_estimates/domain/usecases/get_estimates.dart';
import 'package:covid_impact/features/show_estimates/presentation/bloc/show_estimates_bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Features
  //ShowEstimates
  //Bloc
  sl.registerFactory(() => ShowEstimatesBloc(estimate: sl()));

  //use cases
  sl.registerLazySingleton(() => GetEstimates(sl()));

  //repositories
  sl.registerLazySingleton<EstimatesRepository>(() => EstimatesRepositoryImpl(
      localDataSource: sl(), remoteDataSource: sl(), networkInfo: sl()));

  //data sources
  sl.registerLazySingleton<EstimatesRemoteDataSource>(
      () => EstimatesRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<EstimatesLocalDataSource>(
      () => EstimatesLocalDataSourceImpl(sharedPreferences: sl()));

  //core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //external
  final sharedPreferences = SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
