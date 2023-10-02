import 'dart:convert';

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:super_heros/core/constant.dart';
import 'package:super_heros/domain/model/super_hero_model.dart';
part 'base_remote_api.g.dart';

@RestApi(baseUrl: apiUrl, parser: Parser.MapSerializable)
abstract class SuperHeroesApiService {
  factory SuperHeroesApiService(Dio dio, {String baseUrl}) =
      _SuperHeroesApiService;

  @GET('/heroes')
  @Headers(headers)
  Future<HttpResponse<List<SuperHeroModel>>> getHeroesData();
  @GET('/heroes')
  @Headers(headers)
  Future<HttpResponse<List<SuperHeroModel>>> getvillainsData();
  @GET('/')
  @Headers(headers)
  Future<HttpResponse<SuperHeroModel>> searchByHeroName(
      {@Query('hero') String? name,
    
      });
}

class CopyService implements SuperHeroesApiService {
  CopyService(this.dio) : super();
  final Dio dio;
  @override
  Future<HttpResponse<List<SuperHeroModel>>> getHeroesData() async {
    final _result = await dio.get(
        //'https://akabab.github.io/superhero-api/api/all.json'
        apiUrl + '/heroes',
        options: Options(
          headers: headers,
        ));
    // print(_result);

    var value = jsonDecode(_result.data)
        .map<SuperHeroModel>((item) => SuperHeroModel.fromJson(item))
        .toList();

    final httpResponse = HttpResponse<List<SuperHeroModel>>(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<List<SuperHeroModel>>> getvillainsData() {
    // TODO: implement getvillainsData
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse<SuperHeroModel>> searchByHeroName({String? name}) {
    // TODO: implement searchByHeroName
    throw UnimplementedError();
  }
}
