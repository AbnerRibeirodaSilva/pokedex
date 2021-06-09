import 'package:dartz/dartz.dart';
import 'package:pokedex_manha/core/errors.dart';
import 'package:pokedex_manha/models/pokemon_model.dart';

abstract class PokeRepository {
  Future<Either<Failure, List<PokemonModel>>> fetch(
      {int offset = 0, int limit = 20});
  Future<PokemonModel> fetchByUrl(String url);
}
