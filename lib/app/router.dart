import 'package:go_router/go_router.dart';
import '../core/storage/repositories/repositories.dart';
import 'package:ngao/features/home/component_showcase_screen.dart';
import '../features/home/home_screen.dart';
import '../features/protection/protection_plan_screen.dart';
import '../features/risk/risk_period_screen.dart';
import '../features/trusted_person/trusted_person_screen.dart';
import '../features/onboarding/welcome_screen.dart';

class AppRouter {
  static GoRouter create(
    UserRepository userRepository,
    ProtectionPlanRepository protectionPlanRepository,
    RiskWindowRepository riskWindowRepository,
    TrustedContactRepository trustedContactRepository,
  ) => GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => WelcomeScreen(
          userRepository: userRepository,
          protectionPlanRepository: protectionPlanRepository,
          riskWindowRepository: riskWindowRepository,
          trustedContactRepository: trustedContactRepository,
        ),
      ),
      GoRoute(
        path: '/protection-plan',
        builder: (context, state) => ProtectionPlanScreen(
          protectionPlanRepository: protectionPlanRepository,
          riskWindowRepository: riskWindowRepository,
          returnToHome: state.uri.queryParameters['returnToHome'] == 'true',
        ),
      ),
      GoRoute(
        path: '/risk-period',
        builder: (context, state) => RiskPeriodScreen(
          riskWindowRepository: riskWindowRepository,
          returnToHome: state.uri.queryParameters['returnToHome'] == 'true',
        ),
      ),
      GoRoute(
        path: '/trusted-person',
        builder: (context, state) => TrustedPersonScreen(
          trustedContactRepository: trustedContactRepository,
          returnToHome: state.uri.queryParameters['returnToHome'] == 'true',
        ),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/showcase',
        builder: (context, state) => const ComponentShowcaseScreen(),
),
    ],
  );
}