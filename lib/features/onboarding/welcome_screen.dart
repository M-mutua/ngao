import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/storage/repositories/repositories.dart';
import '../../shared/models/user.dart';
import '../../shared/widgets/ngao_button.dart';
import '../../shared/widgets/ngao_text_field.dart';

// This assumes Ngao supports exactly one local user profile per device; multi-profile support would require revisiting this identifier scheme.
const _currentUserId = 'current-user';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    super.key,
    required this.userRepository,
    required this.protectionPlanRepository,
  });

  final UserRepository userRepository;
  final ProtectionPlanRepository protectionPlanRepository;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _nameController = TextEditingController();
  String? _savedName;
  String? _errorText;
  bool _isLoading = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    try {
      final user = await widget.userRepository.findById(_currentUserId);
      if (!mounted) return;

      if (user != null) {
        final plan = await widget.protectionPlanRepository.findByUserId(
          _currentUserId,
        );
        if (!mounted) return;
        context.go(plan == null ? '/protection-plan' : '/home');
        return;
      }

      setState(() {
        _savedName = user?.displayName;
        _isLoading = false;
      });
    } catch (_) {
      if (!mounted) return;

      setState(() {
        _errorText = 'Could not load your profile.';
        _isLoading = false;
      });
    }
  }

  Future<void> _saveUser() async {
    final displayName = _nameController.text.trim();
    if (displayName.isEmpty) {
      setState(() => _errorText = 'Enter a display name.');
      return;
    }

    setState(() {
      _errorText = null;
      _isSaving = true;
    });

    try {
      await widget.userRepository.save(
        User(
          id: _currentUserId,
          displayName: displayName,
          createdAt: DateTime.now(),
        ),
      );
      if (!mounted) return;

      setState(() {
        _savedName = displayName;
        _isSaving = false;
      });
      _nameController.clear();
      if (mounted) context.go('/protection-plan');
    } catch (_) {
      if (!mounted) return;

      setState(() {
        _errorText = 'Could not save your profile.';
        _isSaving = false;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ngao')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _savedName != null
                    ? Text(
                        'Welcome back, $_savedName',
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Welcome to Ngao',
                            style: Theme.of(context).textTheme.headlineSmall,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          NgaoTextField(
                            label: 'Display name',
                            controller: _nameController,
                            errorText: _errorText,
                          ),
                          const SizedBox(height: 16),
                          NgaoButton(
                            label: _isSaving ? 'Saving...' : 'Save',
                            onPressed: _isSaving ? null : _saveUser,
                          ),
                          if (_errorText != null &&
                              _errorText != 'Enter a display name.')
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Text(
                                _errorText!,
                                textAlign: TextAlign.center,
                              ),
                            ),
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}