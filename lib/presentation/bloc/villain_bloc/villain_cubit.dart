import 'package:super_heros/core/resources/data_stat.dart';
import 'package:super_heros/domain/usecases/villain_usecase.dart';
import 'package:super_heros/presentation/bloc/base/base_cubit.dart';
import 'package:super_heros/presentation/bloc/base/base_state.dart';

import '../../../domain/model/super_hero_model.dart';

class VillainCubit extends BaseCubit<List<SuperHeroModel>, BaseState> {
  VillainCubit(this._getvillainUseCase) : super(const LoadingState(), []);
  final GetvillainUseCase _getvillainUseCase;

  Future<void> getHeroesData() async {
    if (isBusy) return;
    await run(() async {
      final respose = await _getvillainUseCase();
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
