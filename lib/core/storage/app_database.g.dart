// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, displayName, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final String id;
  final String displayName;
  final DateTime createdAt;
  const User({
    required this.id,
    required this.displayName,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['display_name'] = Variable<String>(displayName);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      displayName: Value(displayName),
      createdAt: Value(createdAt),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<String>(json['id']),
      displayName: serializer.fromJson<String>(json['displayName']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'displayName': serializer.toJson<String>(displayName),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  User copyWith({String? id, String? displayName, DateTime? createdAt}) => User(
    id: id ?? this.id,
    displayName: displayName ?? this.displayName,
    createdAt: createdAt ?? this.createdAt,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, displayName, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.displayName == this.displayName &&
          other.createdAt == this.createdAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> id;
  final Value<String> displayName;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    required String displayName,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       displayName = Value(displayName),
       createdAt = Value(createdAt);
  static Insertable<User> custom({
    Expression<String>? id,
    Expression<String>? displayName,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (displayName != null) 'display_name': displayName,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<String>? id,
    Value<String>? displayName,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProtectionPlansTable extends ProtectionPlans
    with TableInfo<$ProtectionPlansTable, ProtectionPlan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProtectionPlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _plannedIncomeMeta = const VerificationMeta(
    'plannedIncome',
  );
  @override
  late final GeneratedColumn<int> plannedIncome = GeneratedColumn<int>(
    'planned_income',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, userId, plannedIncome, currency];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'protection_plans';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProtectionPlan> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('planned_income')) {
      context.handle(
        _plannedIncomeMeta,
        plannedIncome.isAcceptableOrUnknown(
          data['planned_income']!,
          _plannedIncomeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_plannedIncomeMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProtectionPlan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProtectionPlan(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      plannedIncome: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}planned_income'],
      )!,
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      )!,
    );
  }

  @override
  $ProtectionPlansTable createAlias(String alias) {
    return $ProtectionPlansTable(attachedDatabase, alias);
  }
}

class ProtectionPlan extends DataClass implements Insertable<ProtectionPlan> {
  final String id;
  final String userId;
  final int plannedIncome;
  final String currency;
  const ProtectionPlan({
    required this.id,
    required this.userId,
    required this.plannedIncome,
    required this.currency,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['planned_income'] = Variable<int>(plannedIncome);
    map['currency'] = Variable<String>(currency);
    return map;
  }

  ProtectionPlansCompanion toCompanion(bool nullToAbsent) {
    return ProtectionPlansCompanion(
      id: Value(id),
      userId: Value(userId),
      plannedIncome: Value(plannedIncome),
      currency: Value(currency),
    );
  }

  factory ProtectionPlan.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProtectionPlan(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      plannedIncome: serializer.fromJson<int>(json['plannedIncome']),
      currency: serializer.fromJson<String>(json['currency']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'plannedIncome': serializer.toJson<int>(plannedIncome),
      'currency': serializer.toJson<String>(currency),
    };
  }

  ProtectionPlan copyWith({
    String? id,
    String? userId,
    int? plannedIncome,
    String? currency,
  }) => ProtectionPlan(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    plannedIncome: plannedIncome ?? this.plannedIncome,
    currency: currency ?? this.currency,
  );
  ProtectionPlan copyWithCompanion(ProtectionPlansCompanion data) {
    return ProtectionPlan(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      plannedIncome: data.plannedIncome.present
          ? data.plannedIncome.value
          : this.plannedIncome,
      currency: data.currency.present ? data.currency.value : this.currency,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProtectionPlan(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('plannedIncome: $plannedIncome, ')
          ..write('currency: $currency')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, plannedIncome, currency);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProtectionPlan &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.plannedIncome == this.plannedIncome &&
          other.currency == this.currency);
}

class ProtectionPlansCompanion extends UpdateCompanion<ProtectionPlan> {
  final Value<String> id;
  final Value<String> userId;
  final Value<int> plannedIncome;
  final Value<String> currency;
  final Value<int> rowid;
  const ProtectionPlansCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.plannedIncome = const Value.absent(),
    this.currency = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProtectionPlansCompanion.insert({
    required String id,
    required String userId,
    required int plannedIncome,
    required String currency,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       plannedIncome = Value(plannedIncome),
       currency = Value(currency);
  static Insertable<ProtectionPlan> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<int>? plannedIncome,
    Expression<String>? currency,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (plannedIncome != null) 'planned_income': plannedIncome,
      if (currency != null) 'currency': currency,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProtectionPlansCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<int>? plannedIncome,
    Value<String>? currency,
    Value<int>? rowid,
  }) {
    return ProtectionPlansCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      plannedIncome: plannedIncome ?? this.plannedIncome,
      currency: currency ?? this.currency,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (plannedIncome.present) {
      map['planned_income'] = Variable<int>(plannedIncome.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProtectionPlansCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('plannedIncome: $plannedIncome, ')
          ..write('currency: $currency, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AllocationsTable extends Allocations
    with TableInfo<$AllocationsTable, Allocation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AllocationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _protectionPlanIdMeta = const VerificationMeta(
    'protectionPlanId',
  );
  @override
  late final GeneratedColumn<String> protectionPlanId = GeneratedColumn<String>(
    'protection_plan_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES protection_plans (id) ON DELETE CASCADE',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<AllocationCategory, String>
  category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<AllocationCategory>($AllocationsTable.$convertercategory);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isProtectedMeta = const VerificationMeta(
    'isProtected',
  );
  @override
  late final GeneratedColumn<bool> isProtected = GeneratedColumn<bool>(
    'is_protected',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_protected" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    protectionPlanId,
    category,
    amount,
    isProtected,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'allocations';
  @override
  VerificationContext validateIntegrity(
    Insertable<Allocation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('protection_plan_id')) {
      context.handle(
        _protectionPlanIdMeta,
        protectionPlanId.isAcceptableOrUnknown(
          data['protection_plan_id']!,
          _protectionPlanIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_protectionPlanIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('is_protected')) {
      context.handle(
        _isProtectedMeta,
        isProtected.isAcceptableOrUnknown(
          data['is_protected']!,
          _isProtectedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_isProtectedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Allocation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Allocation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      protectionPlanId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}protection_plan_id'],
      )!,
      category: $AllocationsTable.$convertercategory.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}category'],
        )!,
      ),
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      isProtected: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_protected'],
      )!,
    );
  }

  @override
  $AllocationsTable createAlias(String alias) {
    return $AllocationsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AllocationCategory, String, String>
  $convertercategory = const EnumNameConverter<AllocationCategory>(
    AllocationCategory.values,
  );
}

class Allocation extends DataClass implements Insertable<Allocation> {
  final String id;
  final String protectionPlanId;
  final AllocationCategory category;
  final int amount;
  final bool isProtected;
  const Allocation({
    required this.id,
    required this.protectionPlanId,
    required this.category,
    required this.amount,
    required this.isProtected,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['protection_plan_id'] = Variable<String>(protectionPlanId);
    {
      map['category'] = Variable<String>(
        $AllocationsTable.$convertercategory.toSql(category),
      );
    }
    map['amount'] = Variable<int>(amount);
    map['is_protected'] = Variable<bool>(isProtected);
    return map;
  }

  AllocationsCompanion toCompanion(bool nullToAbsent) {
    return AllocationsCompanion(
      id: Value(id),
      protectionPlanId: Value(protectionPlanId),
      category: Value(category),
      amount: Value(amount),
      isProtected: Value(isProtected),
    );
  }

  factory Allocation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Allocation(
      id: serializer.fromJson<String>(json['id']),
      protectionPlanId: serializer.fromJson<String>(json['protectionPlanId']),
      category: $AllocationsTable.$convertercategory.fromJson(
        serializer.fromJson<String>(json['category']),
      ),
      amount: serializer.fromJson<int>(json['amount']),
      isProtected: serializer.fromJson<bool>(json['isProtected']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'protectionPlanId': serializer.toJson<String>(protectionPlanId),
      'category': serializer.toJson<String>(
        $AllocationsTable.$convertercategory.toJson(category),
      ),
      'amount': serializer.toJson<int>(amount),
      'isProtected': serializer.toJson<bool>(isProtected),
    };
  }

  Allocation copyWith({
    String? id,
    String? protectionPlanId,
    AllocationCategory? category,
    int? amount,
    bool? isProtected,
  }) => Allocation(
    id: id ?? this.id,
    protectionPlanId: protectionPlanId ?? this.protectionPlanId,
    category: category ?? this.category,
    amount: amount ?? this.amount,
    isProtected: isProtected ?? this.isProtected,
  );
  Allocation copyWithCompanion(AllocationsCompanion data) {
    return Allocation(
      id: data.id.present ? data.id.value : this.id,
      protectionPlanId: data.protectionPlanId.present
          ? data.protectionPlanId.value
          : this.protectionPlanId,
      category: data.category.present ? data.category.value : this.category,
      amount: data.amount.present ? data.amount.value : this.amount,
      isProtected: data.isProtected.present
          ? data.isProtected.value
          : this.isProtected,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Allocation(')
          ..write('id: $id, ')
          ..write('protectionPlanId: $protectionPlanId, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('isProtected: $isProtected')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, protectionPlanId, category, amount, isProtected);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Allocation &&
          other.id == this.id &&
          other.protectionPlanId == this.protectionPlanId &&
          other.category == this.category &&
          other.amount == this.amount &&
          other.isProtected == this.isProtected);
}

class AllocationsCompanion extends UpdateCompanion<Allocation> {
  final Value<String> id;
  final Value<String> protectionPlanId;
  final Value<AllocationCategory> category;
  final Value<int> amount;
  final Value<bool> isProtected;
  final Value<int> rowid;
  const AllocationsCompanion({
    this.id = const Value.absent(),
    this.protectionPlanId = const Value.absent(),
    this.category = const Value.absent(),
    this.amount = const Value.absent(),
    this.isProtected = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AllocationsCompanion.insert({
    required String id,
    required String protectionPlanId,
    required AllocationCategory category,
    required int amount,
    required bool isProtected,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       protectionPlanId = Value(protectionPlanId),
       category = Value(category),
       amount = Value(amount),
       isProtected = Value(isProtected);
  static Insertable<Allocation> custom({
    Expression<String>? id,
    Expression<String>? protectionPlanId,
    Expression<String>? category,
    Expression<int>? amount,
    Expression<bool>? isProtected,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (protectionPlanId != null) 'protection_plan_id': protectionPlanId,
      if (category != null) 'category': category,
      if (amount != null) 'amount': amount,
      if (isProtected != null) 'is_protected': isProtected,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AllocationsCompanion copyWith({
    Value<String>? id,
    Value<String>? protectionPlanId,
    Value<AllocationCategory>? category,
    Value<int>? amount,
    Value<bool>? isProtected,
    Value<int>? rowid,
  }) {
    return AllocationsCompanion(
      id: id ?? this.id,
      protectionPlanId: protectionPlanId ?? this.protectionPlanId,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      isProtected: isProtected ?? this.isProtected,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (protectionPlanId.present) {
      map['protection_plan_id'] = Variable<String>(protectionPlanId.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(
        $AllocationsTable.$convertercategory.toSql(category.value),
      );
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (isProtected.present) {
      map['is_protected'] = Variable<bool>(isProtected.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AllocationsCompanion(')
          ..write('id: $id, ')
          ..write('protectionPlanId: $protectionPlanId, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('isProtected: $isProtected, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RiskWindowsTable extends RiskWindows
    with TableInfo<$RiskWindowsTable, RiskWindow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RiskWindowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _startTimeMicrosecondsMeta =
      const VerificationMeta('startTimeMicroseconds');
  @override
  late final GeneratedColumn<int> startTimeMicroseconds = GeneratedColumn<int>(
    'start_time_microseconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMicrosecondsMeta =
      const VerificationMeta('endTimeMicroseconds');
  @override
  late final GeneratedColumn<int> endTimeMicroseconds = GeneratedColumn<int>(
    'end_time_microseconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<RiskTrigger, String> trigger =
      GeneratedColumn<String>(
        'trigger',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<RiskTrigger>($RiskWindowsTable.$convertertrigger);
  static const VerificationMeta _enabledMeta = const VerificationMeta(
    'enabled',
  );
  @override
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
    'enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("enabled" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    startTimeMicroseconds,
    endTimeMicroseconds,
    trigger,
    enabled,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'risk_windows';
  @override
  VerificationContext validateIntegrity(
    Insertable<RiskWindow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('start_time_microseconds')) {
      context.handle(
        _startTimeMicrosecondsMeta,
        startTimeMicroseconds.isAcceptableOrUnknown(
          data['start_time_microseconds']!,
          _startTimeMicrosecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_startTimeMicrosecondsMeta);
    }
    if (data.containsKey('end_time_microseconds')) {
      context.handle(
        _endTimeMicrosecondsMeta,
        endTimeMicroseconds.isAcceptableOrUnknown(
          data['end_time_microseconds']!,
          _endTimeMicrosecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_endTimeMicrosecondsMeta);
    }
    if (data.containsKey('enabled')) {
      context.handle(
        _enabledMeta,
        enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta),
      );
    } else if (isInserting) {
      context.missing(_enabledMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RiskWindow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RiskWindow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      startTimeMicroseconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_time_microseconds'],
      )!,
      endTimeMicroseconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_time_microseconds'],
      )!,
      trigger: $RiskWindowsTable.$convertertrigger.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}trigger'],
        )!,
      ),
      enabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enabled'],
      )!,
    );
  }

  @override
  $RiskWindowsTable createAlias(String alias) {
    return $RiskWindowsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<RiskTrigger, String, String> $convertertrigger =
      const EnumNameConverter<RiskTrigger>(RiskTrigger.values);
}

class RiskWindow extends DataClass implements Insertable<RiskWindow> {
  final String id;
  final String userId;
  final int startTimeMicroseconds;
  final int endTimeMicroseconds;
  final RiskTrigger trigger;
  final bool enabled;
  const RiskWindow({
    required this.id,
    required this.userId,
    required this.startTimeMicroseconds,
    required this.endTimeMicroseconds,
    required this.trigger,
    required this.enabled,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['start_time_microseconds'] = Variable<int>(startTimeMicroseconds);
    map['end_time_microseconds'] = Variable<int>(endTimeMicroseconds);
    {
      map['trigger'] = Variable<String>(
        $RiskWindowsTable.$convertertrigger.toSql(trigger),
      );
    }
    map['enabled'] = Variable<bool>(enabled);
    return map;
  }

  RiskWindowsCompanion toCompanion(bool nullToAbsent) {
    return RiskWindowsCompanion(
      id: Value(id),
      userId: Value(userId),
      startTimeMicroseconds: Value(startTimeMicroseconds),
      endTimeMicroseconds: Value(endTimeMicroseconds),
      trigger: Value(trigger),
      enabled: Value(enabled),
    );
  }

  factory RiskWindow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RiskWindow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      startTimeMicroseconds: serializer.fromJson<int>(
        json['startTimeMicroseconds'],
      ),
      endTimeMicroseconds: serializer.fromJson<int>(
        json['endTimeMicroseconds'],
      ),
      trigger: $RiskWindowsTable.$convertertrigger.fromJson(
        serializer.fromJson<String>(json['trigger']),
      ),
      enabled: serializer.fromJson<bool>(json['enabled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'startTimeMicroseconds': serializer.toJson<int>(startTimeMicroseconds),
      'endTimeMicroseconds': serializer.toJson<int>(endTimeMicroseconds),
      'trigger': serializer.toJson<String>(
        $RiskWindowsTable.$convertertrigger.toJson(trigger),
      ),
      'enabled': serializer.toJson<bool>(enabled),
    };
  }

  RiskWindow copyWith({
    String? id,
    String? userId,
    int? startTimeMicroseconds,
    int? endTimeMicroseconds,
    RiskTrigger? trigger,
    bool? enabled,
  }) => RiskWindow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    startTimeMicroseconds: startTimeMicroseconds ?? this.startTimeMicroseconds,
    endTimeMicroseconds: endTimeMicroseconds ?? this.endTimeMicroseconds,
    trigger: trigger ?? this.trigger,
    enabled: enabled ?? this.enabled,
  );
  RiskWindow copyWithCompanion(RiskWindowsCompanion data) {
    return RiskWindow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      startTimeMicroseconds: data.startTimeMicroseconds.present
          ? data.startTimeMicroseconds.value
          : this.startTimeMicroseconds,
      endTimeMicroseconds: data.endTimeMicroseconds.present
          ? data.endTimeMicroseconds.value
          : this.endTimeMicroseconds,
      trigger: data.trigger.present ? data.trigger.value : this.trigger,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RiskWindow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('startTimeMicroseconds: $startTimeMicroseconds, ')
          ..write('endTimeMicroseconds: $endTimeMicroseconds, ')
          ..write('trigger: $trigger, ')
          ..write('enabled: $enabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    startTimeMicroseconds,
    endTimeMicroseconds,
    trigger,
    enabled,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RiskWindow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.startTimeMicroseconds == this.startTimeMicroseconds &&
          other.endTimeMicroseconds == this.endTimeMicroseconds &&
          other.trigger == this.trigger &&
          other.enabled == this.enabled);
}

class RiskWindowsCompanion extends UpdateCompanion<RiskWindow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<int> startTimeMicroseconds;
  final Value<int> endTimeMicroseconds;
  final Value<RiskTrigger> trigger;
  final Value<bool> enabled;
  final Value<int> rowid;
  const RiskWindowsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.startTimeMicroseconds = const Value.absent(),
    this.endTimeMicroseconds = const Value.absent(),
    this.trigger = const Value.absent(),
    this.enabled = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RiskWindowsCompanion.insert({
    required String id,
    required String userId,
    required int startTimeMicroseconds,
    required int endTimeMicroseconds,
    required RiskTrigger trigger,
    required bool enabled,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       startTimeMicroseconds = Value(startTimeMicroseconds),
       endTimeMicroseconds = Value(endTimeMicroseconds),
       trigger = Value(trigger),
       enabled = Value(enabled);
  static Insertable<RiskWindow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<int>? startTimeMicroseconds,
    Expression<int>? endTimeMicroseconds,
    Expression<String>? trigger,
    Expression<bool>? enabled,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (startTimeMicroseconds != null)
        'start_time_microseconds': startTimeMicroseconds,
      if (endTimeMicroseconds != null)
        'end_time_microseconds': endTimeMicroseconds,
      if (trigger != null) 'trigger': trigger,
      if (enabled != null) 'enabled': enabled,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RiskWindowsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<int>? startTimeMicroseconds,
    Value<int>? endTimeMicroseconds,
    Value<RiskTrigger>? trigger,
    Value<bool>? enabled,
    Value<int>? rowid,
  }) {
    return RiskWindowsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      startTimeMicroseconds:
          startTimeMicroseconds ?? this.startTimeMicroseconds,
      endTimeMicroseconds: endTimeMicroseconds ?? this.endTimeMicroseconds,
      trigger: trigger ?? this.trigger,
      enabled: enabled ?? this.enabled,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (startTimeMicroseconds.present) {
      map['start_time_microseconds'] = Variable<int>(
        startTimeMicroseconds.value,
      );
    }
    if (endTimeMicroseconds.present) {
      map['end_time_microseconds'] = Variable<int>(endTimeMicroseconds.value);
    }
    if (trigger.present) {
      map['trigger'] = Variable<String>(
        $RiskWindowsTable.$convertertrigger.toSql(trigger.value),
      );
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RiskWindowsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('startTimeMicroseconds: $startTimeMicroseconds, ')
          ..write('endTimeMicroseconds: $endTimeMicroseconds, ')
          ..write('trigger: $trigger, ')
          ..write('enabled: $enabled, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RiskWindowDaysTable extends RiskWindowDays
    with TableInfo<$RiskWindowDaysTable, RiskWindowDay> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RiskWindowDaysTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _riskWindowIdMeta = const VerificationMeta(
    'riskWindowId',
  );
  @override
  late final GeneratedColumn<String> riskWindowId = GeneratedColumn<String>(
    'risk_window_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES risk_windows (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _dayOfWeekMeta = const VerificationMeta(
    'dayOfWeek',
  );
  @override
  late final GeneratedColumn<int> dayOfWeek = GeneratedColumn<int>(
    'day_of_week',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [riskWindowId, dayOfWeek];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'risk_window_days';
  @override
  VerificationContext validateIntegrity(
    Insertable<RiskWindowDay> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('risk_window_id')) {
      context.handle(
        _riskWindowIdMeta,
        riskWindowId.isAcceptableOrUnknown(
          data['risk_window_id']!,
          _riskWindowIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_riskWindowIdMeta);
    }
    if (data.containsKey('day_of_week')) {
      context.handle(
        _dayOfWeekMeta,
        dayOfWeek.isAcceptableOrUnknown(data['day_of_week']!, _dayOfWeekMeta),
      );
    } else if (isInserting) {
      context.missing(_dayOfWeekMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {riskWindowId, dayOfWeek};
  @override
  RiskWindowDay map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RiskWindowDay(
      riskWindowId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}risk_window_id'],
      )!,
      dayOfWeek: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day_of_week'],
      )!,
    );
  }

  @override
  $RiskWindowDaysTable createAlias(String alias) {
    return $RiskWindowDaysTable(attachedDatabase, alias);
  }
}

class RiskWindowDay extends DataClass implements Insertable<RiskWindowDay> {
  /// Decision 021: stored days are days on which a risk window starts, not every day it is active.
  final String riskWindowId;
  final int dayOfWeek;
  const RiskWindowDay({required this.riskWindowId, required this.dayOfWeek});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['risk_window_id'] = Variable<String>(riskWindowId);
    map['day_of_week'] = Variable<int>(dayOfWeek);
    return map;
  }

  RiskWindowDaysCompanion toCompanion(bool nullToAbsent) {
    return RiskWindowDaysCompanion(
      riskWindowId: Value(riskWindowId),
      dayOfWeek: Value(dayOfWeek),
    );
  }

  factory RiskWindowDay.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RiskWindowDay(
      riskWindowId: serializer.fromJson<String>(json['riskWindowId']),
      dayOfWeek: serializer.fromJson<int>(json['dayOfWeek']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'riskWindowId': serializer.toJson<String>(riskWindowId),
      'dayOfWeek': serializer.toJson<int>(dayOfWeek),
    };
  }

  RiskWindowDay copyWith({String? riskWindowId, int? dayOfWeek}) =>
      RiskWindowDay(
        riskWindowId: riskWindowId ?? this.riskWindowId,
        dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      );
  RiskWindowDay copyWithCompanion(RiskWindowDaysCompanion data) {
    return RiskWindowDay(
      riskWindowId: data.riskWindowId.present
          ? data.riskWindowId.value
          : this.riskWindowId,
      dayOfWeek: data.dayOfWeek.present ? data.dayOfWeek.value : this.dayOfWeek,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RiskWindowDay(')
          ..write('riskWindowId: $riskWindowId, ')
          ..write('dayOfWeek: $dayOfWeek')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(riskWindowId, dayOfWeek);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RiskWindowDay &&
          other.riskWindowId == this.riskWindowId &&
          other.dayOfWeek == this.dayOfWeek);
}

class RiskWindowDaysCompanion extends UpdateCompanion<RiskWindowDay> {
  final Value<String> riskWindowId;
  final Value<int> dayOfWeek;
  final Value<int> rowid;
  const RiskWindowDaysCompanion({
    this.riskWindowId = const Value.absent(),
    this.dayOfWeek = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RiskWindowDaysCompanion.insert({
    required String riskWindowId,
    required int dayOfWeek,
    this.rowid = const Value.absent(),
  }) : riskWindowId = Value(riskWindowId),
       dayOfWeek = Value(dayOfWeek);
  static Insertable<RiskWindowDay> custom({
    Expression<String>? riskWindowId,
    Expression<int>? dayOfWeek,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (riskWindowId != null) 'risk_window_id': riskWindowId,
      if (dayOfWeek != null) 'day_of_week': dayOfWeek,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RiskWindowDaysCompanion copyWith({
    Value<String>? riskWindowId,
    Value<int>? dayOfWeek,
    Value<int>? rowid,
  }) {
    return RiskWindowDaysCompanion(
      riskWindowId: riskWindowId ?? this.riskWindowId,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (riskWindowId.present) {
      map['risk_window_id'] = Variable<String>(riskWindowId.value);
    }
    if (dayOfWeek.present) {
      map['day_of_week'] = Variable<int>(dayOfWeek.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RiskWindowDaysCompanion(')
          ..write('riskWindowId: $riskWindowId, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TrustedContactsTable extends TrustedContacts
    with TableInfo<$TrustedContactsTable, TrustedContact> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrustedContactsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, userId, name, phoneNumber];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trusted_contacts';
  @override
  VerificationContext validateIntegrity(
    Insertable<TrustedContact> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrustedContact map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrustedContact(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_number'],
      )!,
    );
  }

  @override
  $TrustedContactsTable createAlias(String alias) {
    return $TrustedContactsTable(attachedDatabase, alias);
  }
}

class TrustedContact extends DataClass implements Insertable<TrustedContact> {
  final String id;
  final String userId;
  final String name;
  final String phoneNumber;
  const TrustedContact({
    required this.id,
    required this.userId,
    required this.name,
    required this.phoneNumber,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['name'] = Variable<String>(name);
    map['phone_number'] = Variable<String>(phoneNumber);
    return map;
  }

  TrustedContactsCompanion toCompanion(bool nullToAbsent) {
    return TrustedContactsCompanion(
      id: Value(id),
      userId: Value(userId),
      name: Value(name),
      phoneNumber: Value(phoneNumber),
    );
  }

  factory TrustedContact.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrustedContact(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'name': serializer.toJson<String>(name),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
    };
  }

  TrustedContact copyWith({
    String? id,
    String? userId,
    String? name,
    String? phoneNumber,
  }) => TrustedContact(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    name: name ?? this.name,
    phoneNumber: phoneNumber ?? this.phoneNumber,
  );
  TrustedContact copyWithCompanion(TrustedContactsCompanion data) {
    return TrustedContact(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      phoneNumber: data.phoneNumber.present
          ? data.phoneNumber.value
          : this.phoneNumber,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrustedContact(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('phoneNumber: $phoneNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, name, phoneNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrustedContact &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.phoneNumber == this.phoneNumber);
}

class TrustedContactsCompanion extends UpdateCompanion<TrustedContact> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> name;
  final Value<String> phoneNumber;
  final Value<int> rowid;
  const TrustedContactsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TrustedContactsCompanion.insert({
    required String id,
    required String userId,
    required String name,
    required String phoneNumber,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       name = Value(name),
       phoneNumber = Value(phoneNumber);
  static Insertable<TrustedContact> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? name,
    Expression<String>? phoneNumber,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TrustedContactsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? name,
    Value<String>? phoneNumber,
    Value<int>? rowid,
  }) {
    return TrustedContactsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrustedContactsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SoberMessagesTable extends SoberMessages
    with TableInfo<$SoberMessagesTable, SoberMessage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SoberMessagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id) ON DELETE CASCADE',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<SoberMessageType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<SoberMessageType>($SoberMessagesTable.$convertertype);
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, userId, type, content, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sober_messages';
  @override
  VerificationContext validateIntegrity(
    Insertable<SoberMessage> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SoberMessage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SoberMessage(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      type: $SoberMessagesTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SoberMessagesTable createAlias(String alias) {
    return $SoberMessagesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SoberMessageType, String, String> $convertertype =
      const EnumNameConverter<SoberMessageType>(SoberMessageType.values);
}

class SoberMessage extends DataClass implements Insertable<SoberMessage> {
  final String id;
  final String userId;
  final SoberMessageType type;
  final String content;
  final DateTime createdAt;
  const SoberMessage({
    required this.id,
    required this.userId,
    required this.type,
    required this.content,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    {
      map['type'] = Variable<String>(
        $SoberMessagesTable.$convertertype.toSql(type),
      );
    }
    map['content'] = Variable<String>(content);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SoberMessagesCompanion toCompanion(bool nullToAbsent) {
    return SoberMessagesCompanion(
      id: Value(id),
      userId: Value(userId),
      type: Value(type),
      content: Value(content),
      createdAt: Value(createdAt),
    );
  }

  factory SoberMessage.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SoberMessage(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      type: $SoberMessagesTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'type': serializer.toJson<String>(
        $SoberMessagesTable.$convertertype.toJson(type),
      ),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SoberMessage copyWith({
    String? id,
    String? userId,
    SoberMessageType? type,
    String? content,
    DateTime? createdAt,
  }) => SoberMessage(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    type: type ?? this.type,
    content: content ?? this.content,
    createdAt: createdAt ?? this.createdAt,
  );
  SoberMessage copyWithCompanion(SoberMessagesCompanion data) {
    return SoberMessage(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      type: data.type.present ? data.type.value : this.type,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SoberMessage(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, type, content, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SoberMessage &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.type == this.type &&
          other.content == this.content &&
          other.createdAt == this.createdAt);
}

class SoberMessagesCompanion extends UpdateCompanion<SoberMessage> {
  final Value<String> id;
  final Value<String> userId;
  final Value<SoberMessageType> type;
  final Value<String> content;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const SoberMessagesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.type = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SoberMessagesCompanion.insert({
    required String id,
    required String userId,
    required SoberMessageType type,
    required String content,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       type = Value(type),
       content = Value(content),
       createdAt = Value(createdAt);
  static Insertable<SoberMessage> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? type,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (type != null) 'type': type,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SoberMessagesCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<SoberMessageType>? type,
    Value<String>? content,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return SoberMessagesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $SoberMessagesTable.$convertertype.toSql(type.value),
      );
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SoberMessagesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InterventionEventsTable extends InterventionEvents
    with TableInfo<$InterventionEventsTable, InterventionEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InterventionEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cooldownMicrosecondsMeta =
      const VerificationMeta('cooldownMicroseconds');
  @override
  late final GeneratedColumn<int> cooldownMicroseconds = GeneratedColumn<int>(
    'cooldown_microseconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<InterventionState, String> state =
      GeneratedColumn<String>(
        'state',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<InterventionState>(
        $InterventionEventsTable.$converterstate,
      );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    startedAt,
    cooldownMicroseconds,
    state,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'intervention_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<InterventionEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('cooldown_microseconds')) {
      context.handle(
        _cooldownMicrosecondsMeta,
        cooldownMicroseconds.isAcceptableOrUnknown(
          data['cooldown_microseconds']!,
          _cooldownMicrosecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cooldownMicrosecondsMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InterventionEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InterventionEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      cooldownMicroseconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cooldown_microseconds'],
      )!,
      state: $InterventionEventsTable.$converterstate.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}state'],
        )!,
      ),
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
    );
  }

  @override
  $InterventionEventsTable createAlias(String alias) {
    return $InterventionEventsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<InterventionState, String, String> $converterstate =
      const EnumNameConverter<InterventionState>(InterventionState.values);
}

class InterventionEvent extends DataClass
    implements Insertable<InterventionEvent> {
  final String id;
  final String userId;
  final DateTime startedAt;
  final int cooldownMicroseconds;
  final InterventionState state;
  final DateTime? completedAt;
  const InterventionEvent({
    required this.id,
    required this.userId,
    required this.startedAt,
    required this.cooldownMicroseconds,
    required this.state,
    this.completedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['started_at'] = Variable<DateTime>(startedAt);
    map['cooldown_microseconds'] = Variable<int>(cooldownMicroseconds);
    {
      map['state'] = Variable<String>(
        $InterventionEventsTable.$converterstate.toSql(state),
      );
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    return map;
  }

  InterventionEventsCompanion toCompanion(bool nullToAbsent) {
    return InterventionEventsCompanion(
      id: Value(id),
      userId: Value(userId),
      startedAt: Value(startedAt),
      cooldownMicroseconds: Value(cooldownMicroseconds),
      state: Value(state),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
    );
  }

  factory InterventionEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InterventionEvent(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      cooldownMicroseconds: serializer.fromJson<int>(
        json['cooldownMicroseconds'],
      ),
      state: $InterventionEventsTable.$converterstate.fromJson(
        serializer.fromJson<String>(json['state']),
      ),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'cooldownMicroseconds': serializer.toJson<int>(cooldownMicroseconds),
      'state': serializer.toJson<String>(
        $InterventionEventsTable.$converterstate.toJson(state),
      ),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
    };
  }

  InterventionEvent copyWith({
    String? id,
    String? userId,
    DateTime? startedAt,
    int? cooldownMicroseconds,
    InterventionState? state,
    Value<DateTime?> completedAt = const Value.absent(),
  }) => InterventionEvent(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    startedAt: startedAt ?? this.startedAt,
    cooldownMicroseconds: cooldownMicroseconds ?? this.cooldownMicroseconds,
    state: state ?? this.state,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
  );
  InterventionEvent copyWithCompanion(InterventionEventsCompanion data) {
    return InterventionEvent(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      cooldownMicroseconds: data.cooldownMicroseconds.present
          ? data.cooldownMicroseconds.value
          : this.cooldownMicroseconds,
      state: data.state.present ? data.state.value : this.state,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InterventionEvent(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('startedAt: $startedAt, ')
          ..write('cooldownMicroseconds: $cooldownMicroseconds, ')
          ..write('state: $state, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    startedAt,
    cooldownMicroseconds,
    state,
    completedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InterventionEvent &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.startedAt == this.startedAt &&
          other.cooldownMicroseconds == this.cooldownMicroseconds &&
          other.state == this.state &&
          other.completedAt == this.completedAt);
}

class InterventionEventsCompanion extends UpdateCompanion<InterventionEvent> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime> startedAt;
  final Value<int> cooldownMicroseconds;
  final Value<InterventionState> state;
  final Value<DateTime?> completedAt;
  final Value<int> rowid;
  const InterventionEventsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.cooldownMicroseconds = const Value.absent(),
    this.state = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InterventionEventsCompanion.insert({
    required String id,
    required String userId,
    required DateTime startedAt,
    required int cooldownMicroseconds,
    required InterventionState state,
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       startedAt = Value(startedAt),
       cooldownMicroseconds = Value(cooldownMicroseconds),
       state = Value(state);
  static Insertable<InterventionEvent> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? startedAt,
    Expression<int>? cooldownMicroseconds,
    Expression<String>? state,
    Expression<DateTime>? completedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (startedAt != null) 'started_at': startedAt,
      if (cooldownMicroseconds != null)
        'cooldown_microseconds': cooldownMicroseconds,
      if (state != null) 'state': state,
      if (completedAt != null) 'completed_at': completedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InterventionEventsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime>? startedAt,
    Value<int>? cooldownMicroseconds,
    Value<InterventionState>? state,
    Value<DateTime?>? completedAt,
    Value<int>? rowid,
  }) {
    return InterventionEventsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      startedAt: startedAt ?? this.startedAt,
      cooldownMicroseconds: cooldownMicroseconds ?? this.cooldownMicroseconds,
      state: state ?? this.state,
      completedAt: completedAt ?? this.completedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (cooldownMicroseconds.present) {
      map['cooldown_microseconds'] = Variable<int>(cooldownMicroseconds.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(
        $InterventionEventsTable.$converterstate.toSql(state.value),
      );
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InterventionEventsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('startedAt: $startedAt, ')
          ..write('cooldownMicroseconds: $cooldownMicroseconds, ')
          ..write('state: $state, ')
          ..write('completedAt: $completedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InterventionActionsTable extends InterventionActions
    with TableInfo<$InterventionActionsTable, InterventionAction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InterventionActionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _interventionEventIdMeta =
      const VerificationMeta('interventionEventId');
  @override
  late final GeneratedColumn<String> interventionEventId =
      GeneratedColumn<String>(
        'intervention_event_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES intervention_events (id) ON DELETE CASCADE',
        ),
      );
  @override
  late final GeneratedColumnWithTypeConverter<InterventionActionType, String>
  type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<InterventionActionType>(
        $InterventionActionsTable.$convertertype,
      );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    interventionEventId,
    type,
    recordedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'intervention_actions';
  @override
  VerificationContext validateIntegrity(
    Insertable<InterventionAction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('intervention_event_id')) {
      context.handle(
        _interventionEventIdMeta,
        interventionEventId.isAcceptableOrUnknown(
          data['intervention_event_id']!,
          _interventionEventIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_interventionEventIdMeta);
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_recordedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InterventionAction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InterventionAction(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      interventionEventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}intervention_event_id'],
      )!,
      type: $InterventionActionsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
    );
  }

  @override
  $InterventionActionsTable createAlias(String alias) {
    return $InterventionActionsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<InterventionActionType, String, String>
  $convertertype = const EnumNameConverter<InterventionActionType>(
    InterventionActionType.values,
  );
}

class InterventionAction extends DataClass
    implements Insertable<InterventionAction> {
  final String id;
  final String interventionEventId;
  final InterventionActionType type;
  final DateTime recordedAt;
  const InterventionAction({
    required this.id,
    required this.interventionEventId,
    required this.type,
    required this.recordedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['intervention_event_id'] = Variable<String>(interventionEventId);
    {
      map['type'] = Variable<String>(
        $InterventionActionsTable.$convertertype.toSql(type),
      );
    }
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    return map;
  }

  InterventionActionsCompanion toCompanion(bool nullToAbsent) {
    return InterventionActionsCompanion(
      id: Value(id),
      interventionEventId: Value(interventionEventId),
      type: Value(type),
      recordedAt: Value(recordedAt),
    );
  }

  factory InterventionAction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InterventionAction(
      id: serializer.fromJson<String>(json['id']),
      interventionEventId: serializer.fromJson<String>(
        json['interventionEventId'],
      ),
      type: $InterventionActionsTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'interventionEventId': serializer.toJson<String>(interventionEventId),
      'type': serializer.toJson<String>(
        $InterventionActionsTable.$convertertype.toJson(type),
      ),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
    };
  }

  InterventionAction copyWith({
    String? id,
    String? interventionEventId,
    InterventionActionType? type,
    DateTime? recordedAt,
  }) => InterventionAction(
    id: id ?? this.id,
    interventionEventId: interventionEventId ?? this.interventionEventId,
    type: type ?? this.type,
    recordedAt: recordedAt ?? this.recordedAt,
  );
  InterventionAction copyWithCompanion(InterventionActionsCompanion data) {
    return InterventionAction(
      id: data.id.present ? data.id.value : this.id,
      interventionEventId: data.interventionEventId.present
          ? data.interventionEventId.value
          : this.interventionEventId,
      type: data.type.present ? data.type.value : this.type,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InterventionAction(')
          ..write('id: $id, ')
          ..write('interventionEventId: $interventionEventId, ')
          ..write('type: $type, ')
          ..write('recordedAt: $recordedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, interventionEventId, type, recordedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InterventionAction &&
          other.id == this.id &&
          other.interventionEventId == this.interventionEventId &&
          other.type == this.type &&
          other.recordedAt == this.recordedAt);
}

class InterventionActionsCompanion extends UpdateCompanion<InterventionAction> {
  final Value<String> id;
  final Value<String> interventionEventId;
  final Value<InterventionActionType> type;
  final Value<DateTime> recordedAt;
  final Value<int> rowid;
  const InterventionActionsCompanion({
    this.id = const Value.absent(),
    this.interventionEventId = const Value.absent(),
    this.type = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InterventionActionsCompanion.insert({
    required String id,
    required String interventionEventId,
    required InterventionActionType type,
    required DateTime recordedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       interventionEventId = Value(interventionEventId),
       type = Value(type),
       recordedAt = Value(recordedAt);
  static Insertable<InterventionAction> custom({
    Expression<String>? id,
    Expression<String>? interventionEventId,
    Expression<String>? type,
    Expression<DateTime>? recordedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (interventionEventId != null)
        'intervention_event_id': interventionEventId,
      if (type != null) 'type': type,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InterventionActionsCompanion copyWith({
    Value<String>? id,
    Value<String>? interventionEventId,
    Value<InterventionActionType>? type,
    Value<DateTime>? recordedAt,
    Value<int>? rowid,
  }) {
    return InterventionActionsCompanion(
      id: id ?? this.id,
      interventionEventId: interventionEventId ?? this.interventionEventId,
      type: type ?? this.type,
      recordedAt: recordedAt ?? this.recordedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (interventionEventId.present) {
      map['intervention_event_id'] = Variable<String>(
        interventionEventId.value,
      );
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $InterventionActionsTable.$convertertype.toSql(type.value),
      );
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InterventionActionsCompanion(')
          ..write('id: $id, ')
          ..write('interventionEventId: $interventionEventId, ')
          ..write('type: $type, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SpendingEventsTable extends SpendingEvents
    with TableInfo<$SpendingEventsTable, SpendingEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SpendingEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _protectionPlanIdMeta = const VerificationMeta(
    'protectionPlanId',
  );
  @override
  late final GeneratedColumn<String> protectionPlanId = GeneratedColumn<String>(
    'protection_plan_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES protection_plans (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<AllocationCategory, String>
  category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<AllocationCategory>($SpendingEventsTable.$convertercategory);
  static const VerificationMeta _occurredAtMeta = const VerificationMeta(
    'occurredAt',
  );
  @override
  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
    'occurred_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<OverrideState, String>
  overrideState = GeneratedColumn<String>(
    'override_state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<OverrideState>($SpendingEventsTable.$converteroverrideState);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    protectionPlanId,
    amount,
    category,
    occurredAt,
    overrideState,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'spending_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<SpendingEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('protection_plan_id')) {
      context.handle(
        _protectionPlanIdMeta,
        protectionPlanId.isAcceptableOrUnknown(
          data['protection_plan_id']!,
          _protectionPlanIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_protectionPlanIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
        _occurredAtMeta,
        occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SpendingEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SpendingEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      protectionPlanId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}protection_plan_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      category: $SpendingEventsTable.$convertercategory.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}category'],
        )!,
      ),
      occurredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}occurred_at'],
      )!,
      overrideState: $SpendingEventsTable.$converteroverrideState.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}override_state'],
        )!,
      ),
    );
  }

  @override
  $SpendingEventsTable createAlias(String alias) {
    return $SpendingEventsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AllocationCategory, String, String>
  $convertercategory = const EnumNameConverter<AllocationCategory>(
    AllocationCategory.values,
  );
  static JsonTypeConverter2<OverrideState, String, String>
  $converteroverrideState = const EnumNameConverter<OverrideState>(
    OverrideState.values,
  );
}

class SpendingEvent extends DataClass implements Insertable<SpendingEvent> {
  final String id;
  final String userId;
  final String protectionPlanId;
  final int amount;
  final AllocationCategory category;
  final DateTime occurredAt;
  final OverrideState overrideState;
  const SpendingEvent({
    required this.id,
    required this.userId,
    required this.protectionPlanId,
    required this.amount,
    required this.category,
    required this.occurredAt,
    required this.overrideState,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['protection_plan_id'] = Variable<String>(protectionPlanId);
    map['amount'] = Variable<int>(amount);
    {
      map['category'] = Variable<String>(
        $SpendingEventsTable.$convertercategory.toSql(category),
      );
    }
    map['occurred_at'] = Variable<DateTime>(occurredAt);
    {
      map['override_state'] = Variable<String>(
        $SpendingEventsTable.$converteroverrideState.toSql(overrideState),
      );
    }
    return map;
  }

  SpendingEventsCompanion toCompanion(bool nullToAbsent) {
    return SpendingEventsCompanion(
      id: Value(id),
      userId: Value(userId),
      protectionPlanId: Value(protectionPlanId),
      amount: Value(amount),
      category: Value(category),
      occurredAt: Value(occurredAt),
      overrideState: Value(overrideState),
    );
  }

  factory SpendingEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SpendingEvent(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      protectionPlanId: serializer.fromJson<String>(json['protectionPlanId']),
      amount: serializer.fromJson<int>(json['amount']),
      category: $SpendingEventsTable.$convertercategory.fromJson(
        serializer.fromJson<String>(json['category']),
      ),
      occurredAt: serializer.fromJson<DateTime>(json['occurredAt']),
      overrideState: $SpendingEventsTable.$converteroverrideState.fromJson(
        serializer.fromJson<String>(json['overrideState']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'protectionPlanId': serializer.toJson<String>(protectionPlanId),
      'amount': serializer.toJson<int>(amount),
      'category': serializer.toJson<String>(
        $SpendingEventsTable.$convertercategory.toJson(category),
      ),
      'occurredAt': serializer.toJson<DateTime>(occurredAt),
      'overrideState': serializer.toJson<String>(
        $SpendingEventsTable.$converteroverrideState.toJson(overrideState),
      ),
    };
  }

  SpendingEvent copyWith({
    String? id,
    String? userId,
    String? protectionPlanId,
    int? amount,
    AllocationCategory? category,
    DateTime? occurredAt,
    OverrideState? overrideState,
  }) => SpendingEvent(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    protectionPlanId: protectionPlanId ?? this.protectionPlanId,
    amount: amount ?? this.amount,
    category: category ?? this.category,
    occurredAt: occurredAt ?? this.occurredAt,
    overrideState: overrideState ?? this.overrideState,
  );
  SpendingEvent copyWithCompanion(SpendingEventsCompanion data) {
    return SpendingEvent(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      protectionPlanId: data.protectionPlanId.present
          ? data.protectionPlanId.value
          : this.protectionPlanId,
      amount: data.amount.present ? data.amount.value : this.amount,
      category: data.category.present ? data.category.value : this.category,
      occurredAt: data.occurredAt.present
          ? data.occurredAt.value
          : this.occurredAt,
      overrideState: data.overrideState.present
          ? data.overrideState.value
          : this.overrideState,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SpendingEvent(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('protectionPlanId: $protectionPlanId, ')
          ..write('amount: $amount, ')
          ..write('category: $category, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('overrideState: $overrideState')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    protectionPlanId,
    amount,
    category,
    occurredAt,
    overrideState,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SpendingEvent &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.protectionPlanId == this.protectionPlanId &&
          other.amount == this.amount &&
          other.category == this.category &&
          other.occurredAt == this.occurredAt &&
          other.overrideState == this.overrideState);
}

class SpendingEventsCompanion extends UpdateCompanion<SpendingEvent> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> protectionPlanId;
  final Value<int> amount;
  final Value<AllocationCategory> category;
  final Value<DateTime> occurredAt;
  final Value<OverrideState> overrideState;
  final Value<int> rowid;
  const SpendingEventsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.protectionPlanId = const Value.absent(),
    this.amount = const Value.absent(),
    this.category = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.overrideState = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SpendingEventsCompanion.insert({
    required String id,
    required String userId,
    required String protectionPlanId,
    required int amount,
    required AllocationCategory category,
    required DateTime occurredAt,
    required OverrideState overrideState,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       protectionPlanId = Value(protectionPlanId),
       amount = Value(amount),
       category = Value(category),
       occurredAt = Value(occurredAt),
       overrideState = Value(overrideState);
  static Insertable<SpendingEvent> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? protectionPlanId,
    Expression<int>? amount,
    Expression<String>? category,
    Expression<DateTime>? occurredAt,
    Expression<String>? overrideState,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (protectionPlanId != null) 'protection_plan_id': protectionPlanId,
      if (amount != null) 'amount': amount,
      if (category != null) 'category': category,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (overrideState != null) 'override_state': overrideState,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SpendingEventsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? protectionPlanId,
    Value<int>? amount,
    Value<AllocationCategory>? category,
    Value<DateTime>? occurredAt,
    Value<OverrideState>? overrideState,
    Value<int>? rowid,
  }) {
    return SpendingEventsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      protectionPlanId: protectionPlanId ?? this.protectionPlanId,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      occurredAt: occurredAt ?? this.occurredAt,
      overrideState: overrideState ?? this.overrideState,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (protectionPlanId.present) {
      map['protection_plan_id'] = Variable<String>(protectionPlanId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(
        $SpendingEventsTable.$convertercategory.toSql(category.value),
      );
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (overrideState.present) {
      map['override_state'] = Variable<String>(
        $SpendingEventsTable.$converteroverrideState.toSql(overrideState.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SpendingEventsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('protectionPlanId: $protectionPlanId, ')
          ..write('amount: $amount, ')
          ..write('category: $category, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('overrideState: $overrideState, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReflectionsTable extends Reflections
    with TableInfo<$ReflectionsTable, Reflection> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReflectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _interventionEventIdMeta =
      const VerificationMeta('interventionEventId');
  @override
  late final GeneratedColumn<String> interventionEventId =
      GeneratedColumn<String>(
        'intervention_event_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES intervention_events (id) ON DELETE CASCADE',
        ),
      );
  @override
  late final GeneratedColumnWithTypeConverter<RiskTrigger, String> trigger =
      GeneratedColumn<String>(
        'trigger',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<RiskTrigger>($ReflectionsTable.$convertertrigger);
  @override
  late final GeneratedColumnWithTypeConverter<ReflectionSpendingStatus, String>
  spendingStatus =
      GeneratedColumn<String>(
        'spending_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<ReflectionSpendingStatus>(
        $ReflectionsTable.$converterspendingStatus,
      );
  static const VerificationMeta _amountSpentMeta = const VerificationMeta(
    'amountSpent',
  );
  @override
  late final GeneratedColumn<int> amountSpent = GeneratedColumn<int>(
    'amount_spent',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _whatHelpedMeta = const VerificationMeta(
    'whatHelped',
  );
  @override
  late final GeneratedColumn<String> whatHelped = GeneratedColumn<String>(
    'what_helped',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    interventionEventId,
    trigger,
    spendingStatus,
    amountSpent,
    whatHelped,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reflections';
  @override
  VerificationContext validateIntegrity(
    Insertable<Reflection> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('intervention_event_id')) {
      context.handle(
        _interventionEventIdMeta,
        interventionEventId.isAcceptableOrUnknown(
          data['intervention_event_id']!,
          _interventionEventIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_interventionEventIdMeta);
    }
    if (data.containsKey('amount_spent')) {
      context.handle(
        _amountSpentMeta,
        amountSpent.isAcceptableOrUnknown(
          data['amount_spent']!,
          _amountSpentMeta,
        ),
      );
    }
    if (data.containsKey('what_helped')) {
      context.handle(
        _whatHelpedMeta,
        whatHelped.isAcceptableOrUnknown(data['what_helped']!, _whatHelpedMeta),
      );
    } else if (isInserting) {
      context.missing(_whatHelpedMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {interventionEventId},
  ];
  @override
  Reflection map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Reflection(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      interventionEventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}intervention_event_id'],
      )!,
      trigger: $ReflectionsTable.$convertertrigger.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}trigger'],
        )!,
      ),
      spendingStatus: $ReflectionsTable.$converterspendingStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}spending_status'],
        )!,
      ),
      amountSpent: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_spent'],
      ),
      whatHelped: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}what_helped'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ReflectionsTable createAlias(String alias) {
    return $ReflectionsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<RiskTrigger, String, String> $convertertrigger =
      const EnumNameConverter<RiskTrigger>(RiskTrigger.values);
  static JsonTypeConverter2<ReflectionSpendingStatus, String, String>
  $converterspendingStatus = const EnumNameConverter<ReflectionSpendingStatus>(
    ReflectionSpendingStatus.values,
  );
}

class Reflection extends DataClass implements Insertable<Reflection> {
  final String id;
  final String interventionEventId;
  final RiskTrigger trigger;
  final ReflectionSpendingStatus spendingStatus;
  final int? amountSpent;
  final String whatHelped;
  final String? notes;
  final DateTime createdAt;
  const Reflection({
    required this.id,
    required this.interventionEventId,
    required this.trigger,
    required this.spendingStatus,
    this.amountSpent,
    required this.whatHelped,
    this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['intervention_event_id'] = Variable<String>(interventionEventId);
    {
      map['trigger'] = Variable<String>(
        $ReflectionsTable.$convertertrigger.toSql(trigger),
      );
    }
    {
      map['spending_status'] = Variable<String>(
        $ReflectionsTable.$converterspendingStatus.toSql(spendingStatus),
      );
    }
    if (!nullToAbsent || amountSpent != null) {
      map['amount_spent'] = Variable<int>(amountSpent);
    }
    map['what_helped'] = Variable<String>(whatHelped);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ReflectionsCompanion toCompanion(bool nullToAbsent) {
    return ReflectionsCompanion(
      id: Value(id),
      interventionEventId: Value(interventionEventId),
      trigger: Value(trigger),
      spendingStatus: Value(spendingStatus),
      amountSpent: amountSpent == null && nullToAbsent
          ? const Value.absent()
          : Value(amountSpent),
      whatHelped: Value(whatHelped),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory Reflection.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reflection(
      id: serializer.fromJson<String>(json['id']),
      interventionEventId: serializer.fromJson<String>(
        json['interventionEventId'],
      ),
      trigger: $ReflectionsTable.$convertertrigger.fromJson(
        serializer.fromJson<String>(json['trigger']),
      ),
      spendingStatus: $ReflectionsTable.$converterspendingStatus.fromJson(
        serializer.fromJson<String>(json['spendingStatus']),
      ),
      amountSpent: serializer.fromJson<int?>(json['amountSpent']),
      whatHelped: serializer.fromJson<String>(json['whatHelped']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'interventionEventId': serializer.toJson<String>(interventionEventId),
      'trigger': serializer.toJson<String>(
        $ReflectionsTable.$convertertrigger.toJson(trigger),
      ),
      'spendingStatus': serializer.toJson<String>(
        $ReflectionsTable.$converterspendingStatus.toJson(spendingStatus),
      ),
      'amountSpent': serializer.toJson<int?>(amountSpent),
      'whatHelped': serializer.toJson<String>(whatHelped),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Reflection copyWith({
    String? id,
    String? interventionEventId,
    RiskTrigger? trigger,
    ReflectionSpendingStatus? spendingStatus,
    Value<int?> amountSpent = const Value.absent(),
    String? whatHelped,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
  }) => Reflection(
    id: id ?? this.id,
    interventionEventId: interventionEventId ?? this.interventionEventId,
    trigger: trigger ?? this.trigger,
    spendingStatus: spendingStatus ?? this.spendingStatus,
    amountSpent: amountSpent.present ? amountSpent.value : this.amountSpent,
    whatHelped: whatHelped ?? this.whatHelped,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  Reflection copyWithCompanion(ReflectionsCompanion data) {
    return Reflection(
      id: data.id.present ? data.id.value : this.id,
      interventionEventId: data.interventionEventId.present
          ? data.interventionEventId.value
          : this.interventionEventId,
      trigger: data.trigger.present ? data.trigger.value : this.trigger,
      spendingStatus: data.spendingStatus.present
          ? data.spendingStatus.value
          : this.spendingStatus,
      amountSpent: data.amountSpent.present
          ? data.amountSpent.value
          : this.amountSpent,
      whatHelped: data.whatHelped.present
          ? data.whatHelped.value
          : this.whatHelped,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Reflection(')
          ..write('id: $id, ')
          ..write('interventionEventId: $interventionEventId, ')
          ..write('trigger: $trigger, ')
          ..write('spendingStatus: $spendingStatus, ')
          ..write('amountSpent: $amountSpent, ')
          ..write('whatHelped: $whatHelped, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    interventionEventId,
    trigger,
    spendingStatus,
    amountSpent,
    whatHelped,
    notes,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reflection &&
          other.id == this.id &&
          other.interventionEventId == this.interventionEventId &&
          other.trigger == this.trigger &&
          other.spendingStatus == this.spendingStatus &&
          other.amountSpent == this.amountSpent &&
          other.whatHelped == this.whatHelped &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class ReflectionsCompanion extends UpdateCompanion<Reflection> {
  final Value<String> id;
  final Value<String> interventionEventId;
  final Value<RiskTrigger> trigger;
  final Value<ReflectionSpendingStatus> spendingStatus;
  final Value<int?> amountSpent;
  final Value<String> whatHelped;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ReflectionsCompanion({
    this.id = const Value.absent(),
    this.interventionEventId = const Value.absent(),
    this.trigger = const Value.absent(),
    this.spendingStatus = const Value.absent(),
    this.amountSpent = const Value.absent(),
    this.whatHelped = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReflectionsCompanion.insert({
    required String id,
    required String interventionEventId,
    required RiskTrigger trigger,
    required ReflectionSpendingStatus spendingStatus,
    this.amountSpent = const Value.absent(),
    required String whatHelped,
    this.notes = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       interventionEventId = Value(interventionEventId),
       trigger = Value(trigger),
       spendingStatus = Value(spendingStatus),
       whatHelped = Value(whatHelped),
       createdAt = Value(createdAt);
  static Insertable<Reflection> custom({
    Expression<String>? id,
    Expression<String>? interventionEventId,
    Expression<String>? trigger,
    Expression<String>? spendingStatus,
    Expression<int>? amountSpent,
    Expression<String>? whatHelped,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (interventionEventId != null)
        'intervention_event_id': interventionEventId,
      if (trigger != null) 'trigger': trigger,
      if (spendingStatus != null) 'spending_status': spendingStatus,
      if (amountSpent != null) 'amount_spent': amountSpent,
      if (whatHelped != null) 'what_helped': whatHelped,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReflectionsCompanion copyWith({
    Value<String>? id,
    Value<String>? interventionEventId,
    Value<RiskTrigger>? trigger,
    Value<ReflectionSpendingStatus>? spendingStatus,
    Value<int?>? amountSpent,
    Value<String>? whatHelped,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return ReflectionsCompanion(
      id: id ?? this.id,
      interventionEventId: interventionEventId ?? this.interventionEventId,
      trigger: trigger ?? this.trigger,
      spendingStatus: spendingStatus ?? this.spendingStatus,
      amountSpent: amountSpent ?? this.amountSpent,
      whatHelped: whatHelped ?? this.whatHelped,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (interventionEventId.present) {
      map['intervention_event_id'] = Variable<String>(
        interventionEventId.value,
      );
    }
    if (trigger.present) {
      map['trigger'] = Variable<String>(
        $ReflectionsTable.$convertertrigger.toSql(trigger.value),
      );
    }
    if (spendingStatus.present) {
      map['spending_status'] = Variable<String>(
        $ReflectionsTable.$converterspendingStatus.toSql(spendingStatus.value),
      );
    }
    if (amountSpent.present) {
      map['amount_spent'] = Variable<int>(amountSpent.value);
    }
    if (whatHelped.present) {
      map['what_helped'] = Variable<String>(whatHelped.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReflectionsCompanion(')
          ..write('id: $id, ')
          ..write('interventionEventId: $interventionEventId, ')
          ..write('trigger: $trigger, ')
          ..write('spendingStatus: $spendingStatus, ')
          ..write('amountSpent: $amountSpent, ')
          ..write('whatHelped: $whatHelped, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $ProtectionPlansTable protectionPlans = $ProtectionPlansTable(
    this,
  );
  late final $AllocationsTable allocations = $AllocationsTable(this);
  late final $RiskWindowsTable riskWindows = $RiskWindowsTable(this);
  late final $RiskWindowDaysTable riskWindowDays = $RiskWindowDaysTable(this);
  late final $TrustedContactsTable trustedContacts = $TrustedContactsTable(
    this,
  );
  late final $SoberMessagesTable soberMessages = $SoberMessagesTable(this);
  late final $InterventionEventsTable interventionEvents =
      $InterventionEventsTable(this);
  late final $InterventionActionsTable interventionActions =
      $InterventionActionsTable(this);
  late final $SpendingEventsTable spendingEvents = $SpendingEventsTable(this);
  late final $ReflectionsTable reflections = $ReflectionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    protectionPlans,
    allocations,
    riskWindows,
    riskWindowDays,
    trustedContacts,
    soberMessages,
    interventionEvents,
    interventionActions,
    spendingEvents,
    reflections,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('protection_plans', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'protection_plans',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('allocations', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('risk_windows', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'risk_windows',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('risk_window_days', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('trusted_contacts', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('sober_messages', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('intervention_events', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'intervention_events',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('intervention_actions', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('spending_events', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'protection_plans',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('spending_events', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'intervention_events',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('reflections', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      required String id,
      required String displayName,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<String> id,
      Value<String> displayName,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProtectionPlansTable, List<ProtectionPlan>>
  _protectionPlansRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.protectionPlans,
    aliasName: 'users__id__protection_plans__user_id',
  );

  $$ProtectionPlansTableProcessedTableManager get protectionPlansRefs {
    final manager = $$ProtectionPlansTableTableManager(
      $_db,
      $_db.protectionPlans,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _protectionPlansRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RiskWindowsTable, List<RiskWindow>>
  _riskWindowsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.riskWindows,
    aliasName: 'users__id__risk_windows__user_id',
  );

  $$RiskWindowsTableProcessedTableManager get riskWindowsRefs {
    final manager = $$RiskWindowsTableTableManager(
      $_db,
      $_db.riskWindows,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_riskWindowsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TrustedContactsTable, List<TrustedContact>>
  _trustedContactsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.trustedContacts,
    aliasName: 'users__id__trusted_contacts__user_id',
  );

  $$TrustedContactsTableProcessedTableManager get trustedContactsRefs {
    final manager = $$TrustedContactsTableTableManager(
      $_db,
      $_db.trustedContacts,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _trustedContactsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SoberMessagesTable, List<SoberMessage>>
  _soberMessagesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.soberMessages,
    aliasName: 'users__id__sober_messages__user_id',
  );

  $$SoberMessagesTableProcessedTableManager get soberMessagesRefs {
    final manager = $$SoberMessagesTableTableManager(
      $_db,
      $_db.soberMessages,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_soberMessagesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$InterventionEventsTable, List<InterventionEvent>>
  _interventionEventsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.interventionEvents,
        aliasName: 'users__id__intervention_events__user_id',
      );

  $$InterventionEventsTableProcessedTableManager get interventionEventsRefs {
    final manager = $$InterventionEventsTableTableManager(
      $_db,
      $_db.interventionEvents,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _interventionEventsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SpendingEventsTable, List<SpendingEvent>>
  _spendingEventsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.spendingEvents,
    aliasName: 'users__id__spending_events__user_id',
  );

  $$SpendingEventsTableProcessedTableManager get spendingEventsRefs {
    final manager = $$SpendingEventsTableTableManager(
      $_db,
      $_db.spendingEvents,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_spendingEventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> protectionPlansRefs(
    Expression<bool> Function($$ProtectionPlansTableFilterComposer f) f,
  ) {
    final $$ProtectionPlansTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.protectionPlans,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtectionPlansTableFilterComposer(
            $db: $db,
            $table: $db.protectionPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> riskWindowsRefs(
    Expression<bool> Function($$RiskWindowsTableFilterComposer f) f,
  ) {
    final $$RiskWindowsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.riskWindows,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RiskWindowsTableFilterComposer(
            $db: $db,
            $table: $db.riskWindows,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> trustedContactsRefs(
    Expression<bool> Function($$TrustedContactsTableFilterComposer f) f,
  ) {
    final $$TrustedContactsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.trustedContacts,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TrustedContactsTableFilterComposer(
            $db: $db,
            $table: $db.trustedContacts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> soberMessagesRefs(
    Expression<bool> Function($$SoberMessagesTableFilterComposer f) f,
  ) {
    final $$SoberMessagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.soberMessages,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SoberMessagesTableFilterComposer(
            $db: $db,
            $table: $db.soberMessages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> interventionEventsRefs(
    Expression<bool> Function($$InterventionEventsTableFilterComposer f) f,
  ) {
    final $$InterventionEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.interventionEvents,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionEventsTableFilterComposer(
            $db: $db,
            $table: $db.interventionEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> spendingEventsRefs(
    Expression<bool> Function($$SpendingEventsTableFilterComposer f) f,
  ) {
    final $$SpendingEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.spendingEvents,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpendingEventsTableFilterComposer(
            $db: $db,
            $table: $db.spendingEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> protectionPlansRefs<T extends Object>(
    Expression<T> Function($$ProtectionPlansTableAnnotationComposer a) f,
  ) {
    final $$ProtectionPlansTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.protectionPlans,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtectionPlansTableAnnotationComposer(
            $db: $db,
            $table: $db.protectionPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> riskWindowsRefs<T extends Object>(
    Expression<T> Function($$RiskWindowsTableAnnotationComposer a) f,
  ) {
    final $$RiskWindowsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.riskWindows,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RiskWindowsTableAnnotationComposer(
            $db: $db,
            $table: $db.riskWindows,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> trustedContactsRefs<T extends Object>(
    Expression<T> Function($$TrustedContactsTableAnnotationComposer a) f,
  ) {
    final $$TrustedContactsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.trustedContacts,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TrustedContactsTableAnnotationComposer(
            $db: $db,
            $table: $db.trustedContacts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> soberMessagesRefs<T extends Object>(
    Expression<T> Function($$SoberMessagesTableAnnotationComposer a) f,
  ) {
    final $$SoberMessagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.soberMessages,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SoberMessagesTableAnnotationComposer(
            $db: $db,
            $table: $db.soberMessages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> interventionEventsRefs<T extends Object>(
    Expression<T> Function($$InterventionEventsTableAnnotationComposer a) f,
  ) {
    final $$InterventionEventsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.interventionEvents,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$InterventionEventsTableAnnotationComposer(
                $db: $db,
                $table: $db.interventionEvents,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> spendingEventsRefs<T extends Object>(
    Expression<T> Function($$SpendingEventsTableAnnotationComposer a) f,
  ) {
    final $$SpendingEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.spendingEvents,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpendingEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.spendingEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, $$UsersTableReferences),
          User,
          PrefetchHooks Function({
            bool protectionPlansRefs,
            bool riskWindowsRefs,
            bool trustedContactsRefs,
            bool soberMessagesRefs,
            bool interventionEventsRefs,
            bool spendingEventsRefs,
          })
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                displayName: displayName,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String displayName,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                displayName: displayName,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UsersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                protectionPlansRefs = false,
                riskWindowsRefs = false,
                trustedContactsRefs = false,
                soberMessagesRefs = false,
                interventionEventsRefs = false,
                spendingEventsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (protectionPlansRefs) db.protectionPlans,
                    if (riskWindowsRefs) db.riskWindows,
                    if (trustedContactsRefs) db.trustedContacts,
                    if (soberMessagesRefs) db.soberMessages,
                    if (interventionEventsRefs) db.interventionEvents,
                    if (spendingEventsRefs) db.spendingEvents,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (protectionPlansRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          ProtectionPlan
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._protectionPlansRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).protectionPlansRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (riskWindowsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          RiskWindow
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._riskWindowsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).riskWindowsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (trustedContactsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          TrustedContact
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._trustedContactsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).trustedContactsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (soberMessagesRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          SoberMessage
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._soberMessagesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).soberMessagesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (interventionEventsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          InterventionEvent
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._interventionEventsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).interventionEventsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (spendingEventsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          SpendingEvent
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._spendingEventsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).spendingEventsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, $$UsersTableReferences),
      User,
      PrefetchHooks Function({
        bool protectionPlansRefs,
        bool riskWindowsRefs,
        bool trustedContactsRefs,
        bool soberMessagesRefs,
        bool interventionEventsRefs,
        bool spendingEventsRefs,
      })
    >;
typedef $$ProtectionPlansTableCreateCompanionBuilder =
    ProtectionPlansCompanion Function({
      required String id,
      required String userId,
      required int plannedIncome,
      required String currency,
      Value<int> rowid,
    });
typedef $$ProtectionPlansTableUpdateCompanionBuilder =
    ProtectionPlansCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<int> plannedIncome,
      Value<String> currency,
      Value<int> rowid,
    });

final class $$ProtectionPlansTableReferences
    extends
        BaseReferences<_$AppDatabase, $ProtectionPlansTable, ProtectionPlan> {
  $$ProtectionPlansTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _userIdTable(_$AppDatabase db) =>
      db.users.createAlias('protection_plans__user_id__users__id');

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AllocationsTable, List<Allocation>>
  _allocationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.allocations,
    aliasName: 'protection_plans__id__allocations__protection_plan_id',
  );

  $$AllocationsTableProcessedTableManager get allocationsRefs {
    final manager = $$AllocationsTableTableManager($_db, $_db.allocations)
        .filter(
          (f) => f.protectionPlanId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_allocationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SpendingEventsTable, List<SpendingEvent>>
  _spendingEventsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.spendingEvents,
    aliasName: 'protection_plans__id__spending_events__protection_plan_id',
  );

  $$SpendingEventsTableProcessedTableManager get spendingEventsRefs {
    final manager = $$SpendingEventsTableTableManager($_db, $_db.spendingEvents)
        .filter(
          (f) => f.protectionPlanId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_spendingEventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProtectionPlansTableFilterComposer
    extends Composer<_$AppDatabase, $ProtectionPlansTable> {
  $$ProtectionPlansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get plannedIncome => $composableBuilder(
    column: $table.plannedIncome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> allocationsRefs(
    Expression<bool> Function($$AllocationsTableFilterComposer f) f,
  ) {
    final $$AllocationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.allocations,
      getReferencedColumn: (t) => t.protectionPlanId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AllocationsTableFilterComposer(
            $db: $db,
            $table: $db.allocations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> spendingEventsRefs(
    Expression<bool> Function($$SpendingEventsTableFilterComposer f) f,
  ) {
    final $$SpendingEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.spendingEvents,
      getReferencedColumn: (t) => t.protectionPlanId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpendingEventsTableFilterComposer(
            $db: $db,
            $table: $db.spendingEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProtectionPlansTableOrderingComposer
    extends Composer<_$AppDatabase, $ProtectionPlansTable> {
  $$ProtectionPlansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get plannedIncome => $composableBuilder(
    column: $table.plannedIncome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProtectionPlansTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProtectionPlansTable> {
  $$ProtectionPlansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get plannedIncome => $composableBuilder(
    column: $table.plannedIncome,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> allocationsRefs<T extends Object>(
    Expression<T> Function($$AllocationsTableAnnotationComposer a) f,
  ) {
    final $$AllocationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.allocations,
      getReferencedColumn: (t) => t.protectionPlanId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AllocationsTableAnnotationComposer(
            $db: $db,
            $table: $db.allocations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> spendingEventsRefs<T extends Object>(
    Expression<T> Function($$SpendingEventsTableAnnotationComposer a) f,
  ) {
    final $$SpendingEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.spendingEvents,
      getReferencedColumn: (t) => t.protectionPlanId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpendingEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.spendingEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProtectionPlansTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProtectionPlansTable,
          ProtectionPlan,
          $$ProtectionPlansTableFilterComposer,
          $$ProtectionPlansTableOrderingComposer,
          $$ProtectionPlansTableAnnotationComposer,
          $$ProtectionPlansTableCreateCompanionBuilder,
          $$ProtectionPlansTableUpdateCompanionBuilder,
          (ProtectionPlan, $$ProtectionPlansTableReferences),
          ProtectionPlan,
          PrefetchHooks Function({
            bool userId,
            bool allocationsRefs,
            bool spendingEventsRefs,
          })
        > {
  $$ProtectionPlansTableTableManager(
    _$AppDatabase db,
    $ProtectionPlansTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProtectionPlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProtectionPlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProtectionPlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<int> plannedIncome = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProtectionPlansCompanion(
                id: id,
                userId: userId,
                plannedIncome: plannedIncome,
                currency: currency,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required int plannedIncome,
                required String currency,
                Value<int> rowid = const Value.absent(),
              }) => ProtectionPlansCompanion.insert(
                id: id,
                userId: userId,
                plannedIncome: plannedIncome,
                currency: currency,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProtectionPlansTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                userId = false,
                allocationsRefs = false,
                spendingEventsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (allocationsRefs) db.allocations,
                    if (spendingEventsRefs) db.spendingEvents,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (userId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userId,
                                    referencedTable:
                                        $$ProtectionPlansTableReferences
                                            ._userIdTable(db),
                                    referencedColumn:
                                        $$ProtectionPlansTableReferences
                                            ._userIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (allocationsRefs)
                        await $_getPrefetchedData<
                          ProtectionPlan,
                          $ProtectionPlansTable,
                          Allocation
                        >(
                          currentTable: table,
                          referencedTable: $$ProtectionPlansTableReferences
                              ._allocationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProtectionPlansTableReferences(
                                db,
                                table,
                                p0,
                              ).allocationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.protectionPlanId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (spendingEventsRefs)
                        await $_getPrefetchedData<
                          ProtectionPlan,
                          $ProtectionPlansTable,
                          SpendingEvent
                        >(
                          currentTable: table,
                          referencedTable: $$ProtectionPlansTableReferences
                              ._spendingEventsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProtectionPlansTableReferences(
                                db,
                                table,
                                p0,
                              ).spendingEventsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.protectionPlanId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProtectionPlansTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProtectionPlansTable,
      ProtectionPlan,
      $$ProtectionPlansTableFilterComposer,
      $$ProtectionPlansTableOrderingComposer,
      $$ProtectionPlansTableAnnotationComposer,
      $$ProtectionPlansTableCreateCompanionBuilder,
      $$ProtectionPlansTableUpdateCompanionBuilder,
      (ProtectionPlan, $$ProtectionPlansTableReferences),
      ProtectionPlan,
      PrefetchHooks Function({
        bool userId,
        bool allocationsRefs,
        bool spendingEventsRefs,
      })
    >;
typedef $$AllocationsTableCreateCompanionBuilder =
    AllocationsCompanion Function({
      required String id,
      required String protectionPlanId,
      required AllocationCategory category,
      required int amount,
      required bool isProtected,
      Value<int> rowid,
    });
typedef $$AllocationsTableUpdateCompanionBuilder =
    AllocationsCompanion Function({
      Value<String> id,
      Value<String> protectionPlanId,
      Value<AllocationCategory> category,
      Value<int> amount,
      Value<bool> isProtected,
      Value<int> rowid,
    });

final class $$AllocationsTableReferences
    extends BaseReferences<_$AppDatabase, $AllocationsTable, Allocation> {
  $$AllocationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProtectionPlansTable _protectionPlanIdTable(_$AppDatabase db) => db
      .protectionPlans
      .createAlias('allocations__protection_plan_id__protection_plans__id');

  $$ProtectionPlansTableProcessedTableManager get protectionPlanId {
    final $_column = $_itemColumn<String>('protection_plan_id')!;

    final manager = $$ProtectionPlansTableTableManager(
      $_db,
      $_db.protectionPlans,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_protectionPlanIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AllocationsTableFilterComposer
    extends Composer<_$AppDatabase, $AllocationsTable> {
  $$AllocationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<AllocationCategory, AllocationCategory, String>
  get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isProtected => $composableBuilder(
    column: $table.isProtected,
    builder: (column) => ColumnFilters(column),
  );

  $$ProtectionPlansTableFilterComposer get protectionPlanId {
    final $$ProtectionPlansTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protectionPlanId,
      referencedTable: $db.protectionPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtectionPlansTableFilterComposer(
            $db: $db,
            $table: $db.protectionPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AllocationsTableOrderingComposer
    extends Composer<_$AppDatabase, $AllocationsTable> {
  $$AllocationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isProtected => $composableBuilder(
    column: $table.isProtected,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProtectionPlansTableOrderingComposer get protectionPlanId {
    final $$ProtectionPlansTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protectionPlanId,
      referencedTable: $db.protectionPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtectionPlansTableOrderingComposer(
            $db: $db,
            $table: $db.protectionPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AllocationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AllocationsTable> {
  $$AllocationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AllocationCategory, String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<bool> get isProtected => $composableBuilder(
    column: $table.isProtected,
    builder: (column) => column,
  );

  $$ProtectionPlansTableAnnotationComposer get protectionPlanId {
    final $$ProtectionPlansTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protectionPlanId,
      referencedTable: $db.protectionPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtectionPlansTableAnnotationComposer(
            $db: $db,
            $table: $db.protectionPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AllocationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AllocationsTable,
          Allocation,
          $$AllocationsTableFilterComposer,
          $$AllocationsTableOrderingComposer,
          $$AllocationsTableAnnotationComposer,
          $$AllocationsTableCreateCompanionBuilder,
          $$AllocationsTableUpdateCompanionBuilder,
          (Allocation, $$AllocationsTableReferences),
          Allocation,
          PrefetchHooks Function({bool protectionPlanId})
        > {
  $$AllocationsTableTableManager(_$AppDatabase db, $AllocationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AllocationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AllocationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AllocationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> protectionPlanId = const Value.absent(),
                Value<AllocationCategory> category = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<bool> isProtected = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AllocationsCompanion(
                id: id,
                protectionPlanId: protectionPlanId,
                category: category,
                amount: amount,
                isProtected: isProtected,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String protectionPlanId,
                required AllocationCategory category,
                required int amount,
                required bool isProtected,
                Value<int> rowid = const Value.absent(),
              }) => AllocationsCompanion.insert(
                id: id,
                protectionPlanId: protectionPlanId,
                category: category,
                amount: amount,
                isProtected: isProtected,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AllocationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({protectionPlanId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (protectionPlanId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.protectionPlanId,
                                referencedTable: $$AllocationsTableReferences
                                    ._protectionPlanIdTable(db),
                                referencedColumn: $$AllocationsTableReferences
                                    ._protectionPlanIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AllocationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AllocationsTable,
      Allocation,
      $$AllocationsTableFilterComposer,
      $$AllocationsTableOrderingComposer,
      $$AllocationsTableAnnotationComposer,
      $$AllocationsTableCreateCompanionBuilder,
      $$AllocationsTableUpdateCompanionBuilder,
      (Allocation, $$AllocationsTableReferences),
      Allocation,
      PrefetchHooks Function({bool protectionPlanId})
    >;
typedef $$RiskWindowsTableCreateCompanionBuilder =
    RiskWindowsCompanion Function({
      required String id,
      required String userId,
      required int startTimeMicroseconds,
      required int endTimeMicroseconds,
      required RiskTrigger trigger,
      required bool enabled,
      Value<int> rowid,
    });
typedef $$RiskWindowsTableUpdateCompanionBuilder =
    RiskWindowsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<int> startTimeMicroseconds,
      Value<int> endTimeMicroseconds,
      Value<RiskTrigger> trigger,
      Value<bool> enabled,
      Value<int> rowid,
    });

final class $$RiskWindowsTableReferences
    extends BaseReferences<_$AppDatabase, $RiskWindowsTable, RiskWindow> {
  $$RiskWindowsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) =>
      db.users.createAlias('risk_windows__user_id__users__id');

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$RiskWindowDaysTable, List<RiskWindowDay>>
  _riskWindowDaysRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.riskWindowDays,
    aliasName: 'risk_windows__id__risk_window_days__risk_window_id',
  );

  $$RiskWindowDaysTableProcessedTableManager get riskWindowDaysRefs {
    final manager = $$RiskWindowDaysTableTableManager(
      $_db,
      $_db.riskWindowDays,
    ).filter((f) => f.riskWindowId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_riskWindowDaysRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RiskWindowsTableFilterComposer
    extends Composer<_$AppDatabase, $RiskWindowsTable> {
  $$RiskWindowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startTimeMicroseconds => $composableBuilder(
    column: $table.startTimeMicroseconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endTimeMicroseconds => $composableBuilder(
    column: $table.endTimeMicroseconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<RiskTrigger, RiskTrigger, String>
  get trigger => $composableBuilder(
    column: $table.trigger,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> riskWindowDaysRefs(
    Expression<bool> Function($$RiskWindowDaysTableFilterComposer f) f,
  ) {
    final $$RiskWindowDaysTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.riskWindowDays,
      getReferencedColumn: (t) => t.riskWindowId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RiskWindowDaysTableFilterComposer(
            $db: $db,
            $table: $db.riskWindowDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RiskWindowsTableOrderingComposer
    extends Composer<_$AppDatabase, $RiskWindowsTable> {
  $$RiskWindowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startTimeMicroseconds => $composableBuilder(
    column: $table.startTimeMicroseconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endTimeMicroseconds => $composableBuilder(
    column: $table.endTimeMicroseconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trigger => $composableBuilder(
    column: $table.trigger,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RiskWindowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RiskWindowsTable> {
  $$RiskWindowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get startTimeMicroseconds => $composableBuilder(
    column: $table.startTimeMicroseconds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get endTimeMicroseconds => $composableBuilder(
    column: $table.endTimeMicroseconds,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<RiskTrigger, String> get trigger =>
      $composableBuilder(column: $table.trigger, builder: (column) => column);

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> riskWindowDaysRefs<T extends Object>(
    Expression<T> Function($$RiskWindowDaysTableAnnotationComposer a) f,
  ) {
    final $$RiskWindowDaysTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.riskWindowDays,
      getReferencedColumn: (t) => t.riskWindowId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RiskWindowDaysTableAnnotationComposer(
            $db: $db,
            $table: $db.riskWindowDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RiskWindowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RiskWindowsTable,
          RiskWindow,
          $$RiskWindowsTableFilterComposer,
          $$RiskWindowsTableOrderingComposer,
          $$RiskWindowsTableAnnotationComposer,
          $$RiskWindowsTableCreateCompanionBuilder,
          $$RiskWindowsTableUpdateCompanionBuilder,
          (RiskWindow, $$RiskWindowsTableReferences),
          RiskWindow,
          PrefetchHooks Function({bool userId, bool riskWindowDaysRefs})
        > {
  $$RiskWindowsTableTableManager(_$AppDatabase db, $RiskWindowsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RiskWindowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RiskWindowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RiskWindowsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<int> startTimeMicroseconds = const Value.absent(),
                Value<int> endTimeMicroseconds = const Value.absent(),
                Value<RiskTrigger> trigger = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RiskWindowsCompanion(
                id: id,
                userId: userId,
                startTimeMicroseconds: startTimeMicroseconds,
                endTimeMicroseconds: endTimeMicroseconds,
                trigger: trigger,
                enabled: enabled,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required int startTimeMicroseconds,
                required int endTimeMicroseconds,
                required RiskTrigger trigger,
                required bool enabled,
                Value<int> rowid = const Value.absent(),
              }) => RiskWindowsCompanion.insert(
                id: id,
                userId: userId,
                startTimeMicroseconds: startTimeMicroseconds,
                endTimeMicroseconds: endTimeMicroseconds,
                trigger: trigger,
                enabled: enabled,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RiskWindowsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({userId = false, riskWindowDaysRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (riskWindowDaysRefs) db.riskWindowDays,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (userId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userId,
                                    referencedTable:
                                        $$RiskWindowsTableReferences
                                            ._userIdTable(db),
                                    referencedColumn:
                                        $$RiskWindowsTableReferences
                                            ._userIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (riskWindowDaysRefs)
                        await $_getPrefetchedData<
                          RiskWindow,
                          $RiskWindowsTable,
                          RiskWindowDay
                        >(
                          currentTable: table,
                          referencedTable: $$RiskWindowsTableReferences
                              ._riskWindowDaysRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RiskWindowsTableReferences(
                                db,
                                table,
                                p0,
                              ).riskWindowDaysRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.riskWindowId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RiskWindowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RiskWindowsTable,
      RiskWindow,
      $$RiskWindowsTableFilterComposer,
      $$RiskWindowsTableOrderingComposer,
      $$RiskWindowsTableAnnotationComposer,
      $$RiskWindowsTableCreateCompanionBuilder,
      $$RiskWindowsTableUpdateCompanionBuilder,
      (RiskWindow, $$RiskWindowsTableReferences),
      RiskWindow,
      PrefetchHooks Function({bool userId, bool riskWindowDaysRefs})
    >;
typedef $$RiskWindowDaysTableCreateCompanionBuilder =
    RiskWindowDaysCompanion Function({
      required String riskWindowId,
      required int dayOfWeek,
      Value<int> rowid,
    });
typedef $$RiskWindowDaysTableUpdateCompanionBuilder =
    RiskWindowDaysCompanion Function({
      Value<String> riskWindowId,
      Value<int> dayOfWeek,
      Value<int> rowid,
    });

final class $$RiskWindowDaysTableReferences
    extends BaseReferences<_$AppDatabase, $RiskWindowDaysTable, RiskWindowDay> {
  $$RiskWindowDaysTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RiskWindowsTable _riskWindowIdTable(_$AppDatabase db) => db
      .riskWindows
      .createAlias('risk_window_days__risk_window_id__risk_windows__id');

  $$RiskWindowsTableProcessedTableManager get riskWindowId {
    final $_column = $_itemColumn<String>('risk_window_id')!;

    final manager = $$RiskWindowsTableTableManager(
      $_db,
      $_db.riskWindows,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_riskWindowIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RiskWindowDaysTableFilterComposer
    extends Composer<_$AppDatabase, $RiskWindowDaysTable> {
  $$RiskWindowDaysTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnFilters(column),
  );

  $$RiskWindowsTableFilterComposer get riskWindowId {
    final $$RiskWindowsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.riskWindowId,
      referencedTable: $db.riskWindows,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RiskWindowsTableFilterComposer(
            $db: $db,
            $table: $db.riskWindows,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RiskWindowDaysTableOrderingComposer
    extends Composer<_$AppDatabase, $RiskWindowDaysTable> {
  $$RiskWindowDaysTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnOrderings(column),
  );

  $$RiskWindowsTableOrderingComposer get riskWindowId {
    final $$RiskWindowsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.riskWindowId,
      referencedTable: $db.riskWindows,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RiskWindowsTableOrderingComposer(
            $db: $db,
            $table: $db.riskWindows,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RiskWindowDaysTableAnnotationComposer
    extends Composer<_$AppDatabase, $RiskWindowDaysTable> {
  $$RiskWindowDaysTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get dayOfWeek =>
      $composableBuilder(column: $table.dayOfWeek, builder: (column) => column);

  $$RiskWindowsTableAnnotationComposer get riskWindowId {
    final $$RiskWindowsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.riskWindowId,
      referencedTable: $db.riskWindows,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RiskWindowsTableAnnotationComposer(
            $db: $db,
            $table: $db.riskWindows,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RiskWindowDaysTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RiskWindowDaysTable,
          RiskWindowDay,
          $$RiskWindowDaysTableFilterComposer,
          $$RiskWindowDaysTableOrderingComposer,
          $$RiskWindowDaysTableAnnotationComposer,
          $$RiskWindowDaysTableCreateCompanionBuilder,
          $$RiskWindowDaysTableUpdateCompanionBuilder,
          (RiskWindowDay, $$RiskWindowDaysTableReferences),
          RiskWindowDay,
          PrefetchHooks Function({bool riskWindowId})
        > {
  $$RiskWindowDaysTableTableManager(
    _$AppDatabase db,
    $RiskWindowDaysTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RiskWindowDaysTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RiskWindowDaysTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RiskWindowDaysTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> riskWindowId = const Value.absent(),
                Value<int> dayOfWeek = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RiskWindowDaysCompanion(
                riskWindowId: riskWindowId,
                dayOfWeek: dayOfWeek,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String riskWindowId,
                required int dayOfWeek,
                Value<int> rowid = const Value.absent(),
              }) => RiskWindowDaysCompanion.insert(
                riskWindowId: riskWindowId,
                dayOfWeek: dayOfWeek,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RiskWindowDaysTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({riskWindowId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (riskWindowId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.riskWindowId,
                                referencedTable: $$RiskWindowDaysTableReferences
                                    ._riskWindowIdTable(db),
                                referencedColumn:
                                    $$RiskWindowDaysTableReferences
                                        ._riskWindowIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RiskWindowDaysTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RiskWindowDaysTable,
      RiskWindowDay,
      $$RiskWindowDaysTableFilterComposer,
      $$RiskWindowDaysTableOrderingComposer,
      $$RiskWindowDaysTableAnnotationComposer,
      $$RiskWindowDaysTableCreateCompanionBuilder,
      $$RiskWindowDaysTableUpdateCompanionBuilder,
      (RiskWindowDay, $$RiskWindowDaysTableReferences),
      RiskWindowDay,
      PrefetchHooks Function({bool riskWindowId})
    >;
typedef $$TrustedContactsTableCreateCompanionBuilder =
    TrustedContactsCompanion Function({
      required String id,
      required String userId,
      required String name,
      required String phoneNumber,
      Value<int> rowid,
    });
typedef $$TrustedContactsTableUpdateCompanionBuilder =
    TrustedContactsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> name,
      Value<String> phoneNumber,
      Value<int> rowid,
    });

final class $$TrustedContactsTableReferences
    extends
        BaseReferences<_$AppDatabase, $TrustedContactsTable, TrustedContact> {
  $$TrustedContactsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _userIdTable(_$AppDatabase db) =>
      db.users.createAlias('trusted_contacts__user_id__users__id');

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TrustedContactsTableFilterComposer
    extends Composer<_$AppDatabase, $TrustedContactsTable> {
  $$TrustedContactsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TrustedContactsTableOrderingComposer
    extends Composer<_$AppDatabase, $TrustedContactsTable> {
  $$TrustedContactsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TrustedContactsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrustedContactsTable> {
  $$TrustedContactsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TrustedContactsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TrustedContactsTable,
          TrustedContact,
          $$TrustedContactsTableFilterComposer,
          $$TrustedContactsTableOrderingComposer,
          $$TrustedContactsTableAnnotationComposer,
          $$TrustedContactsTableCreateCompanionBuilder,
          $$TrustedContactsTableUpdateCompanionBuilder,
          (TrustedContact, $$TrustedContactsTableReferences),
          TrustedContact,
          PrefetchHooks Function({bool userId})
        > {
  $$TrustedContactsTableTableManager(
    _$AppDatabase db,
    $TrustedContactsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrustedContactsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrustedContactsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TrustedContactsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> phoneNumber = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TrustedContactsCompanion(
                id: id,
                userId: userId,
                name: name,
                phoneNumber: phoneNumber,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String name,
                required String phoneNumber,
                Value<int> rowid = const Value.absent(),
              }) => TrustedContactsCompanion.insert(
                id: id,
                userId: userId,
                name: name,
                phoneNumber: phoneNumber,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TrustedContactsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable:
                                    $$TrustedContactsTableReferences
                                        ._userIdTable(db),
                                referencedColumn:
                                    $$TrustedContactsTableReferences
                                        ._userIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TrustedContactsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TrustedContactsTable,
      TrustedContact,
      $$TrustedContactsTableFilterComposer,
      $$TrustedContactsTableOrderingComposer,
      $$TrustedContactsTableAnnotationComposer,
      $$TrustedContactsTableCreateCompanionBuilder,
      $$TrustedContactsTableUpdateCompanionBuilder,
      (TrustedContact, $$TrustedContactsTableReferences),
      TrustedContact,
      PrefetchHooks Function({bool userId})
    >;
typedef $$SoberMessagesTableCreateCompanionBuilder =
    SoberMessagesCompanion Function({
      required String id,
      required String userId,
      required SoberMessageType type,
      required String content,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$SoberMessagesTableUpdateCompanionBuilder =
    SoberMessagesCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<SoberMessageType> type,
      Value<String> content,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$SoberMessagesTableReferences
    extends BaseReferences<_$AppDatabase, $SoberMessagesTable, SoberMessage> {
  $$SoberMessagesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _userIdTable(_$AppDatabase db) =>
      db.users.createAlias('sober_messages__user_id__users__id');

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SoberMessagesTableFilterComposer
    extends Composer<_$AppDatabase, $SoberMessagesTable> {
  $$SoberMessagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SoberMessageType, SoberMessageType, String>
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SoberMessagesTableOrderingComposer
    extends Composer<_$AppDatabase, $SoberMessagesTable> {
  $$SoberMessagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SoberMessagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SoberMessagesTable> {
  $$SoberMessagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SoberMessageType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SoberMessagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SoberMessagesTable,
          SoberMessage,
          $$SoberMessagesTableFilterComposer,
          $$SoberMessagesTableOrderingComposer,
          $$SoberMessagesTableAnnotationComposer,
          $$SoberMessagesTableCreateCompanionBuilder,
          $$SoberMessagesTableUpdateCompanionBuilder,
          (SoberMessage, $$SoberMessagesTableReferences),
          SoberMessage,
          PrefetchHooks Function({bool userId})
        > {
  $$SoberMessagesTableTableManager(_$AppDatabase db, $SoberMessagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SoberMessagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SoberMessagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SoberMessagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<SoberMessageType> type = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SoberMessagesCompanion(
                id: id,
                userId: userId,
                type: type,
                content: content,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required SoberMessageType type,
                required String content,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => SoberMessagesCompanion.insert(
                id: id,
                userId: userId,
                type: type,
                content: content,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SoberMessagesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$SoberMessagesTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$SoberMessagesTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SoberMessagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SoberMessagesTable,
      SoberMessage,
      $$SoberMessagesTableFilterComposer,
      $$SoberMessagesTableOrderingComposer,
      $$SoberMessagesTableAnnotationComposer,
      $$SoberMessagesTableCreateCompanionBuilder,
      $$SoberMessagesTableUpdateCompanionBuilder,
      (SoberMessage, $$SoberMessagesTableReferences),
      SoberMessage,
      PrefetchHooks Function({bool userId})
    >;
typedef $$InterventionEventsTableCreateCompanionBuilder =
    InterventionEventsCompanion Function({
      required String id,
      required String userId,
      required DateTime startedAt,
      required int cooldownMicroseconds,
      required InterventionState state,
      Value<DateTime?> completedAt,
      Value<int> rowid,
    });
typedef $$InterventionEventsTableUpdateCompanionBuilder =
    InterventionEventsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime> startedAt,
      Value<int> cooldownMicroseconds,
      Value<InterventionState> state,
      Value<DateTime?> completedAt,
      Value<int> rowid,
    });

final class $$InterventionEventsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $InterventionEventsTable,
          InterventionEvent
        > {
  $$InterventionEventsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _userIdTable(_$AppDatabase db) =>
      db.users.createAlias('intervention_events__user_id__users__id');

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $InterventionActionsTable,
    List<InterventionAction>
  >
  _interventionActionsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.interventionActions,
    aliasName:
        'intervention_events__id__intervention_actions__intervention_event_id',
  );

  $$InterventionActionsTableProcessedTableManager get interventionActionsRefs {
    final manager =
        $$InterventionActionsTableTableManager(
          $_db,
          $_db.interventionActions,
        ).filter(
          (f) =>
              f.interventionEventId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _interventionActionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ReflectionsTable, List<Reflection>>
  _reflectionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.reflections,
    aliasName: 'intervention_events__id__reflections__intervention_event_id',
  );

  $$ReflectionsTableProcessedTableManager get reflectionsRefs {
    final manager = $$ReflectionsTableTableManager($_db, $_db.reflections)
        .filter(
          (f) =>
              f.interventionEventId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_reflectionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$InterventionEventsTableFilterComposer
    extends Composer<_$AppDatabase, $InterventionEventsTable> {
  $$InterventionEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cooldownMicroseconds => $composableBuilder(
    column: $table.cooldownMicroseconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<InterventionState, InterventionState, String>
  get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> interventionActionsRefs(
    Expression<bool> Function($$InterventionActionsTableFilterComposer f) f,
  ) {
    final $$InterventionActionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.interventionActions,
      getReferencedColumn: (t) => t.interventionEventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionActionsTableFilterComposer(
            $db: $db,
            $table: $db.interventionActions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> reflectionsRefs(
    Expression<bool> Function($$ReflectionsTableFilterComposer f) f,
  ) {
    final $$ReflectionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reflections,
      getReferencedColumn: (t) => t.interventionEventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReflectionsTableFilterComposer(
            $db: $db,
            $table: $db.reflections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InterventionEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $InterventionEventsTable> {
  $$InterventionEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cooldownMicroseconds => $composableBuilder(
    column: $table.cooldownMicroseconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InterventionEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InterventionEventsTable> {
  $$InterventionEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<int> get cooldownMicroseconds => $composableBuilder(
    column: $table.cooldownMicroseconds,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<InterventionState, String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> interventionActionsRefs<T extends Object>(
    Expression<T> Function($$InterventionActionsTableAnnotationComposer a) f,
  ) {
    final $$InterventionActionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.interventionActions,
          getReferencedColumn: (t) => t.interventionEventId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$InterventionActionsTableAnnotationComposer(
                $db: $db,
                $table: $db.interventionActions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> reflectionsRefs<T extends Object>(
    Expression<T> Function($$ReflectionsTableAnnotationComposer a) f,
  ) {
    final $$ReflectionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reflections,
      getReferencedColumn: (t) => t.interventionEventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReflectionsTableAnnotationComposer(
            $db: $db,
            $table: $db.reflections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InterventionEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InterventionEventsTable,
          InterventionEvent,
          $$InterventionEventsTableFilterComposer,
          $$InterventionEventsTableOrderingComposer,
          $$InterventionEventsTableAnnotationComposer,
          $$InterventionEventsTableCreateCompanionBuilder,
          $$InterventionEventsTableUpdateCompanionBuilder,
          (InterventionEvent, $$InterventionEventsTableReferences),
          InterventionEvent,
          PrefetchHooks Function({
            bool userId,
            bool interventionActionsRefs,
            bool reflectionsRefs,
          })
        > {
  $$InterventionEventsTableTableManager(
    _$AppDatabase db,
    $InterventionEventsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InterventionEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InterventionEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InterventionEventsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<int> cooldownMicroseconds = const Value.absent(),
                Value<InterventionState> state = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InterventionEventsCompanion(
                id: id,
                userId: userId,
                startedAt: startedAt,
                cooldownMicroseconds: cooldownMicroseconds,
                state: state,
                completedAt: completedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required DateTime startedAt,
                required int cooldownMicroseconds,
                required InterventionState state,
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InterventionEventsCompanion.insert(
                id: id,
                userId: userId,
                startedAt: startedAt,
                cooldownMicroseconds: cooldownMicroseconds,
                state: state,
                completedAt: completedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InterventionEventsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                userId = false,
                interventionActionsRefs = false,
                reflectionsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (interventionActionsRefs) db.interventionActions,
                    if (reflectionsRefs) db.reflections,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (userId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userId,
                                    referencedTable:
                                        $$InterventionEventsTableReferences
                                            ._userIdTable(db),
                                    referencedColumn:
                                        $$InterventionEventsTableReferences
                                            ._userIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (interventionActionsRefs)
                        await $_getPrefetchedData<
                          InterventionEvent,
                          $InterventionEventsTable,
                          InterventionAction
                        >(
                          currentTable: table,
                          referencedTable: $$InterventionEventsTableReferences
                              ._interventionActionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$InterventionEventsTableReferences(
                                db,
                                table,
                                p0,
                              ).interventionActionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.interventionEventId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (reflectionsRefs)
                        await $_getPrefetchedData<
                          InterventionEvent,
                          $InterventionEventsTable,
                          Reflection
                        >(
                          currentTable: table,
                          referencedTable: $$InterventionEventsTableReferences
                              ._reflectionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$InterventionEventsTableReferences(
                                db,
                                table,
                                p0,
                              ).reflectionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.interventionEventId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$InterventionEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InterventionEventsTable,
      InterventionEvent,
      $$InterventionEventsTableFilterComposer,
      $$InterventionEventsTableOrderingComposer,
      $$InterventionEventsTableAnnotationComposer,
      $$InterventionEventsTableCreateCompanionBuilder,
      $$InterventionEventsTableUpdateCompanionBuilder,
      (InterventionEvent, $$InterventionEventsTableReferences),
      InterventionEvent,
      PrefetchHooks Function({
        bool userId,
        bool interventionActionsRefs,
        bool reflectionsRefs,
      })
    >;
typedef $$InterventionActionsTableCreateCompanionBuilder =
    InterventionActionsCompanion Function({
      required String id,
      required String interventionEventId,
      required InterventionActionType type,
      required DateTime recordedAt,
      Value<int> rowid,
    });
typedef $$InterventionActionsTableUpdateCompanionBuilder =
    InterventionActionsCompanion Function({
      Value<String> id,
      Value<String> interventionEventId,
      Value<InterventionActionType> type,
      Value<DateTime> recordedAt,
      Value<int> rowid,
    });

final class $$InterventionActionsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $InterventionActionsTable,
          InterventionAction
        > {
  $$InterventionActionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $InterventionEventsTable _interventionEventIdTable(_$AppDatabase db) =>
      db.interventionEvents.createAlias(
        'intervention_actions__intervention_event_id__intervention_events__id',
      );

  $$InterventionEventsTableProcessedTableManager get interventionEventId {
    final $_column = $_itemColumn<String>('intervention_event_id')!;

    final manager = $$InterventionEventsTableTableManager(
      $_db,
      $_db.interventionEvents,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_interventionEventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$InterventionActionsTableFilterComposer
    extends Composer<_$AppDatabase, $InterventionActionsTable> {
  $$InterventionActionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    InterventionActionType,
    InterventionActionType,
    String
  >
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$InterventionEventsTableFilterComposer get interventionEventId {
    final $$InterventionEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionEventId,
      referencedTable: $db.interventionEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionEventsTableFilterComposer(
            $db: $db,
            $table: $db.interventionEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InterventionActionsTableOrderingComposer
    extends Composer<_$AppDatabase, $InterventionActionsTable> {
  $$InterventionActionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$InterventionEventsTableOrderingComposer get interventionEventId {
    final $$InterventionEventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionEventId,
      referencedTable: $db.interventionEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionEventsTableOrderingComposer(
            $db: $db,
            $table: $db.interventionEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InterventionActionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InterventionActionsTable> {
  $$InterventionActionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<InterventionActionType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );

  $$InterventionEventsTableAnnotationComposer get interventionEventId {
    final $$InterventionEventsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.interventionEventId,
          referencedTable: $db.interventionEvents,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$InterventionEventsTableAnnotationComposer(
                $db: $db,
                $table: $db.interventionEvents,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$InterventionActionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InterventionActionsTable,
          InterventionAction,
          $$InterventionActionsTableFilterComposer,
          $$InterventionActionsTableOrderingComposer,
          $$InterventionActionsTableAnnotationComposer,
          $$InterventionActionsTableCreateCompanionBuilder,
          $$InterventionActionsTableUpdateCompanionBuilder,
          (InterventionAction, $$InterventionActionsTableReferences),
          InterventionAction,
          PrefetchHooks Function({bool interventionEventId})
        > {
  $$InterventionActionsTableTableManager(
    _$AppDatabase db,
    $InterventionActionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InterventionActionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InterventionActionsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$InterventionActionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> interventionEventId = const Value.absent(),
                Value<InterventionActionType> type = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InterventionActionsCompanion(
                id: id,
                interventionEventId: interventionEventId,
                type: type,
                recordedAt: recordedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String interventionEventId,
                required InterventionActionType type,
                required DateTime recordedAt,
                Value<int> rowid = const Value.absent(),
              }) => InterventionActionsCompanion.insert(
                id: id,
                interventionEventId: interventionEventId,
                type: type,
                recordedAt: recordedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InterventionActionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({interventionEventId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (interventionEventId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.interventionEventId,
                                referencedTable:
                                    $$InterventionActionsTableReferences
                                        ._interventionEventIdTable(db),
                                referencedColumn:
                                    $$InterventionActionsTableReferences
                                        ._interventionEventIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$InterventionActionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InterventionActionsTable,
      InterventionAction,
      $$InterventionActionsTableFilterComposer,
      $$InterventionActionsTableOrderingComposer,
      $$InterventionActionsTableAnnotationComposer,
      $$InterventionActionsTableCreateCompanionBuilder,
      $$InterventionActionsTableUpdateCompanionBuilder,
      (InterventionAction, $$InterventionActionsTableReferences),
      InterventionAction,
      PrefetchHooks Function({bool interventionEventId})
    >;
typedef $$SpendingEventsTableCreateCompanionBuilder =
    SpendingEventsCompanion Function({
      required String id,
      required String userId,
      required String protectionPlanId,
      required int amount,
      required AllocationCategory category,
      required DateTime occurredAt,
      required OverrideState overrideState,
      Value<int> rowid,
    });
typedef $$SpendingEventsTableUpdateCompanionBuilder =
    SpendingEventsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> protectionPlanId,
      Value<int> amount,
      Value<AllocationCategory> category,
      Value<DateTime> occurredAt,
      Value<OverrideState> overrideState,
      Value<int> rowid,
    });

final class $$SpendingEventsTableReferences
    extends BaseReferences<_$AppDatabase, $SpendingEventsTable, SpendingEvent> {
  $$SpendingEventsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _userIdTable(_$AppDatabase db) =>
      db.users.createAlias('spending_events__user_id__users__id');

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProtectionPlansTable _protectionPlanIdTable(_$AppDatabase db) => db
      .protectionPlans
      .createAlias('spending_events__protection_plan_id__protection_plans__id');

  $$ProtectionPlansTableProcessedTableManager get protectionPlanId {
    final $_column = $_itemColumn<String>('protection_plan_id')!;

    final manager = $$ProtectionPlansTableTableManager(
      $_db,
      $_db.protectionPlans,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_protectionPlanIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SpendingEventsTableFilterComposer
    extends Composer<_$AppDatabase, $SpendingEventsTable> {
  $$SpendingEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<AllocationCategory, AllocationCategory, String>
  get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<OverrideState, OverrideState, String>
  get overrideState => $composableBuilder(
    column: $table.overrideState,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProtectionPlansTableFilterComposer get protectionPlanId {
    final $$ProtectionPlansTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protectionPlanId,
      referencedTable: $db.protectionPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtectionPlansTableFilterComposer(
            $db: $db,
            $table: $db.protectionPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SpendingEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $SpendingEventsTable> {
  $$SpendingEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get overrideState => $composableBuilder(
    column: $table.overrideState,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProtectionPlansTableOrderingComposer get protectionPlanId {
    final $$ProtectionPlansTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protectionPlanId,
      referencedTable: $db.protectionPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtectionPlansTableOrderingComposer(
            $db: $db,
            $table: $db.protectionPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SpendingEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SpendingEventsTable> {
  $$SpendingEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AllocationCategory, String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<OverrideState, String> get overrideState =>
      $composableBuilder(
        column: $table.overrideState,
        builder: (column) => column,
      );

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProtectionPlansTableAnnotationComposer get protectionPlanId {
    final $$ProtectionPlansTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protectionPlanId,
      referencedTable: $db.protectionPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtectionPlansTableAnnotationComposer(
            $db: $db,
            $table: $db.protectionPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SpendingEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SpendingEventsTable,
          SpendingEvent,
          $$SpendingEventsTableFilterComposer,
          $$SpendingEventsTableOrderingComposer,
          $$SpendingEventsTableAnnotationComposer,
          $$SpendingEventsTableCreateCompanionBuilder,
          $$SpendingEventsTableUpdateCompanionBuilder,
          (SpendingEvent, $$SpendingEventsTableReferences),
          SpendingEvent,
          PrefetchHooks Function({bool userId, bool protectionPlanId})
        > {
  $$SpendingEventsTableTableManager(
    _$AppDatabase db,
    $SpendingEventsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SpendingEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SpendingEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SpendingEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> protectionPlanId = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<AllocationCategory> category = const Value.absent(),
                Value<DateTime> occurredAt = const Value.absent(),
                Value<OverrideState> overrideState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SpendingEventsCompanion(
                id: id,
                userId: userId,
                protectionPlanId: protectionPlanId,
                amount: amount,
                category: category,
                occurredAt: occurredAt,
                overrideState: overrideState,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String protectionPlanId,
                required int amount,
                required AllocationCategory category,
                required DateTime occurredAt,
                required OverrideState overrideState,
                Value<int> rowid = const Value.absent(),
              }) => SpendingEventsCompanion.insert(
                id: id,
                userId: userId,
                protectionPlanId: protectionPlanId,
                amount: amount,
                category: category,
                occurredAt: occurredAt,
                overrideState: overrideState,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SpendingEventsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false, protectionPlanId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$SpendingEventsTableReferences
                                    ._userIdTable(db),
                                referencedColumn:
                                    $$SpendingEventsTableReferences
                                        ._userIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (protectionPlanId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.protectionPlanId,
                                referencedTable: $$SpendingEventsTableReferences
                                    ._protectionPlanIdTable(db),
                                referencedColumn:
                                    $$SpendingEventsTableReferences
                                        ._protectionPlanIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SpendingEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SpendingEventsTable,
      SpendingEvent,
      $$SpendingEventsTableFilterComposer,
      $$SpendingEventsTableOrderingComposer,
      $$SpendingEventsTableAnnotationComposer,
      $$SpendingEventsTableCreateCompanionBuilder,
      $$SpendingEventsTableUpdateCompanionBuilder,
      (SpendingEvent, $$SpendingEventsTableReferences),
      SpendingEvent,
      PrefetchHooks Function({bool userId, bool protectionPlanId})
    >;
typedef $$ReflectionsTableCreateCompanionBuilder =
    ReflectionsCompanion Function({
      required String id,
      required String interventionEventId,
      required RiskTrigger trigger,
      required ReflectionSpendingStatus spendingStatus,
      Value<int?> amountSpent,
      required String whatHelped,
      Value<String?> notes,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$ReflectionsTableUpdateCompanionBuilder =
    ReflectionsCompanion Function({
      Value<String> id,
      Value<String> interventionEventId,
      Value<RiskTrigger> trigger,
      Value<ReflectionSpendingStatus> spendingStatus,
      Value<int?> amountSpent,
      Value<String> whatHelped,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$ReflectionsTableReferences
    extends BaseReferences<_$AppDatabase, $ReflectionsTable, Reflection> {
  $$ReflectionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $InterventionEventsTable _interventionEventIdTable(_$AppDatabase db) =>
      db.interventionEvents.createAlias(
        'reflections__intervention_event_id__intervention_events__id',
      );

  $$InterventionEventsTableProcessedTableManager get interventionEventId {
    final $_column = $_itemColumn<String>('intervention_event_id')!;

    final manager = $$InterventionEventsTableTableManager(
      $_db,
      $_db.interventionEvents,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_interventionEventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ReflectionsTableFilterComposer
    extends Composer<_$AppDatabase, $ReflectionsTable> {
  $$ReflectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<RiskTrigger, RiskTrigger, String>
  get trigger => $composableBuilder(
    column: $table.trigger,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<
    ReflectionSpendingStatus,
    ReflectionSpendingStatus,
    String
  >
  get spendingStatus => $composableBuilder(
    column: $table.spendingStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get amountSpent => $composableBuilder(
    column: $table.amountSpent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get whatHelped => $composableBuilder(
    column: $table.whatHelped,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$InterventionEventsTableFilterComposer get interventionEventId {
    final $$InterventionEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionEventId,
      referencedTable: $db.interventionEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionEventsTableFilterComposer(
            $db: $db,
            $table: $db.interventionEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReflectionsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReflectionsTable> {
  $$ReflectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trigger => $composableBuilder(
    column: $table.trigger,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get spendingStatus => $composableBuilder(
    column: $table.spendingStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountSpent => $composableBuilder(
    column: $table.amountSpent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get whatHelped => $composableBuilder(
    column: $table.whatHelped,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$InterventionEventsTableOrderingComposer get interventionEventId {
    final $$InterventionEventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.interventionEventId,
      referencedTable: $db.interventionEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InterventionEventsTableOrderingComposer(
            $db: $db,
            $table: $db.interventionEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReflectionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReflectionsTable> {
  $$ReflectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<RiskTrigger, String> get trigger =>
      $composableBuilder(column: $table.trigger, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ReflectionSpendingStatus, String>
  get spendingStatus => $composableBuilder(
    column: $table.spendingStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get amountSpent => $composableBuilder(
    column: $table.amountSpent,
    builder: (column) => column,
  );

  GeneratedColumn<String> get whatHelped => $composableBuilder(
    column: $table.whatHelped,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$InterventionEventsTableAnnotationComposer get interventionEventId {
    final $$InterventionEventsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.interventionEventId,
          referencedTable: $db.interventionEvents,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$InterventionEventsTableAnnotationComposer(
                $db: $db,
                $table: $db.interventionEvents,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ReflectionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReflectionsTable,
          Reflection,
          $$ReflectionsTableFilterComposer,
          $$ReflectionsTableOrderingComposer,
          $$ReflectionsTableAnnotationComposer,
          $$ReflectionsTableCreateCompanionBuilder,
          $$ReflectionsTableUpdateCompanionBuilder,
          (Reflection, $$ReflectionsTableReferences),
          Reflection,
          PrefetchHooks Function({bool interventionEventId})
        > {
  $$ReflectionsTableTableManager(_$AppDatabase db, $ReflectionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReflectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReflectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReflectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> interventionEventId = const Value.absent(),
                Value<RiskTrigger> trigger = const Value.absent(),
                Value<ReflectionSpendingStatus> spendingStatus =
                    const Value.absent(),
                Value<int?> amountSpent = const Value.absent(),
                Value<String> whatHelped = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReflectionsCompanion(
                id: id,
                interventionEventId: interventionEventId,
                trigger: trigger,
                spendingStatus: spendingStatus,
                amountSpent: amountSpent,
                whatHelped: whatHelped,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String interventionEventId,
                required RiskTrigger trigger,
                required ReflectionSpendingStatus spendingStatus,
                Value<int?> amountSpent = const Value.absent(),
                required String whatHelped,
                Value<String?> notes = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ReflectionsCompanion.insert(
                id: id,
                interventionEventId: interventionEventId,
                trigger: trigger,
                spendingStatus: spendingStatus,
                amountSpent: amountSpent,
                whatHelped: whatHelped,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ReflectionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({interventionEventId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (interventionEventId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.interventionEventId,
                                referencedTable: $$ReflectionsTableReferences
                                    ._interventionEventIdTable(db),
                                referencedColumn: $$ReflectionsTableReferences
                                    ._interventionEventIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ReflectionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReflectionsTable,
      Reflection,
      $$ReflectionsTableFilterComposer,
      $$ReflectionsTableOrderingComposer,
      $$ReflectionsTableAnnotationComposer,
      $$ReflectionsTableCreateCompanionBuilder,
      $$ReflectionsTableUpdateCompanionBuilder,
      (Reflection, $$ReflectionsTableReferences),
      Reflection,
      PrefetchHooks Function({bool interventionEventId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$ProtectionPlansTableTableManager get protectionPlans =>
      $$ProtectionPlansTableTableManager(_db, _db.protectionPlans);
  $$AllocationsTableTableManager get allocations =>
      $$AllocationsTableTableManager(_db, _db.allocations);
  $$RiskWindowsTableTableManager get riskWindows =>
      $$RiskWindowsTableTableManager(_db, _db.riskWindows);
  $$RiskWindowDaysTableTableManager get riskWindowDays =>
      $$RiskWindowDaysTableTableManager(_db, _db.riskWindowDays);
  $$TrustedContactsTableTableManager get trustedContacts =>
      $$TrustedContactsTableTableManager(_db, _db.trustedContacts);
  $$SoberMessagesTableTableManager get soberMessages =>
      $$SoberMessagesTableTableManager(_db, _db.soberMessages);
  $$InterventionEventsTableTableManager get interventionEvents =>
      $$InterventionEventsTableTableManager(_db, _db.interventionEvents);
  $$InterventionActionsTableTableManager get interventionActions =>
      $$InterventionActionsTableTableManager(_db, _db.interventionActions);
  $$SpendingEventsTableTableManager get spendingEvents =>
      $$SpendingEventsTableTableManager(_db, _db.spendingEvents);
  $$ReflectionsTableTableManager get reflections =>
      $$ReflectionsTableTableManager(_db, _db.reflections);
}
