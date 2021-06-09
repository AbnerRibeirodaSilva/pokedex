import 'package:flutter/material.dart';
import 'package:infinite_widgets/infinite_widgets.dart';
import 'package:pokedex_manha/controllers/home_controller.dart';
import 'package:pokedex_manha/pages/detail_page.dart';
import 'package:pokedex_manha/repositories/poke_repository_impl.dart';
import 'package:pokedex_manha/widgets/poke_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController(PokeRepositoryImpl());

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  Future<void> _initialize() async {
    await _controller.fetch();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        child: InfiniteGridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: _buildPokemonCard,
          itemCount: _controller.length,
          hasNext: _controller.length < 1118,
          nextData: _onNextData,
          shrinkWrap: true,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'Pokedex',
        style: TextStyle(
            fontFamily: 'PokemonSolid',
            color: Colors.yellow,
            fontSize: 30,
            letterSpacing: 3,
            shadows: [
              Shadow(offset: Offset(2.0, 2.0), color: Colors.blue),
              Shadow(offset: Offset(2.0, 2.0), color: Colors.blue),
              Shadow(offset: Offset(-2.0, -2.0), color: Colors.blue),
              Shadow(offset: Offset(-2.0, -2.0), color: Colors.blue),
            ]),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(Icons.search))],
    );
  }

  void _onNextData() async {
    await _controller.next();
    setState(() {});
  }

  Widget _buildPokemonCard(BuildContext context, int index) {
    final pokemon = _controller.pokemons[index];
    return PokeCard(
      pokemon: pokemon,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DetailPage(
              pokemon: pokemon,
            ),
          ),
        );
      },
    );
  }
}
