import 'domain_enums.dart';

class SoberMessage {
  const SoberMessage({
    required this.id,
    required this.userId,
    required this.type,
    required this.content,
    required this.createdAt,
  });

  final String id;
  final String userId;
  final SoberMessageType type;

  /// Text content or a local audio reference, according to [type].
  final String content;
  final DateTime createdAt;
}
