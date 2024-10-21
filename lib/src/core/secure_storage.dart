import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Credentials {

final storage = const FlutterSecureStorage();

  Future<void> saveCredentials(String email, String senha) async {
    await storage.write(key: 'email', value: email);
    await storage.write(key: 'password', value: senha);
  }

  Future<Map<String, String?>> getCredentials() async {
    String email = await storage.read(key: 'email') ?? "";
    String senha = await storage.read(key: 'password') ?? "";
    return {'email': email, 'password': senha};
  }

}


