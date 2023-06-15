import 'package:lemon/models/Character.dart';

class CharacterList {
  List<Character> characters = [];
  int total;
  int pages;
  String? next;
  String? prev;

  CharacterList({
    required this.characters,
    this.total = 0,
    this.pages = 0,
    this.next = "",
    this.prev = "",
  });

  factory CharacterList.fromJson(Map<String, dynamic> json) {
    List<Character> characters = [];
    json['results'].forEach((element) {
      characters.add(Character.fromJson(element));
    });
    return CharacterList(
      characters: characters,
      total: json['info']['count'],
      pages: json['info']['pages'],
    );
  }
}
