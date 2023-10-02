import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:super_heros/domain/model/super_hero_model.dart';
import 'package:super_heros/presentation/bloc/base/base_state.dart';

abstract class HeroSearchState extends Equatable {
  final SuperHeroModel? hero;
  final DioException? error;

  const HeroSearchState({this.hero, this.error});
  @override
  List<Object?> get props => [hero, error];
}

class InitialSearchHero extends BaseState<SuperHeroModel> {
  const InitialSearchHero();
}

class LoadingSearchHero extends BaseState<SuperHeroModel> {}

class SearchHeroSuccess extends BaseState<SuperHeroModel> {
  const SearchHeroSuccess({super.data});
}

class SearchHeroFailed extends BaseState<SuperHeroModel> {
  const SearchHeroFailed({super.error});
}
