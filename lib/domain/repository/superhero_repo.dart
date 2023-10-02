import 'package:super_heros/core/resources/data_stat.dart';

import '../model/super_hero_model.dart';


abstract class ApiRepository {
  Future<DataStat<List<SuperHeroModel>>> getHeroesData();
 Future<DataStat<List<SuperHeroModel>>> getvillainsData();
 Future<DataStat<SuperHeroModel>> searchByHeroName(String name);
}


