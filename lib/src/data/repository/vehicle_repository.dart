import 'package:parkshare_app/src/core/constants/endpoints.dart';
import 'package:parkshare_app/src/core/http_client.dart';
import 'package:parkshare_app/src/data/models/vehicle__model/vehicle_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VehicleRepository {
  VehicleRepository();

  HttpClient httpClient = HttpClient();

  Future<bool> registerVehicle(VehicleModel model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var res = (await httpClient.post(
      Endpoints.url.vehicle,
      parameters: model.toMap(),
      token: token,
    )).elementAt(0);

    if (res.keys.any((element) => element == "idVehicle")) {
      return true;
    }

    return false;
  }
}
