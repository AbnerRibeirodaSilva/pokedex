import 'package:flutter/material.dart';

import '../helpers/poke_helper.dart';
import '../models/pokemon_model.dart';

class PokeCard extends StatelessWidget {
  final PokemonModel? pokemon;
  final Function? onPressed;

  const PokeCard({
    Key? key,
    this.pokemon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed as void Function()?,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: PokeHelper.getColor(pokemon!.type1!),
          boxShadow: [
            BoxShadow(
              color: PokeHelper.getColor(pokemon!.type1!).withOpacity(0.5),
              blurRadius: 5.0,
              offset: Offset(3, 2),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              PokeHelper.getColor(pokemon!.type1!),
              PokeHelper.getColor(validatorColorGradient(pokemon!.type2))
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                pokemon!.imageUrl!,
                fit: BoxFit.fill,
              ),
            ),
            Text(pokemon!.name!),
          ],
        ),
      ),
    );
  }

  validatorColorGradient(String? color) {
    if (color == null) {
      return color = 'silver';
    } else {
      return color = color;
    }
  }
}
