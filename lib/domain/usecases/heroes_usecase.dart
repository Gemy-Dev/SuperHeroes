import 'package:super_heros/core/resources/data_stat.dart';
import 'package:super_heros/core/usecase/usecase.dart';
import 'package:super_heros/domain/model/super_hero_model.dart';
import 'package:super_heros/domain/repository/superhero_repo.dart';

class GetHeroesUsecase
    implements UseCase<DataStat<List<SuperHeroModel>>, void> {
  final ApiRepository _apiRepository;

  GetHeroesUsecase(this._apiRepository);
  @override
  Future<DataStat<List<SuperHeroModel>>> call({void param}) {
    return _apiRepository.getHeroesData();
  }
}
