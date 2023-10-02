import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:super_heros/domain/model/super_hero_model.dart';

abstract class HeroesState extends Equatable {
  final List<SuperHeroModel> heroes;
  final DioException? error;

  const HeroesState({this.heroes = const [], this.error});
  @override
  List<Object?> get props => [heroes, error];
}

class InitialHeroesState extends HeroesState {
  const InitialHeroesState();
}
class LoadingHeroesState extends HeroesState {
  const LoadingHeroesState();
}
class HeroesStateSuccess extends HeroesState {
  const HeroesStateSuccess({super.heroes});
}
class HeroesStateFailed extends HeroesState {
  const HeroesStateFailed({super.error});
}
