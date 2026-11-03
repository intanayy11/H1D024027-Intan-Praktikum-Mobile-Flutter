import 'package:flutter_test/flutter_test.dart';
import 'package:belajar_flutter/main.dart';

void main() {
  testWidgets('App displays List Data Produk', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that "List Data Produk" is displayed.
    expect(find.text('List Data Produk'), findsOneWidget);
    expect(find.text('Kulkas'), findsOneWidget);
  });
}
