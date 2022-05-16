import 'dart:ui';

import 'package:animated_overflow/animated_overflow.dart';
import 'package:flutter/material.dart';
import 'package:mcuapp/data/movie.dart';

class NextMovieCard extends StatefulWidget {
  // Attributes
  final Movie movie;

  const NextMovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  State<NextMovieCard> createState() => _NextMovieCardState();
}

class _NextMovieCardState extends State<NextMovieCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => _showMovieDetails(context, widget.movie),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.movie.coverUrl!),
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                Text(
                  widget.movie.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 243, 243, 243),
                      fontSize: 24,
                      fontWeight: FontWeight.normal),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    widget.movie.releaseDate!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Color.fromARGB(204, 255, 4, 0),
                        fontSize: 19,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
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
