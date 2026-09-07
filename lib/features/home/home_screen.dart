import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ngao')),
      body: const Center(
        child: Text('Ngao Phase 1: navigation and theme scaffold.'),
      ),
    );
  }
}