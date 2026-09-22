import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/storage/repositories/repositories.dart';
import '../../core/utils/domain_validation.dart';
import '../../shared/models/trusted_contact.dart';
import '../../shared/widgets/ngao_button.dart';
import '../../shared/widgets/ngao_card.dart';
import '../../shared/widgets/ngao_text_field.dart';
import '../../shared/widgets/status_indicator.dart';

const _currentUserId = 'current-user';
// This assumes the MVP supports one trusted person per user; multiple or historical contacts would require revisiting this identifier scheme.
const _currentTrustedContactId = 'current-user-trusted-contact';

class TrustedPersonScreen extends StatefulWidget {
  const TrustedPersonScreen({
    super.key,
    required this.trustedContactRepository,
  });

  final TrustedContactRepository trustedContactRepository;

  @override
  State<TrustedPersonScreen> createState() => _TrustedPersonScreenState();
}

class _TrustedPersonScreenState extends State<TrustedPersonScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  String? _message;
  bool _isSaving = false;

  Future<void> _saveContact() async {
    final nameError = validateRequiredId(
      _nameController.text,
      fieldName: 'Name',
    );
    final phoneError = validatePhoneNumber(_phoneController.text);
    if (nameError != null || phoneError != null) {
      setState(() => _message = nameError ?? phoneError);
      return;
    }

    setState(() {
      _message = null;
      _isSaving = true;
    });

    try {
      await widget.trustedContactRepository.save(
        TrustedContact(
          id: _currentTrustedContactId,
          userId: _currentUserId,
          name: _nameController.text.trim(),
          phoneNumber: _phoneController.text.trim(),
        ),
      );
      if (mounted) context.go('/home');
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _message = 'Could not save your trusted person.';
        _isSaving = false;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trusted person')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: NgaoCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Add someone you trust',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  NgaoTextField(
                    label: 'Name',
                    controller: _nameController,
                  ),
                  const SizedBox(height: 12),
                  NgaoTextField(
                    label: 'Phone number',
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                  ),
                  if (_message != null) ...[
                    const SizedBox(height: 12),
                    NgaoStatusIndicator(
                      status: NgaoStatus.warning,
                      label: _message!,
                    ),
                  ],
                  const SizedBox(height: 16),
                  NgaoButton(
                    label: _isSaving ? 'Saving...' : 'Save trusted person',
                    onPressed: _isSaving ? null : _saveContact,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}