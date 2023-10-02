import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:super_heros/data/remote_data/base_remote_api.dart';
import 'package:super_heros/domain/repository/superhero_repo.dart';
import 'package:super_heros/domain/usecases/heroes_usecase.dart';
import 'package:super_heros/domain/usecases/search_hero_usecase.dart';
import 'package:super_heros/domain/usecases/villain_usecase.dart';
import 'package:super_heros/presentation/bloc/hero_search.dart/hero_search_cubit.dart';
import 'package:super_heros/presentation/bloc/heros_bloc/heroes_cubit.dart';
import 'package:super_heros/presentation/bloc/villain_bloc/villain_cubit.dart';

import 'data/repo/superhero_repo_impl.dart';

final sl = GetIt.instance;
Future<void> initDependency() async {
  sl.registerFactory(() => HeroesCubit(sl()));
  sl.registerFactory(() => VillainCubit(sl()));
  sl.registerFactory(() => HeroSearchCubit(sl()));

  sl.registerLazySingleton(() => GetHeroesUsecase(sl()));
  sl.registerLazySingleton(() => GetvillainUseCase(sl()));
  sl.registerLazySingleton(() => SearchHeroUseCase(sl()));
  sl.registerLazySingleton<ApiRepository>(() => ApiRepositoryImpl(sl()));
  sl.registerLazySingleton(() => SuperHeroesApiService(sl()));
  sl.registerLazySingleton(() => CopyService(sl()));
  final dio = Dio();
  sl.registerLazySingleton<Dio>(() => dio);
}
