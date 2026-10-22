class TourPackage {
  const TourPackage({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  final String id;
  final String title;
  final String description;
  final int price;
  final String imageUrl;

  String get formattedPrice {
    final digits = price.toString();
    final out = StringBuffer();
    for (var i = 0; i < digits.length; i++) {
      out.write(digits[i]);
      final remaining = digits.length - i - 1;
      if (remaining > 0 && remaining % 3 == 0) out.write('.');
    }
    return 'Rp${out.toString()}';
  }

  static const List<TourPackage> samples = [
    TourPackage(
      id: 'pangandaran',
      title: 'Pantai Pangandaran',
      description: 'Nikmati pasir pantai, ombak yang menenangkan, dan matahari terbenam indah di pesisir selatan Jawa Barat.',
      price: 250000,
      imageUrl: 'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?w=1200',
    ),
    TourPackage(
      id: 'kawah-putih',
      title: 'Kawah Putih Ciwidey',
      description: 'Jelajahi danau kawah eksotis yang dikelilingi kabut tipis dan udara sejuk pegunungan.',
      price: 180000,
      imageUrl: 'https://images.unsplash.com/photo-1472396961693-142e6e269027?w=1200',
    ),
    TourPackage(
      id: 'borobudur',
      title: 'Candi Borobudur',
      description: 'Temukan warisan budaya Indonesia melalui kemegahan candi dan panorama perbukitan yang memesona.',
      price: 320000,
      imageUrl: 'https://images.unsplash.com/photo-1596402184320-417e7178b2cd?w=1200',
    ),
    TourPackage(
      id: 'bromo',
      title: 'Gunung Bromo',
      description: 'Saksikan lanskap vulkanik, lautan pasir, dan panorama matahari terbit yang ikonik.',
      price: 450000,
      imageUrl: 'https://images.unsplash.com/photo-1519681393784-d120267933ba?w=1200',
    ),
  ];
}
