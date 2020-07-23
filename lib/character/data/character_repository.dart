import 'package:dio/dio.dart';
import 'package:flutterapp/character/data/model/character.dart';

class CharacterRepository {
  Future<Character> call(int value) {
    final url = "https://rickandmortyapi.com/api/character/$value";
    return Dio().get(url).then((value) => Character.fromJson(value.data));
//    final character = Character.fromJson(response.data);
//
//    print(character.id);
//    print(character.name);
  }
}
