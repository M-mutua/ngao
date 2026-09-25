import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ngao')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Your plan'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go('/protection-plan?returnToHome=true'),
              child: const Text('Your Protection Plan'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/risk-period?returnToHome=true'),
              child: const Text('Your Risk Period'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/trusted-person?returnToHome=true'),
              child: const Text('Your Trusted Person'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => context.push('/showcase'),
              child: const Text('View component showcase (dev)'),
            ),
          ],
        ),
      ),
    );
  }
}