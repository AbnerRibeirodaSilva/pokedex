import 'package:flutter/material.dart';

class ResearchInputField extends StatelessWidget {
  const ResearchInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Buscar Pokémon',
      ),
    );
  }
}
