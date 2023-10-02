import 'package:super_heros/core/resources/data_stat.dart';
import 'package:super_heros/core/usecase/usecase.dart';
import 'package:super_heros/domain/model/super_hero_model.dart';
import 'package:super_heros/domain/repository/superhero_repo.dart';

class SearchHeroUseCase implements UseCase<DataStat<SuperHeroModel>, String> {
  final ApiRepository _apiRepository;

  SearchHeroUseCase(this._apiRepository);
  
  @override
  Future<DataStat<SuperHeroModel>> call({ String? param})=>  _apiRepository.searchByHeroName(param!);
   

 
     
}
