import '../../../shared/models/intervention_event.dart';
import '../../../shared/models/protection_plan.dart';
import '../../../shared/models/reflection.dart';
import '../../../shared/models/risk_window.dart';
import '../../../shared/models/sober_message.dart';
import '../../../shared/models/spending_event.dart';
import '../../../shared/models/trusted_contact.dart';
import '../../../shared/models/user.dart';

abstract interface class UserRepository { Future<void> save(User user); Future<User?> findById(String id); Future<void> deleteById(String id); }
abstract interface class ProtectionPlanRepository { Future<void> save(ProtectionPlan plan); Future<ProtectionPlan?> findByUserId(String userId); Future<void> deleteById(String id); }
abstract interface class RiskWindowRepository { Future<void> save(RiskWindow window); Future<List<RiskWindow>> listByUserId(String userId); Future<void> deleteById(String id); }
abstract interface class TrustedContactRepository { Future<void> save(TrustedContact contact); Future<List<TrustedContact>> listByUserId(String userId); Future<void> deleteById(String id); }
abstract interface class SoberMessageRepository { Future<void> save(SoberMessage message); Future<List<SoberMessage>> listByUserId(String userId); Future<void> deleteById(String id); }
abstract interface class InterventionRepository { Future<void> save(InterventionEvent event); Future<List<InterventionEvent>> listByUserId(String userId); Future<InterventionEvent?> findLatestActiveByUserId(String userId); Future<void> deleteById(String id); }
abstract interface class SpendingRepository { Future<void> save(SpendingEvent event); Future<List<SpendingEvent>> listByUserId(String userId); Future<List<SpendingEvent>> listByProtectionPlanId(String planId); Future<void> deleteById(String id); }
abstract interface class ReflectionRepository { Future<void> save(Reflection reflection); Future<Reflection?> findByInterventionEventId(String interventionEventId); Future<void> deleteById(String id); }
