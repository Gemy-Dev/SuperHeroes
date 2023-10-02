

// class BaseApiImpl implements BaseApi {


//   BaseApiImpl(this.https);
//   @override
//   Future<List<SuperHeroModel>> getHeroesData() async {
//     try {

//  final url = Uri.parse('$apiUrl/heroes');
//     final respose = await https.get(url, headers: headers);
    
//     if (respose.statusCode == 200) {
     
//       final json = jsonDecode(respose.body) as List;
//       return List.generate(
//         json.length,
//         (index) => SuperHeroModel.fromJson(json[index]),
//       );
//     } else {
//       throw StatusCodeException();
//     }
//     } catch (e) {
//       throw ClientException(e.toString());
//     }
   
//   }

//   @override
//   Future<List<SuperHeroModel>> getvillainsData() {
//     // TODO: implement getvillainsData
//     throw UnimplementedError();
//   }

//   @override
//   Future<SuperHeroModel> searchByHeroName(String name) {
//     // TODO: implement searchByHeroName
//     throw UnimplementedError();
//   }
// }
