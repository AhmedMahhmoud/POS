import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pos_sys/constants/network/network_info.dart';
import 'package:pos_sys/features/login/Data/datasources/login_remote_datasource.dart';
import 'package:pos_sys/features/login/Data/repositories/login_repo_imp.dart';
import 'package:pos_sys/features/login/Domain/repositories/login_repository.dart';
import 'package:pos_sys/features/login/Domain/usecases/login_usecase.dart';
import 'package:pos_sys/features/login/Presentation/Provider/login_provider.dart';
import 'package:http/http.dart' as http;
import 'package:pos_sys/features/tables/Data/datasources/table_remote_datasource.dart';
import 'package:pos_sys/features/tables/Data/repository/table_repository_imp.dart';
import 'package:pos_sys/features/tables/Domain/repository/table_repository.dart';
import 'package:pos_sys/features/tables/Domain/usecases/get_table_by_branchID.dart';
import 'package:pos_sys/features/tables/Presentation/Provider/table_provider.dart';

final sl = GetIt.instance;

Future<void> intialize() async {
  //! lOGIN - feature
  // Provider
  sl.registerFactory(() => LoginProvider(sl()));
  // Usecases
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  // Repository
  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImp(networkInfo: sl(), remoteDataSource: sl()));
  // Datasources
  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteImp(httpCall: sl()));
  //! Table - feature
  // Provider
  sl.registerFactory(() => TableProvider(getTablesUsecase: sl()));
  // Usecases
  sl.registerLazySingleton(() => GetTablesUsecase(tableRepo: sl()));
  // Repository
  sl.registerLazySingleton<TableRepository>(
      () => TableRepositoryImp(remoteDataSource: sl(), networkInfo: sl()));
  // Datasources
  sl.registerLazySingleton<TableRemoteDataSource>(
      () => TableRemoteImp(httpCall: sl()));

//! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetowrkInfoImp(connectionChecker: sl()));
//! External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  log("Intialized DI success");
}
