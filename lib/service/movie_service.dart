
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

import '../model/movie_data.dart';
import 'httpService.dart';

class MovieService {
  final GetIt getIt = GetIt.instance;
  HttpService? _http;

  MovieService() {
    _http = getIt.get<HttpService>();
  }

  Future<List<Movie>> getPopularMovie({ int? page}) async {
    Response? _response = await _http?.get('/movie/popular', query: {
      'page': page,
    });
    if(_response?.statusCode == 200){
      Map _data = _response?.data;
      List<Movie> _movies = _data['results'].Map<Movie>((_movieData){
        return Movie.fromJson(_movieData);
      }).toList();
      return _movies;
    } else {
      throw Exception('Could\'t Load Popular Movies! Exception Thrown');
    }
  }
}