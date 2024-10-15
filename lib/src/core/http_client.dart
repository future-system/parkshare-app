import 'package:dio/dio.dart';

class HttpClient {
  final dio = Dio();

  final url = "https://parkshare-production.up.railway.app/";

  Future<Map<String, dynamic>> get(String url) async {
    Response res = await dio.get(this.url + url);

    return res.data;
  }

  Future<Map<String, dynamic>> post(String url, Map<String, dynamic> parameters) async {
    Response res = await dio.post(this.url + url, data: parameters);

    return res.data;
  }

  put(String url) {}

  delete(String url) {}
}
