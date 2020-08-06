import 'package:dio/dio.dart';
import 'package:flutterapp/character/data/model/character.dart';

class CharacterRepository {
  Future<Character> callId(int value) {
    final url = "https://rickandmortyapi.com/api/character/$value";
    return Dio().get(url).then((value) => Character.fromJson(value.data));
  }

  Future<List<Character>> getList() {
    return Future.delayed(Duration(milliseconds: 2000), () {
      return [
        Character(1, "D"),
        Character(2, "C"),
        Character(3, "R"),
      ];
    });
  }

  Future<Characters> getAll() {
    final url = "https://rickandmortyapi.com/api/character/?species=Human&status=alive";
    return Dio().get(url).then((value) => Characters.fromJson(value.data));
  }
}
