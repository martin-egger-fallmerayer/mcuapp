import 'package:animated_overflow/animated_overflow.dart';
import 'package:flutter/material.dart';
import 'package:mcuapp/data/movie.dart';

class RoundedMovieCard extends StatelessWidget {
  final Movie movie;

  const RoundedMovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showMovieDetails(context, movie),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: SizedBox(
          height: 180,
          child: AspectRatio(
            aspectRatio: 764 / 1132,
            child: Image.network(movie.coverUrl!),
          ),
        ),
      ),
    );
  }

  _showMovieDetails(BuildContext context, Movie movie) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      final Movie _movie = movie;
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(_movie.coverUrl!))),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  AnimatedOverflow(
                    animatedOverflowDirection:
                        AnimatedOverflowDirection.HORIZONTAL,
                    maxWidth: MediaQuery.of(context).size.width,
                    padding: 20.0,
                    speed: 50.0,
                    child: Text(
                      _movie.title,
                      maxLines: 2,
                      softWrap: false,
                      style: const TextStyle(
                          color: Colors.white,
                          overflow: TextOverflow.fade,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _movie.directedBy!,
                          style: const TextStyle(
                              color: Color.fromARGB(204, 175, 13, 10),
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          _movie.releaseDate!,
                          style: const TextStyle(
                              color: Color.fromARGB(204, 175, 13, 10),
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.only(top: 20, bottom: 30),
                  ),
                  Text(
                    _movie.overview!,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 217, 217, 217),
                        fontSize: 19,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }));
  }
}
