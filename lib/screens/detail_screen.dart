import 'package:flutter/material.dart';
import '../models/tour_package.dart';
import 'booking_screen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.package});
  final TourPackage package;

  Future<void> _book(BuildContext context) async {
    final result = await Navigator.push<BookingResult>(
      context,
      MaterialPageRoute(builder: (_) => BookingScreen(package: package)),
    );
    if (!context.mounted) return;
    if (result != null) {
      final day = result.departureDate.day.toString().padLeft(2, '0');
      final month = result.departureDate.month.toString().padLeft(2, '0');
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
          backgroundColor: const Color(0xFF3155D9),
          behavior: SnackBarBehavior.floating,
          content: Text('Booking berhasil, ${result.customerName}! $day/$month/${result.departureDate.year}'),
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Destinasi')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 4, 20, 28),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(26),
            child: Image.network(
              package.imageUrl,
              height: 265,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(height: 265, color: const Color(0xFFEAF2FF), child: const Icon(Icons.landscape_rounded, size: 70, color: Color(0xFF3155D9))),
            ),
          ),
          const SizedBox(height: 23),
          Text(package.title, style: const TextStyle(fontSize: 29, fontWeight: FontWeight.w900, color: Color(0xFF202A54))),
          const SizedBox(height: 12),
          Text(package.description, style: const TextStyle(fontSize: 16, height: 1.7, color: Color(0xFF4E5878))),
          const SizedBox(height: 22),
          Container(
            padding: const EdgeInsets.all(19),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFFEAF2FF), Color(0xFFFFE5F0)]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
                  child: const Icon(Icons.sell_rounded, color: Color(0xFF3155D9)),
                ),
                const SizedBox(width: 12),
                const Expanded(child: Text('Harga per peserta', style: TextStyle(fontWeight: FontWeight.w600))),
                Text(package.formattedPrice, style: const TextStyle(color: Color(0xFF3155D9), fontSize: 18, fontWeight: FontWeight.w900)),
              ],
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(height: 54, child: FilledButton.icon(
            onPressed: () => _book(context),
            icon: const Icon(Icons.luggage_rounded),
            label: const Text('Pesan Sekarang', style: TextStyle(fontWeight: FontWeight.w800)),
          )),
        ],
      ),
    );
  }
}
