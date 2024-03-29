part of 'services.dart';

class MovieService {
  static Future<List<Movie>> getMovieOnPlaying(int page,
      {http.Client? client}) async {
    String url = '$baseUrl/movie/now_playing?language=en&page$page';
    client ??= http.Client();
    http.Response response = await client.get(Uri.parse(url), headers: headers);

    if (response.statusCode != 200) {
      return [];
    }

    var data = json.decode(response.body);
    List result = data['results'];

    return result.map((e) => Movie.fromJson(e)).toList();
  }

  static Future<List<Movie>> getMovieComingSoon(int page,
      {http.Client? client}) async {
    String url = '$baseUrl/movie/upcoming?language=en&page$page';
    client ??= http.Client();
    http.Response response = await client.get(Uri.parse(url), headers: headers);

    if (response.statusCode != 200) {
      return [];
    }

    var data = json.decode(response.body);
    List result = data['results'];
    return result.map((e) => Movie.fromJson(e)).toList();
  }

  static Future<MovieDetail> getDetailMovie(
      {required int movieId, http.Client? client}) async {
    String url = '$baseUrl/movie/$movieId?language=en-US';
    client ??= http.Client();
    http.Response response = await client.get(Uri.parse(url), headers: headers);

    var data = json.decode(response.body);

    List genres = (data as Map<String, dynamic>)['genres'];
    String language = '';

    switch ((data as Map<String, dynamic>)['original_language'].toString()) {
      case 'ja':
        language = "Japanese";
        break;
      case 'id':
        language = "Indonesian";
        break;
      case 'ko':
        language = "Korean";
        break;
      case 'en':
        language = "English";
        break;
    }

    MovieDetail movieDetail = MovieDetail(Movie.fromJson(data),
        genres: genres.map((e) => e['name'].toString()).toList(),
        language: language);
    // print('movieDetail ${movieDetail}');
    return movieDetail;
  }

  static Future<List<Credit>> getCreditMovie(
      {required int movieId, http.Client? client}) async {
    String url = '$baseUrl/movie/$movieId/credits?language=en-US';
    client ??= http.Client();
    http.Response response = await client.get(Uri.parse(url), headers: headers);
    var data = json.decode(response.body);

    if (response.statusCode != 200) {
      return [];
    }
    List cast = data['cast'];

    return cast
        .map((e) => Credit(profilePath: e['profile_path'], name: e['name']))
        .toList();
  }
}
