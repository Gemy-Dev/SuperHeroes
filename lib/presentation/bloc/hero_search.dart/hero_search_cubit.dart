

import 'package:super_heros/core/resources/data_stat.dart';
import 'package:super_heros/domain/model/super_hero_model.dart';
import 'package:super_heros/domain/usecases/search_hero_usecase.dart';
import 'package:super_heros/presentation/bloc/base/base_cubit.dart';
import 'package:super_heros/presentation/bloc/base/base_state.dart';
import 'package:super_heros/presentation/bloc/hero_search.dart/hero_search_state.dart';

class HeroSearchCubit extends BaseCubit<SuperHeroModel, BaseState> {
  HeroSearchCubit(this._searchHeroUseCase)
      : super(const InitialSearchHero(), SuperHeroModel.fromJson({}));
  final SearchHeroUseCase _searchHeroUseCase;
  Future<void> getSearch(String name) async {
    await run(() async {
      emit(const LoadingState());

      final response = await _searchHeroUseCase(param: name);
      if (response is DataSuccess && response.data != null) {
        final hero = response.data;

        emit(SuccessState(data: hero!));
      } else if (response is DataFailed) {
        emit(FailedState(error: response.error));
      }
    });
  }
}
