import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webrofm/main.dart';

void main() {
  testWidgets('App loads without errors', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: WebroFMApp(),
      ),
    );
    await tester.pump(const Duration(seconds: 14));
    expect(find.byType(WebroFMApp), findsOneWidget);
  });
}
