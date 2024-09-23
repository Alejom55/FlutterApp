import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PokemonHome extends StatefulWidget {
  const PokemonHome({super.key});

  @override
  _PokemonAppState createState() => _PokemonAppState();
}

class _PokemonAppState extends State<PokemonHome> {
  String? _pokemonName;
  List<String>? _types;
  String? _spriteUrl;
  int? _intPokedex;
  bool _isShiny = false;

 
  Future<void> _fetchPokemon(int id) async {
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'));


    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _pokemonName = data['name'];
        _types = List<String>.from(
            data['types'].map((type) => type['type']['name']));
        _spriteUrl = data['sprites']['other']['showdown']['front_default'];
        _spriteUrl ??= data['sprites']['front_default'];
        _intPokedex = data['id'];
        _isShiny = Random().nextDouble() < 0.1;
        if (_isShiny) {
          _spriteUrl = data['sprites']['other']['showdown']['front_shiny'];
          _spriteUrl ??= data['sprites']['front_shiny'];
        }
      });
    } else {
      throw Exception('Error al cargar Pokémon');
    }
  }

  void _getRandomPokemon() {
    final randomId = Random().nextInt(1024) + 1;
    _fetchPokemon(randomId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokémon Randomizer')),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            if (_pokemonName != null) ...[
              Text('Pokedex: #${_intPokedex!}'),
              Text('Name: ${_pokemonName!}'),
              if (_types != null) Text('Types: ${_types!.join(', ')}'),
              if (_spriteUrl != null) Image.network(_spriteUrl!),
              if (_isShiny)
                const Text('¡Shiny!',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold)),
            ],
            const SizedBox(height: 20),
            
            ElevatedButton(
              onPressed: _getRandomPokemon,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.refresh),
                  SizedBox(width: 5,),
                  Text('Search Pokémon'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
