import 'package:flutter/material.dart';
import 'package:parkshare_app/src/presentation/pages/home/home_page.dart';
import 'package:parkshare_app/src/presentation/pages/login/login_page.dart';
import 'package:parkshare_app/src/presentation/pages/onboarding/onboarding_page.dart';
import 'package:parkshare_app/src/presentation/pages/signup/signup_page.dart';
import 'package:parkshare_app/src/presentation/pages/vehicle_registration/vehicle_registration_page.dart';

sealed class Navigation {
  static final routing = _Routing();
}

final class _Routing {
  Map<String, WidgetBuilder> get routes => {
        login: (context) => const LoginPage(),
        onboarding: (context) => const OnboardingPage(),
        signup: (context) => const SignupPage(),
        vehicleRegistration: (context) => const VehicleRegistrationPage(),
        home: (context) => const HomePage(),
  };
  final String login = 'login';
  final String signup = 'signup';
  final String onboarding = 'onboarding';
  final String vehicleRegistration = 'vehicle_registration';
  final String home = "home";
}
