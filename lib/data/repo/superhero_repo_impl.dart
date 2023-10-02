import 'package:super_heros/core/resources/data_stat.dart';
import 'package:super_heros/data/remote_data/base_remote_api.dart';
import 'package:super_heros/data/repo/base/base_api_repository.dart';
import 'package:super_heros/domain/repository/superhero_repo.dart';

import '../../domain/model/super_hero_model.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final SuperHeroesApiService service;

  ApiRepositoryImpl(this.service);
  @override
  Future<DataStat<List<SuperHeroModel>>> getHeroesData() {
    return getStateOf(request: () => service.getHeroesData());
  }

  @override
  Future<DataStat<List<SuperHeroModel>>> getvillainsData() {
    return getStateOf(request: service.getvillainsData);
  }

  @override
  Future<DataStat<SuperHeroModel>> searchByHeroName(String name) {
    return getStateOf(request: () => service.searchByHeroName(name: name));
  }
}
