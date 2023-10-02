import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:super_heros/core/resources/data_stat.dart';

abstract class BaseApiRepository {
// this method response for handling request,in which
//it returns generic base dataStat
//

  Future<DataStat<T>> getStateOf<T>(
      {required Future<HttpResponse<T>> Function() request}) async {
    try {
      print('start');
      final httpResponse = await request();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print(httpResponse.response.statusCode);
        return DataSuccess(httpResponse.data);
      } else {
        print(httpResponse.response.statusCode);
        throw DioException(
            requestOptions: httpResponse.response.requestOptions,
            message: httpResponse.response.statusMessage,
            response: httpResponse.response);
      }
    } on DioException catch (error) {
      print(error);
      return DataFailed(error);
    } catch (e) {
      return DataFailed(
          DioException(error: e.toString(), requestOptions: RequestOptions()));
    }
  }
}
