import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';


abstract class BaseState<T> extends Equatable {
  final T? data;
  final DioException? error;

  const BaseState({this.data, this.error});
  List<Object?> get props => [data, error];
}

class InitialState extends BaseState {
  const InitialState();
}

class LoadingState extends BaseState {
  const LoadingState();
}

class SuccessState<T> extends BaseState {
  const SuccessState({required T data}) : super(data: data);
}

class FailedState extends BaseState {
  const FailedState({super.error});
}
