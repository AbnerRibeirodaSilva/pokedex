import 'package:flutter/material.dart';

import '../helpers/poke_helper.dart';

class PokeTypeChip extends StatelessWidget {
  final String type;

  const PokeTypeChip({
    Key key,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Text(
        PokeHelper.getIcon(type),
        style: TextStyle(
          fontFamily: 'PokeGoTypes',
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      label: Text(
        type,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      backgroundColor: PokeHelper.getColor(type),
    );
  }
}
