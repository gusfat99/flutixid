part of 'models.dart';

class Movie extends Equatable {
  final String title;
  final double voteAverage;
  final String posterPath;
  final int id;
  final String backdropPath;

  const Movie(
      {required this.id,
      required this.title,
      required this.voteAverage,
      required this.posterPath,
      required this.backdropPath});

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
      id: json['id'],
      title: json['title'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path']);

  @override
  List<Object> get props => [id, title, voteAverage, posterPath, backdropPath];
}
