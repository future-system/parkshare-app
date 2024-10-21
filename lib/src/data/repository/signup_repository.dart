import 'package:parkshare_app/src/core/constants/endpoints.dart';
import 'package:parkshare_app/src/core/http_client.dart';
import 'package:parkshare_app/src/data/models/signup_model/signin_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupRepository {
  SignupRepository();

  HttpClient httpClient = HttpClient();

  Future<bool> signupApp(SignupModel model) async {
    final SharedPreferences token = await SharedPreferences.getInstance();

    Map<String, dynamic> res =
        await httpClient.post(Endpoints.url.signin, parameters: model.toMap(), token: null);

    if (res.containsKey("token") &&
        res["token"] is Map<String, dynamic> &&
        res["token"].containsKey("token")) {
      await token.setString("token", res["token"]["token"]);
      await token.setString("expire", res["token"]["expiresAt"] ?? '');

      return true;
    }

    return false;
  }
}
