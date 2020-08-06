import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
  Character(this.id, this.name);

  int id;
  String name;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}

@JsonSerializable()
class Characters{
  Characters(this.results);

  List<Character> results;

  factory Characters.fromJson(Map<String, dynamic> json) =>
      _$CharactersFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersToJson(this);
}