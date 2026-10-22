import 'package:flutter_test/flutter_test.dart';
import 'package:nusa_travel/models/tour_package.dart';

void main() {
  test('TourPackage formats price in Indonesian rupiah', () {
    const package = TourPackage(id: 'test', title: 'Test', description: 'Description', price: 150000, imageUrl: '');
    expect(package.formattedPrice, 'Rp150.000');
  });

  test('sample package list contains at least four destinations', () {
    expect(TourPackage.samples.length, greaterThanOrEqualTo(4));
  });
}
