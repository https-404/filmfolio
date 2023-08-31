
import 'package:filmfolio/service/httpService.dart';
import 'package:get_it/get_it.dart';

class MovieService {
  final GetIt getIt = GetIt.instance;
  HttpService? _http;

  MovieService() {
    _http = getIt.get<HttpService>();
  }
}