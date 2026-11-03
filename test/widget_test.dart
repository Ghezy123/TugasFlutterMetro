import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tugasflutter/main.dart';

void main() {
  testWidgets('Detail Menu Screen Pizza Margherita interactive test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Basic elements
    expect(find.text('Detail Menu'), findsOneWidget);
    expect(find.text('Pizza Margherita'), findsOneWidget);
    expect(find.text('Rp 85.000'), findsOneWidget);
    expect(find.text('4.9'), findsOneWidget);
    expect(find.text('20 menit'), findsOneWidget);
    expect(find.text('280 kal'), findsOneWidget);
    expect(find.text('Deskripsi'), findsOneWidget);

    // Initial state
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('Pesan Sekarang (Rp 85000)'), findsOneWidget);

    // 1. Test Fitur Favorit
    await tester.tap(find.byIcon(Icons.favorite_border));
    await tester.pump();
    expect(find.byIcon(Icons.favorite), findsOneWidget);

    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pump();
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);

    // 2. Test Fitur Jumlah Pesanan & Total Harga
    // Tap + to increment (85000 * 2 = 170000)
    await tester.tap(find.byIcon(Icons.add_circle_outline));
    await tester.pump();
    expect(find.text('2'), findsOneWidget);
    expect(find.text('Pesan Sekarang (Rp 170000)'), findsOneWidget);

    // Tap - to decrement
    await tester.tap(find.byIcon(Icons.remove_circle_outline));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
    expect(find.text('Pesan Sekarang (Rp 85000)'), findsOneWidget);

    // Tap - again (cannot decrease below 1)
    await tester.tap(find.byIcon(Icons.remove_circle_outline));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
    expect(find.text('Pesan Sekarang (Rp 85000)'), findsOneWidget);

    // 3. Test Catatan Pesanan
    await tester.enterText(find.byType(TextField), 'Extra Cheese');
    await tester.pump();
    expect(find.text('Catatan: "Extra Cheese"'), findsOneWidget);
  });
}
