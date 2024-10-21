

sealed class Endpoints {
  static final url = _Endpoints();
}

class _Endpoints {
  final baseUrl = "https://parkshare-production.up.railway.app/";
  final login = "api/auth/v1/login";
  final signin = "api/auth/v1/signin";
  final vehicle = "api/v1/vehicle";
  final registerClient = "api/v1/client";
  final registerAssociated = "api/v1/associated";
}