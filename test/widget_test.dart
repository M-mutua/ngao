import 'package:flutter_test/flutter_test.dart';
import 'package:ngao/app/app.dart';

void main() {
  testWidgets('app launches to the Ngao home screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const NgaoApp());

    expect(find.text('Ngao'), findsOneWidget);
    expect(
      find.text('Ngao Phase 1: navigation and theme scaffold.'),
      findsOneWidget,
    );
  });
}
