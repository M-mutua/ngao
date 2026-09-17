import 'package:flutter_test/flutter_test.dart';
import 'package:ngao/app/app.dart';
import 'package:ngao/core/storage/repositories/repositories.dart';
import 'package:ngao/shared/models/protection_plan.dart';
import 'package:ngao/shared/models/user.dart';

void main() {
  testWidgets('app launches to the welcome screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      NgaoApp(
        userRepository: _FakeUserRepository(),
        protectionPlanRepository: _FakeProtectionPlanRepository(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Ngao'), findsOneWidget);
    expect(find.text('Welcome to Ngao'), findsOneWidget);
    expect(find.text('Display name'), findsOneWidget);
  });
}

class _FakeUserRepository implements UserRepository {
  @override
  Future<void> deleteById(String id) async {}

  @override
  Future<User?> findById(String id) async => null;

  @override
  Future<void> save(User user) async {}
}

class _FakeProtectionPlanRepository implements ProtectionPlanRepository {
  @override
  Future<void> deleteById(String id) async {}

  @override
  Future<ProtectionPlan?> findByUserId(String userId) async => null;

  @override
  Future<void> save(ProtectionPlan plan) async {}
}
