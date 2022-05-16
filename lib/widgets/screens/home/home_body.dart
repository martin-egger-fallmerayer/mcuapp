import 'package:flutter/material.dart';
import 'package:mcuapp/data/movie.dart';
import 'package:mcuapp/styles/text.dart';
import 'package:mcuapp/widgets/ui/cards/next_movie_card.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  // late Future<List<Movie>> _movies;
  late Future<List<Movie>> _futureMovies;
  late Future<Movie> _nextMovie;
  // final String cacheKey = "mcuapi-movies";

  @override
  Widget build(BuildContext context) {
    // _movies = Movie.fetchMovies;
    _futureMovies = Movie.fetchFutureMovies;
    _nextMovie = Movie.fetchNextMovie;

    return FutureBuilder<Movie>(
      future: _nextMovie,
      builder: (context, snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Announcement
            Header1(
              "Coming out in ${Movie.calcRemainingDays(snapshot.data?.releaseDate)} days...",
            ),

            // Big Movie Card
            NextMovieCard(movie: snapshot.data!),

            // Next Movies Title
            const Header1("Up next..."),

            // Next Movies
            // FutureBuilder<List<Movie>>(
            //   future: _futureMovies,
            //   builder: (context, snapshot) {
            //     // if (!snapshot.hasData) return Container();
            //     return ListView.builder(
            //       scrollDirection: Axis.vertical,
            //       shrinkWrap: true,
            //       itemCount: snapshot.data!.length,
            //       itemBuilder: (context, index) {
            //         return RoundedMovieCard(movie: snapshot.data![index]);
            //       },
            //     );
            //   },
            // ),
          ],
        );
      },
    );
  }
}
