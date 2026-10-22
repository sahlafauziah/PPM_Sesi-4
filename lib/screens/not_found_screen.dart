import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key, this.message = 'Halaman yang kamu cari tidak tersedia.'});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFFEAF2FF), Color(0xFFFFE5F0)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(23),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(28)),
                  child: const Icon(Icons.explore_off_rounded, size: 60, color: Color(0xFF3155D9)),
                ),
                const SizedBox(height: 20),
                const Text('404', style: TextStyle(fontSize: 62, fontWeight: FontWeight.w900, color: Color(0xFF3155D9))),
                const Text('Oops! Halaman tidak ditemukan', textAlign: TextAlign.center, style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900, color: Color(0xFF202A54))),
                const SizedBox(height: 10),
                Text(message, textAlign: TextAlign.center, style: const TextStyle(height: 1.5)),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (route) => false),
                  icon: const Icon(Icons.home_rounded),
                  label: const Text('Kembali ke Beranda'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
