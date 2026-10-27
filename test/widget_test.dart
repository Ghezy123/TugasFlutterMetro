import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tugasflutter/main.dart';

void main() {
  testWidgets('Detail Menu Screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Detail Menu'), findsOneWidget);
    expect(find.text('Pizza Margherita'), findsOneWidget);
    expect(find.text('Rp 85.000'), findsOneWidget);

    expect(find.text('4.9'), findsOneWidget);
    expect(find.text('20 menit'), findsOneWidget);
    expect(find.text('280 kal'), findsOneWidget);

    expect(find.byIcon(Icons.star), findsOneWidget);
    expect(find.byIcon(Icons.access_time), findsOneWidget);
    expect(find.byIcon(Icons.local_fire_department), findsOneWidget);

    expect(find.text('Deskripsi'), findsOneWidget);
    expect(find.text('Pesan Sekarang'), findsOneWidget);
  });
}
