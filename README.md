# NusaTravel 💗💙

Aplikasi Flutter bertema **pink dan biru** untuk praktikum Navigation & Routing.

## Color palette
- Royal Blue: `#3155D9`
- Sky Blue: `#7CC8F8`
- Hot Pink: `#E94F9B`
- Soft Pink: `#FFD7E8`
- Background: `#FFF8FC`

## Fitur
- Splash screen dengan `pushReplacementNamed()`.
- Home screen dengan 4 paket wisata Indonesia.
- Detail menggunakan `pushNamed()` dan `arguments`.
- Booking form dengan nama, jumlah peserta, dan tanggal.
- `Navigator.push()` dan `Navigator.pop()` untuk hasil booking.
- `PopScope` dengan dialog konfirmasi saat Back.
- `SnackBar` setelah booking berhasil.
- Logout dengan `pushNamedAndRemoveUntil()`.
- `initialRoute`, `routes`, `onGenerateRoute`, dan `onUnknownRoute`.
- Error 404 / Not Found.

## Jalankan di web
Jika folder `web/` belum ada, jalankan:
```bash
flutter create --platforms=web .
flutter pub get
flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080
```
Buka `http://localhost:8080`.

## Validasi
```bash
dart format lib test
flutter analyze
flutter test
```

## Screenshot pengumpulan
Ambil screenshot asli setelah aplikasi berjalan dan simpan di `screenshots/`:
`splash.png`, `home.png`, `detail.png`, `booking.png`, `booking_back_dialog.png`, `booking_success_snackbar.png`, `logout.png`, `not_found.png`.
Screenshot tidak disertakan sebelum benar-benar diambil dari browser/emulator.

## Upload ke GitHub
```bash
git init
git add .
git commit -m "Create NusaTravel pink blue Flutter app"
git branch -M main
git remote add origin https://github.com/USERNAME/nusa_travel.git
git push -u origin main
```
Ganti `USERNAME` dengan username GitHub. Ini simulasi booking praktikum, bukan layanan reservasi nyata.
