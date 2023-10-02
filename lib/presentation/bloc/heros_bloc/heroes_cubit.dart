import 'package:super_heros/core/resources/data_stat.dart';
import 'package:super_heros/domain/model/super_hero_model.dart';
import 'package:super_heros/domain/usecases/heroes_usecase.dart';
import 'package:super_heros/presentation/bloc/base/base_cubit.dart';
import 'package:super_heros/presentation/bloc/base/base_state.dart';

class HeroesCubit extends BaseCubit<List<SuperHeroModel>, BaseState> {
  HeroesCubit(this._heroesUsecase) : super(const LoadingState(), []);
  final GetHeroesUsecase _heroesUsecase;

  Future<void> getHeroesData() async {
    if (isBusy) return;
    await run(() async {
      final respose = await _heroesUsecase();
      if (respose is DataSuccess && respose.data != null) {
        final heroes = respose.data;
        data.addAll(heroes!);
        emit(SuccessState<List<SuperHeroModel>>(data: data));
      } else if (respose is DataFailed) {
        emit(FailedState(error: respose.error));
      }
    });
  }
}
