class PokemonModel {
  final int? id;
  final String? name;
  final int? height;
  final int? weight;
  final String? imageUrl;
  final String? type1;
  final String? type2;
  final int? health;
  final int? attack;
  final int? defense;
  final int? speed;
  final String? ability1;
  final String? ability2;

  const PokemonModel({
    this.id,
    this.name,
    this.height,
    this.weight,
    this.imageUrl,
    this.type1,
    this.type2,
    this.health,
    this.attack,
    this.defense,
    this.speed,
    this.ability1,
    this.ability2,
  });

  factory PokemonModel.fromMap(Map<String, dynamic> json) {
    final typeList = json['types'] as List;
    final statsList = json['stats'] as List;
    final id = json['id'];
    final abilities = json['abilities'] as List;
    return PokemonModel(
      ability1: abilities[0]['ability']['name'],
      ability2: abilities[1]['ability']['name'],
      id: json['id'],
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
      //imageUrl: json['sprites']['front_default'],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png',
      type1: typeList[0]['type']['name'],
      type2: typeList.length == 2 ? typeList[1]['type']['name'] : null,
      health: statsList[0]['base_stat'],
      attack: statsList[1]['base_stat'],
      defense: statsList[2]['base_stat'],
      speed: statsList[5]['base_stat'],
    );
  }
}
