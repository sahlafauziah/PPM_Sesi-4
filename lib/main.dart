import 'package:flutter/material.dart';
import 'routes/app_routes.dart';

const navyBlue = Color(0xFF3155D9);
const skyBlue = Color(0xFF7CC8F8);
const hotPink = Color(0xFFE94F9B);
const pageBackground = Color(0xFFFFF8FC);

void main() => runApp(const NusaTravelApp());

class NusaTravelApp extends StatelessWidget {
  const NusaTravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = ColorScheme.fromSeed(seedColor: navyBlue).copyWith(
      primary: navyBlue,
      secondary: hotPink,
      tertiary: skyBlue,
      surface: Colors.white,
    );
    return MaterialApp(
      title: 'NusaTravel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: scheme,
        scaffoldBackgroundColor: pageBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: pageBackground,
          foregroundColor: Color(0xFF202A54),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 1,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
            side: const BorderSide(color: Color(0xFFF5E5EF)),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFFFFBFD),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFFE7DDED)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: navyBlue, width: 1.6),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: navyBlue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ),
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      onUnknownRoute: AppRoutes.onUnknownRoute,
    );
  }
}
