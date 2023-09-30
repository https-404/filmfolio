import 'package:filmfolio/model/Search_Category.dart';

import 'movie_data.dart';

class MainPageData {
  late final List<Movie>? movie;
  final int? page;
  final String? searchCategory;
  final String? searchText;

  MainPageData({
    this.movie,
    this.page,
    this.searchCategory,
    this.searchText,
  });

  MainPageData.initial()
      : movie = [],
        page = 1,
        searchCategory = SearchCategory.popular,
        searchText = '';

  MainPageData copyWith(
      List<Movie> movie, int page, String searchCategory, String searchtext) {
    return MainPageData(
      movie: movie ?? this.movie,
      page: page ?? this.page,
      searchCategory: searchCategory ?? this.searchCategory,
      searchText: searchText ?? this.searchText,
    );
  }
}
