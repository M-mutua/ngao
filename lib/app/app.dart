import 'package:flutter/material.dart';
import '../core/storage/repositories/repositories.dart';
import 'router.dart';
import 'theme/app_theme.dart';

class NgaoApp extends StatelessWidget {
  const NgaoApp({
    super.key,
    required this.userRepository,
    required this.protectionPlanRepository,
  });

  final UserRepository userRepository;
  final ProtectionPlanRepository protectionPlanRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Ngao',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: AppRouter.create(
        userRepository,
        protectionPlanRepository,
      ),
    );
  }
}