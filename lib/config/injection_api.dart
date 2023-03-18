import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:profiledevtest/feature/home/cubit/profile_cubit.dart';
import 'package:profiledevtest/feature/home/data/remote_data_source/remote_data_source.dart';
import 'package:profiledevtest/feature/home/data/remote_data_source/remote_data_source_impl.dart';

import '../feature/home/data/repositories/profile_repository_impl.dart';
import '../feature/home/domain/repositories/home_profile_repository.dart';
import '../feature/home/domain/usecases/get_all_user_usecase.dart';
import 'api/api_config.dart';

final sl = GetIt.instance;

Future<void> init() async {
//bloc
  sl.registerFactory<ProfileCubit>(
    () => ProfileCubit(getAllUsersUseCase: sl.call()),
  );

  //profile cubit usecase
  sl.registerLazySingleton(
      () => GetAllUsersUseCase(homeProfileRepository: sl.call()));

  //Repositories
  sl.registerLazySingleton<HomeProfileRepository>(() => ProfileRepositoryHomeImpl(remoteDataSourceHome: sl.call()));


  //Remote DataSource
  sl.registerLazySingleton<RemoteDataSourceHome>(() => RemoteDataSourceImpl(dio: sl.call()));


  // Register Dio
  sl.registerLazySingleton<Dio>(() {
    final options = BaseOptions(
      baseUrl: API.BASE_URL,
      connectTimeout: 5000,
      receiveTimeout: 5000,
    );
    return Dio(options);
  });
  final dio = Dio();
  GetIt.instance.registerSingleton<Dio>(dio, instanceName: 'apiDio');

  // External
  final api = API();
  sl.registerSingleton(api);

}
