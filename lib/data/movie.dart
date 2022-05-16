import 'dart:convert';
import 'package:http/http.dart' as http;

class Movie {
  final int id;
  final String title;
  final String? releaseDate;
  final String? boxOffice;
  final int? duration;
  final String? overview;
  final String? coverUrl;
  final String? trailerUrl;
  final String? directedBy;
  final int? phase;
  final String? saga;
  final int? chronology;
  final int? postCreditScenes;
  final String? imdbId;

  // Movie(this.id, this.title, this.releaseDate, this.boxOffice, this.duration, this.overview, this.trailerUrl, this.directedBy, this.phase, this.saga, this.chronology, this.postCreditScenes, this.imdbId);

  const Movie(
      {required this.id,
      required this.title,
      required this.releaseDate,
      required this.boxOffice,
      required this.duration,
      required this.overview,
      required this.coverUrl,
      required this.trailerUrl,
      required this.directedBy,
      required this.phase,
      required this.saga,
      required this.chronology,
      required this.postCreditScenes,
      required this.imdbId});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json['id'],
        title: json['title'],
        releaseDate: json['release_date'],
        boxOffice: json['box_office'],
        duration: json['duration'],
        overview: json['overview'],
        coverUrl: json['cover_url'],
        trailerUrl: json['trailer_url'],
        directedBy: json['directed_by'],
        phase: json['phase'],
        saga: json['saga'],
        chronology: json['chronology'],
        postCreditScenes: json['post_credit_scenes'],
        imdbId: json['imdb_id']);
  }

  factory Movie.fromJsonString(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);

    return Movie(
        id: json['id'],
        title: json['title'],
        releaseDate: json['release_date'],
        boxOffice: json['box_office'],
        duration: json['duration'],
        overview: json['overview'],
        coverUrl: json['cover_url'],
        trailerUrl: json['trailer_url'],
        directedBy: json['directed_by'],
        phase: json['phase'],
        saga: json['saga'],
        chronology: json['chronology'],
        postCreditScenes: json['post_credit_scenes'],
        imdbId: json['imdb_id']);
  }

  static int calcRemainingDays(String? dateString) {
    if(dateString == "" || dateString == null) return 0;
    DateTime date = DateTime.parse(dateString);
    return date.difference(DateTime.now()).inDays;
  }

  static Future<List<Movie>> get fetchMovies async {
    List<Movie> movies = [];

    // fetch json from api
    final response =
        await http.get(Uri.parse('https://mcuapi.herokuapp.com/api/v1/movies'));

    // Guard: failed to fetch
    if (response.statusCode != 200) throw Exception('Failed to load movies');

    // extract movie array from data object
    final List<dynamic> moviesAsList = jsonDecode(response.body)['data'];

    // convert each "typeless" movie object to a real movie object
    // and add it to the final list
    for (var movie in moviesAsList) {
      movies.add(Movie.fromJson(movie));
    }

    return movies;
  }

  static Future<List<Movie>> get fetchFutureMovies async {
    final List<Movie> allMovies = await Movie.fetchMovies;
    List<Movie> futureMovies = [];
    for (Movie movie in allMovies) {
      // Guard: If no release date is given
      if (movie.releaseDate == null) continue;
      if (DateTime.parse(movie.releaseDate!).isAfter(DateTime.now())) {
        futureMovies.add(movie);
      }
    }
    return futureMovies;
  }

  static Future<Movie> get fetchNextMovie async {
    List<Movie> futureMovies = await Movie.fetchFutureMovies;
    // print(futureMovies.toString());
    return futureMovies[0];
  }
}
