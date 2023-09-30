//imports
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../model/app_config.dart';

//class details
class HttpService {
  final Dio dio = Dio();
  final GetIt getit = GetIt.instance;

  String? _baseURL;
  String? _ApiKey;

  HttpService() {
    AppConfig _config = getit.get<AppConfig>();
    _baseURL = _config.Base_URL;
    _ApiKey = _config.API_key;
  }

  Future<Response> get(String _path, {Map<String, dynamic>? query}) async {
    try {
      String _url = '$_baseURL$_path';
      Map<String, dynamic> _query = {
        'api_key': _ApiKey,
        'language': 'en-US',
      };
      if (query != null) {
        _query.addAll(query);
      }
      return await dio.get(_url, queryParameters: _query);
    } catch (e) {
      print("Unable to perform Get Command");
      print("Request failed!");
      print("DioException Triggered : $e");
    }
    throw Exception("unexpected error occured");
  }
}