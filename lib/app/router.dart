import 'package:go_router/go_router.dart';
import '../core/storage/repositories/repositories.dart';
import 'package:ngao/features/home/component_showcase_screen.dart';
import '../features/home/home_screen.dart';
import '../features/protection/protection_plan_screen.dart';
import '../features/onboarding/welcome_screen.dart';

class AppRouter {
  static GoRouter create(
    UserRepository userRepository,
    ProtectionPlanRepository protectionPlanRepository,
  ) => GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => WelcomeScreen(
          userRepository: userRepository,
          protectionPlanRepository: protectionPlanRepository,
        ),
      ),
      GoRoute(
        path: '/protection-plan',
        builder: (context, state) => ProtectionPlanScreen(
          protectionPlanRepository: protectionPlanRepository,
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