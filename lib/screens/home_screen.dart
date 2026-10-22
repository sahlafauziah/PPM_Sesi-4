import 'package:flutter/material.dart';
import '../models/tour_package.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Keluar dari NusaTravel?'),
        content: const Text('Kamu akan kembali ke halaman awal.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dialogContext, false), child: const Text('Batal')),
          FilledButton(onPressed: () => Navigator.pop(dialogContext, true), child: const Text('Logout')),
        ],
      ),
    );
    if (confirmed == true && context.mounted) {
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.splash, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NusaTravel', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: -.4)),
        actions: [
          IconButton(tooltip: 'Logout', onPressed: () => _logout(context), icon: const Icon(Icons.logout_rounded)),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
        children: [
          Container(
            padding: const EdgeInsets.all(23),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(27),
              gradient: const LinearGradient(
                colors: [Color(0xFF3155D9), Color(0xFF6DADEB), Color(0xFFFFA9CE)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: const [BoxShadow(color: Color(0x223155D9), blurRadius: 18, offset: Offset(0, 9))],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.waving_hand_rounded, color: Colors.white, size: 30),
                SizedBox(height: 14),
                Text('Liburan, versi kamu.', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900)),
                SizedBox(height: 8),
                Text('Pilih destinasi favorit dan ciptakan cerita baru bersama NusaTravel.', style: TextStyle(color: Colors.white, height: 1.5)),
              ],
            ),
          ),
          const SizedBox(height: 28),
          const Row(
            children: [
              Expanded(child: Text('Destinasi pilihan', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF202A54)))),
              Icon(Icons.favorite_rounded, color: Color(0xFFE94F9B)),
            ],
          ),
          const SizedBox(height: 15),
          for (var i = 0; i < TourPackage.samples.length; i++) ...[
            _TourCard(
              package: TourPackage.samples[i],
              accent: i.isEven ? const Color(0xFF3155D9) : const Color(0xFFE94F9B),
              onTap: () => Navigator.pushNamed(context, AppRoutes.detail, arguments: TourPackage.samples[i]),
            ),
            const SizedBox(height: 15),
          ],
        ],
      ),
    );
  }
}

class _TourCard extends StatelessWidget {
  const _TourCard({required this.package, required this.accent, required this.onTap});
  final TourPackage package;
  final Color accent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  package.imageUrl,
                  width: double.infinity,
                  height: 178,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 178,
                    color: const Color(0xFFEAF2FF),
                    child: const Center(child: Icon(Icons.landscape_rounded, size: 56, color: Color(0xFF3155D9))),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
                    decoration: BoxDecoration(color: Colors.white.withValues(alpha: .94), borderRadius: BorderRadius.circular(30)),
                    child: Icon(Icons.favorite_rounded, color: accent, size: 19),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(package.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Color(0xFF202A54))),
                  const SizedBox(height: 7),
                  Text(package.description, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.blueGrey.shade600, height: 1.45)),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Icon(Icons.local_offer_rounded, size: 18, color: accent),
                      const SizedBox(width: 6),
                      Text(package.formattedPrice, style: TextStyle(color: accent, fontSize: 16, fontWeight: FontWeight.w900)),
                      const Spacer(),
                      Text('Detail', style: TextStyle(color: accent, fontWeight: FontWeight.w800)),
                      const SizedBox(width: 4),
                      Icon(Icons.arrow_forward_rounded, size: 18, color: accent),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
