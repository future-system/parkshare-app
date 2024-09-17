import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parkshare_app/src/core/constants/design_system.dart';
import 'package:parkshare_app/src/core/navigation.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: DesignSystem.colors.primary,
      theme: ThemeData(
          fontFamily: GoogleFonts.spaceGrotesk().fontFamily,
          primaryColor: DesignSystem.colors.primary,
          colorScheme:
              ColorScheme.fromSeed(seedColor: DesignSystem.colors.primary),
          textTheme: const TextTheme().apply(
            bodyColor: DesignSystem.colors.secondary,
            displayColor: DesignSystem.colors.secondary,
          )),
      routes: Navigation.routing.routes,
      initialRoute: Navigation.routing.login,
    );
  }
}
