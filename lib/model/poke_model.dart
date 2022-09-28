import 'dart:convert';

PokeModel welcomeFromJson(String str) => PokeModel.fromJson(json.decode(str));

String welcomeToJson(PokeModel data) => json.encode(data.toJson());

class PokeModel {
  PokeModel({
    required this.pokemon,
  });

  List<Pokemon> pokemon;

  factory PokeModel.fromJson(Map<String, dynamic> json) => PokeModel(
        pokemon:
            List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pokemon": List<dynamic>.from(pokemon.map((x) => x.toJson())),
      };
}

class Pokemon {
  Pokemon({
    required this.id,
    required this.name,
    required this.img,
   
    required this.height,
    required this.weight,
  });

  int id;

  String name;
  String img;
  
  String height;
  String weight;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        
        name: json["name"],
        img: json["img"],
        height: json["height"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "num": num,
        "name": name,
        "img": img,
        "height": height,
        "weight": weight,
       
      };
}

