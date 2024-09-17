import 'package:flutter/material.dart';
import 'package:parkshare_app/src/presentation/pages/login/login_page.dart';

sealed class Navigation {
  static final routing = _Routing();
}

final class _Routing {
  final Map<String, WidgetBuilder> routes = {
    'login': (context) => const LoginPage(),
  };
  final String login = 'login';
}
