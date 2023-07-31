part of 'services.dart';

class MovieService {
  static Future<List<Movie>> getMovieOnPlaying(int page, {http.Client? client}) async {
    String url = '$baseUrl/movie/now_playing?language=en&page$page';
    client ??= http.Client();
    http.Response response = await client.get(Uri.parse(url), headers: headers);

    if(response.statusCode != 200) {
      return [];
    }

    var data = json.decode(response.body);
    List result = data['results'];
    return result.map((e) => Movie.fromJson(e)).toList();
  }

  static Future<List<Movie>> getMovieComingSoon(int page, {http.Client? client}) async {
    String url = '$baseUrl/movie/upcoming?language=en&page$page';
    client ??= http.Client();
    http.Response response = await client.get(Uri.parse(url), headers: headers);

    if(response.statusCode != 200) {
      return [];
    }

    var data = json.decode(response.body);
    List result = data['results'];
    return result.map((e) => Movie.fromJson(e)).toList();
  }
}
