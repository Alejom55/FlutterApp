import 'package:flutter/material.dart';
import 'package:myapp/pages/counter/counter_screen.dart';
import 'package:myapp/pages/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:myapp/pages/pokemon/pokemon_screen.dart';
import 'package:myapp/pages/timer/image_screen.dart';

class HomeScreen extends StatelessWidget {
  final int currentIndex;

  HomeScreen({super.key, required this.currentIndex});
  final viewRoutes =  <Widget>[
    const ImageScreen(),
    const ClickCounterApp(),
    const PokemonHome(),
  

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex,children: viewRoutes,),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
      ),
    );
  }
}
