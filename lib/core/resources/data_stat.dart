
import 'package:dio/dio.dart';

abstract class DataStat<T> {
  final T? data;
  final DioException? error;

 const  DataStat({this.data, this.error});
}

class DataSuccess<T> extends DataStat<T> {
 const  DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataStat<T> {
 const  DataFailed(DioException failed) : super(error: failed);
}
