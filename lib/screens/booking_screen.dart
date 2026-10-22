import 'package:flutter/material.dart';
import '../models/tour_package.dart';

class BookingResult {
  const BookingResult({required this.customerName, required this.participantCount, required this.departureDate});
  final String customerName;
  final int participantCount;
  final DateTime departureDate;
}

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key, required this.package});
  final TourPackage package;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _participantController = TextEditingController(text: '1');
  DateTime? _departureDate;
  bool _allowPop = false;
  bool _dialogOpen = false;

  @override
  void dispose() {
    _nameController.dispose();
    _participantController.dispose();
    super.dispose();
  }

  String _dateLabel() {
    final date = _departureDate;
    if (date == null) return 'Pilih tanggal keberangkatan';
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  Future<void> _chooseDate() async {
    final now = DateTime.now();
    final selected = await showDatePicker(
      context: context,
      initialDate: _departureDate ?? DateTime(now.year, now.month, now.day),
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: DateTime(now.year + 3),
      helpText: 'Pilih tanggal keberangkatan',
    );
    if (selected != null && mounted) setState(() => _departureDate = selected);
  }

  Future<void> _confirmBack() async {
    if (_dialogOpen || !mounted) return;
    _dialogOpen = true;
    final shouldCancel = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Batalkan pemesanan?'),
        content: const Text('Data yang sudah diisi akan hilang jika kamu keluar dari halaman ini.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dialogContext, false), child: const Text('Lanjutkan')),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: const Color(0xFFE94F9B)),
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Ya, Batalkan'),
          ),
        ],
      ),
    );
    _dialogOpen = false;
    if (!mounted) return;
    if (shouldCancel == true) {
      setState(() => _allowPop = true);
      Navigator.pop<BookingResult?>(context, null);
    }
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (_departureDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Silakan pilih tanggal keberangkatan.')));
      return;
    }
    final result = BookingResult(
      customerName: _nameController.text.trim(),
      participantCount: int.parse(_participantController.text.trim()),
      departureDate: _departureDate!,
    );
    setState(() => _allowPop = true);
    Navigator.pop<BookingResult>(context, result);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope<BookingResult?>(
      canPop: _allowPop,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && !_allowPop) _confirmBack();
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Form Pemesanan')),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Container(
                padding: const EdgeInsets.all(19),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFFEAF2FF), Color(0xFFFFE5F0)]),
                  borderRadius: BorderRadius.circular(21),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('DESTINASI PILIHAN', style: TextStyle(color: Color(0xFF3155D9), fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 1.2)),
                    const SizedBox(height: 8),
                    Text(widget.package.title, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Color(0xFF202A54))),
                    const SizedBox(height: 5),
                    Text('${widget.package.formattedPrice} / peserta', style: const TextStyle(color: Color(0xFFE94F9B), fontWeight: FontWeight.w800)),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Text('Nama pemesan', style: TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(hintText: 'Nama lengkap', prefixIcon: Icon(Icons.person_outline_rounded)),
                validator: (value) => value == null || value.trim().isEmpty ? 'Nama wajib diisi.' : null,
              ),
              const SizedBox(height: 19),
              const Text('Jumlah peserta', style: TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              TextFormField(
                controller: _participantController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Contoh: 2 orang', prefixIcon: Icon(Icons.groups_2_outlined)),
                validator: (value) {
                  final count = int.tryParse(value?.trim() ?? '');
                  return count == null || count < 1 ? 'Masukkan jumlah peserta minimal 1.' : null;
                },
              ),
              const SizedBox(height: 19),
              const Text('Tanggal keberangkatan', style: TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: _chooseDate,
                icon: const Icon(Icons.calendar_month_rounded),
                label: Text(_dateLabel()),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF3155D9),
                  side: const BorderSide(color: Color(0xFFB8C9F7)),
                  padding: const EdgeInsets.all(17),
                  alignment: Alignment.centerLeft,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(height: 54, child: FilledButton(
                onPressed: _submit,
                child: const Text('Konfirmasi Pemesanan', style: TextStyle(fontWeight: FontWeight.w800)),
              )),
              const SizedBox(height: 12),
              Text('Pemesanan ini merupakan simulasi untuk kebutuhan praktikum.', style: TextStyle(color: Colors.blueGrey.shade600, height: 1.5)),
            ],
          ),
        ),
      ),
    );
  }
}
