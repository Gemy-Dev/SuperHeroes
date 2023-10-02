import '../heros_bloc/heroes_state.dart';

class InitialVillainState extends HeroesState {
  const InitialVillainState();
}
class LoadingVillainState extends HeroesState {
  const LoadingVillainState();
}
class VillainStateSuccess extends HeroesState {
  const VillainStateSuccess({super.heroes});
}
class VillainStateFailed extends HeroesState {
  const VillainStateFailed({super.error});
}