import 'package:dio/dio.dart';

final dio = Dio();

Future<Map<String,dynamic>> get(String url) async {

  Response res = await dio.get(url);

  return res.data;
}

Future<Map<String,dynamic>> post(String url, Map<String, dynamic> parameters) async {

  Response res = await dio.post(url, data: parameters);

  return res.data;
}

put(String url){

}

delete(String url){

}