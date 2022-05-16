import 'package:flutter/material.dart';
import 'package:mcuapp/widgets/screens/movies/movies_body.dart';
import 'package:mcuapp/widgets/ui/cards/rounded_movie_card.dart';
import 'package:responsive_grid/responsive_grid.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MoviesBody()
    );
  }
}