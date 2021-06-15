import 'package:flutter/material.dart';
import 'package:pokedex_manha/models/pokemon_model.dart';

class AbilityType extends StatelessWidget {
  final PokemonModel? pokemon;
  final String? ability;
  final String? type;

  const AbilityType({
    Key? key,
    this.ability,
    this.pokemon,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        ability!,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      backgroundColor: Colors.black,
    );
  }
}
