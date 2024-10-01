import 'dart:ffi';

import 'package:parkshare_app/src/service/service.dart';

Future<bool> loginApp(String login, String senha) async {
  Map<String, dynamic> params = {};

  params['login'] = login;
  params['password'] = senha;

  print(params);

  Map<String, dynamic> res = await post("https://parkshare-production.up.railway.app/api/auth/v1/login", params);

  print(res);

  if(res.containsKey("token")){
    return true;
  }

  return false;

}