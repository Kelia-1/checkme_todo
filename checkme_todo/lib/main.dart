import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(CheckMeApp());
}

class CheckMeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CheckMe – by Ihirwe Kellia',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          elevation: 0,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Colors.indigo,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
      home: LoginScreen(),
    );
  }
}