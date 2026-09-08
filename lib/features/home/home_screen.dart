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
            const Text('Ngao Phase 1: navigation and theme scaffold.'),
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