import 'package:flutter/material.dart';
import 'screen/A1-login.dart';
import 'screen/A2-home.dart';
import 'screen/add_new.dart';
import 'screen/calendar.dart';
import 'screen/profile.dart';
import 'screen/signup.dart';

final ThemeData dueBuddyTheme = ThemeData(
  primaryColor: const Color(0xFF1E88E5),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF1E88E5),
    secondary: Color(0xFF1E88E5),
    background: Color(0xFFFAFAFA),
    surface: Colors.white,
    onPrimary: Colors.white,
    onBackground: Color(0xFF212121),   
    onSurface: Color(0xFF212121),
    error: Color(0xFFD32F2F),
  ),
  scaffoldBackgroundColor: const Color(0xFFFAFAFA),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1E88E5),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: Color(0xFF212121)),
    displayMedium: TextStyle(color: Color(0xFF212121)),
    displaySmall: TextStyle(color: Color(0xFF212121)),
    headlineMedium: TextStyle(color: Color(0xFF212121)),
    headlineSmall: TextStyle(color: Color(0xFF212121)),
    titleLarge: TextStyle(color: Color(0xFF212121)),
    bodyLarge: TextStyle(color: Color(0xFF212121)),
    bodyMedium: TextStyle(color: Color(0xFF212121)),
    titleMedium: TextStyle(color: Color(0xFF757575)),
    titleSmall: TextStyle(color: Color(0xFF757575)),
    bodySmall: TextStyle(color: Color(0xFF757575)),
    labelSmall: TextStyle(color: Color(0xFF757575)),
  ),
  cardTheme: CardTheme(
    elevation: 1,
    margin: const EdgeInsets.all(8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    color: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF1E88E5),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    filled: true,
    fillColor: Colors.white,
  ),
);

void main() {
  runApp(const DueBuddyApp());
}

class DueBuddyApp extends StatelessWidget {
  const DueBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DueBuddy',
      theme: dueBuddyTheme,
      home: const LoginPage(),
      routes: {
        '/home': (context) {
          final username = ModalRoute.of(context)!.settings.arguments as String;
          return HomePage(username: username);
        },
        '/addNew': (context) => const AddNewPage(),
        '/calendar': (context) => const CalendarPage(),
        '/profile': (context) {
          final username = ModalRoute.of(context)!.settings.arguments as String;
          return ProfilePage(username: username);
        },
        '/signup': (context) => const SignUpPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
