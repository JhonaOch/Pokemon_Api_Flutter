

import 'package:http/http.dart' as http;
import 'package:flutter_pokemon/model/poke_model.dart';
import 'dart:convert';

class PokeService {
  final url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  Future<PokeModel> getDataPokemon() async {
    final response = await http.get(Uri.parse(url));
    var data;

    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      data = PokeModel.fromJson(jsonMap);
    }else{
      print("error".toString());
    }

    return data;
  }






}
