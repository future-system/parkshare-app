import 'dart:ffi';

import 'package:parkshare_app/src/core/http_client.dart';
import 'package:parkshare_app/src/data/models/login_model/login_model.dart';

class LoginRepository {

  LoginRepository();

  HttpClient httpClient = HttpClient();

  Future<bool> loginApp(LoginModel model) async {
    Map<String, dynamic> res = await httpClient.post(
        "https://parkshare-production.up.railway.app/api/auth/v1/login",
        model.toMap());

    if (res.containsKey("token")) {
      return true;
    }

    return false;
  }

}

