import 'package:parkshare_app/src/core/constants/endpoints.dart';
import 'package:parkshare_app/src/core/http_client.dart';
import 'package:parkshare_app/src/core/secure_storage.dart';
import 'package:parkshare_app/src/data/models/login_model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  LoginRepository();

  HttpClient httpClient = HttpClient();

  Future<bool> loginApp(LoginModel model) async {
    final SharedPreferences token = await SharedPreferences.getInstance();

    Map<String, dynamic> res =
        await httpClient.post(Endpoints.url.login, parameters:  model.toMap(), token: null);

    if (res.containsKey("token")) {
      await token.setString("token", res["token"]);
      await token.setString("expire", res["expiresAt"]);

      return true;
    }

    return false;
  }

  Future<bool> automaticLogin() async {
    final credenciais = await Credentials().getCredentials();

    LoginModel model = LoginModel(
        email: credenciais['email'] ?? "",
        password: credenciais['password'] ?? "");

    final SharedPreferences token = await SharedPreferences.getInstance();

    Map<String, dynamic> res =
        await httpClient.post(Endpoints.url.login, parameters: model.toMap(), token: null);

    if (res.containsKey("token")) {
      await token.setString("token", res["token"]);
      await token.setString("expire", res["expiresAt"]);

      return true;
    }

    return false;
  }
}
