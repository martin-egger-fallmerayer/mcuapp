import 'package:flutter/material.dart';
import 'package:mcuapp/data/movie.dart';
import 'package:mcuapp/styles/text.dart';
import 'package:mcuapp/widgets/ui/cards/next_movie_card.dart';
import 'package:mcuapp/widgets/ui/cards/rounded_movie_card.dart';
import 'package:responsive_grid/responsive_grid.dart';

class MoviesBody extends StatefulWidget {
  const MoviesBody({Key? key}) : super(key: key);
  @override
  State<MoviesBody> createState() => _MoviesBodyState();
}

class _MoviesBodyState extends State<MoviesBody> {
  late Future<List<Movie>> _movies;
  //late Future<List<Movie>> _futureMovies;
  //late Future<Movie> _nextMovie;
  // final String cacheKey = "mcuapi-movies";

  @override
  Widget build(BuildContext context) {
    _movies = Movie.fetchMovies;
    //_futureMovies = Movie.fetchFutureMovies;
    //_nextMovie = Movie.fetchNextMovie;

    return FutureBuilder(
      future: _movies,
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          children = snapshot.data?.map((movie) => RoundedMovieCard(movie: movie));
        } else if (snapshot.hasError) {
          children = <Widget>[const Text("Error")];
        } else {
          children = <Widget>[
            const SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
          ];
        }
        return ResponsiveGridList(desiredItemWidth: 100, children: children);
      },
    );
  }
}
