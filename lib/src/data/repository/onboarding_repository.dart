import 'package:parkshare_app/src/core/constants/endpoints.dart';
import 'package:parkshare_app/src/core/http_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingRepository {
  OnboardingRepository();

  HttpClient httpClient = HttpClient();

  Future<bool> createClient() async {
    final SharedPreferences token = await SharedPreferences.getInstance();

    Map<String, dynamic> res = await httpClient.post(
        Endpoints.url.registerClient, parameters: null,
        token: token.getString("token"));

    if(res.containsKey("idClient")){
      return true;
    }

    return false;
  }

  Future<bool> createAssociated() async {
    final SharedPreferences token = await SharedPreferences.getInstance();

    Map<String, dynamic> res = await httpClient.post(
        Endpoints.url.registerAssociated, parameters: null,
        token: token.getString("token"));

    if(res.containsKey("idAssociated")){
      return true;
    }

    return false;
  }
}
