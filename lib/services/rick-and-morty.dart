import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lemon/models/CharacterList.dart';

Future<CharacterList> getCharacter(String name, int page) async {
  final uri = Uri.https('rickandmortyapi.com', '/api/character',
      {'name': name, 'page': page.toString()});

  final response = await http.get(uri);

  if (response.statusCode >= 200 && response.statusCode < 300) {
    return CharacterList.fromJson(jsonDecode(response.body));
  }

  return CharacterList(characters: []);
}
