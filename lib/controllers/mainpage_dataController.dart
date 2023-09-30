import 'package:filmfolio/model/mainpage_data.dart';
import 'package:filmfolio/model/movie_data.dart';
import 'package:filmfolio/service/movie_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class MainPageDataController extends StateNotifier<MainPageData>{
  MainPageDataController([MainPageData? state]) : super(state ?? MainPageData.initial()) {
    getMovies();
  }

  final MovieService _movieService =  GetIt.instance.get<MovieService>();

  Future<void> getMovies () async {
    try {
      List<Movie> _movies = [];
    _movies = await _movieService.getPopularMovie(page: state.page);
    } catch (e) {

    }
  }




}