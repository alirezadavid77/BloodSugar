// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class BloodSugarSampleData extends DataClass
    implements Insertable<BloodSugarSampleData> {
  final String id;
  final int bloodSugar;
  final String measureState;
  final String assignDate;
  BloodSugarSampleData(
      {required this.id,
      required this.bloodSugar,
      required this.measureState,
      required this.assignDate});
  factory BloodSugarSampleData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BloodSugarSampleData(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      bloodSugar: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}blood_sugar'])!,
      measureState: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}measure_state'])!,
      assignDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}assign_date'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['blood_sugar'] = Variable<int>(bloodSugar);
    map['measure_state'] = Variable<String>(measureState);
    map['assign_date'] = Variable<String>(assignDate);
    return map;
  }

  BloodSugarSampleCompanion toCompanion(bool nullToAbsent) {
    return BloodSugarSampleCompanion(
      id: Value(id),
      bloodSugar: Value(bloodSugar),
      measureState: Value(measureState),
      assignDate: Value(assignDate),
    );
  }

  factory BloodSugarSampleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BloodSugarSampleData(
      id: serializer.fromJson<String>(json['id']),
      bloodSugar: serializer.fromJson<int>(json['bloodSugar']),
      measureState: serializer.fromJson<String>(json['measureState']),
      assignDate: serializer.fromJson<String>(json['assignDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'bloodSugar': serializer.toJson<int>(bloodSugar),
      'measureState': serializer.toJson<String>(measureState),
      'assignDate': serializer.toJson<String>(assignDate),
    };
  }

  BloodSugarSampleData copyWith(
          {String? id,
          int? bloodSugar,
          String? measureState,
          String? assignDate}) =>
      BloodSugarSampleData(
        id: id ?? this.id,
        bloodSugar: bloodSugar ?? this.bloodSugar,
        measureState: measureState ?? this.measureState,
        assignDate: assignDate ?? this.assignDate,
      );
  @override
  String toString() {
    return (StringBuffer('BloodSugarSampleData(')
          ..write('id: $id, ')
          ..write('bloodSugar: $bloodSugar, ')
          ..write('measureState: $measureState, ')
          ..write('assignDate: $assignDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, bloodSugar, measureState, assignDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BloodSugarSampleData &&
          other.id == this.id &&
          other.bloodSugar == this.bloodSugar &&
          other.measureState == this.measureState &&
          other.assignDate == this.assignDate);
}

class BloodSugarSampleCompanion extends UpdateCompanion<BloodSugarSampleData> {
  final Value<String> id;
  final Value<int> bloodSugar;
  final Value<String> measureState;
  final Value<String> assignDate;
  const BloodSugarSampleCompanion({
    this.id = const Value.absent(),
    this.bloodSugar = const Value.absent(),
    this.measureState = const Value.absent(),
    this.assignDate = const Value.absent(),
  });
  BloodSugarSampleCompanion.insert({
    required String id,
    this.bloodSugar = const Value.absent(),
    required String measureState,
    required String assignDate,
  })  : id = Value(id),
        measureState = Value(measureState),
        assignDate = Value(assignDate);
  static Insertable<BloodSugarSampleData> custom({
    Expression<String>? id,
    Expression<int>? bloodSugar,
    Expression<String>? measureState,
    Expression<String>? assignDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bloodSugar != null) 'blood_sugar': bloodSugar,
      if (measureState != null) 'measure_state': measureState,
      if (assignDate != null) 'assign_date': assignDate,
    });
  }

  BloodSugarSampleCompanion copyWith(
      {Value<String>? id,
      Value<int>? bloodSugar,
      Value<String>? measureState,
      Value<String>? assignDate}) {
    return BloodSugarSampleCompanion(
      id: id ?? this.id,
      bloodSugar: bloodSugar ?? this.bloodSugar,
      measureState: measureState ?? this.measureState,
      assignDate: assignDate ?? this.assignDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (bloodSugar.present) {
      map['blood_sugar'] = Variable<int>(bloodSugar.value);
    }
    if (measureState.present) {
      map['measure_state'] = Variable<String>(measureState.value);
    }
    if (assignDate.present) {
      map['assign_date'] = Variable<String>(assignDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BloodSugarSampleCompanion(')
          ..write('id: $id, ')
          ..write('bloodSugar: $bloodSugar, ')
          ..write('measureState: $measureState, ')
          ..write('assignDate: $assignDate')
          ..write(')'))
        .toString();
  }
}

class $BloodSugarSampleTable extends BloodSugarSample
    with TableInfo<$BloodSugarSampleTable, BloodSugarSampleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BloodSugarSampleTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _bloodSugarMeta = const VerificationMeta('bloodSugar');
  @override
  late final GeneratedColumn<int?> bloodSugar = GeneratedColumn<int?>(
      'blood_sugar', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _measureStateMeta =
      const VerificationMeta('measureState');
  @override
  late final GeneratedColumn<String?> measureState = GeneratedColumn<String?>(
      'measure_state', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _assignDateMeta = const VerificationMeta('assignDate');
  @override
  late final GeneratedColumn<String?> assignDate = GeneratedColumn<String?>(
      'assign_date', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, bloodSugar, measureState, assignDate];
  @override
  String get aliasedName => _alias ?? 'blood_sugar_sample';
  @override
  String get actualTableName => 'blood_sugar_sample';
  @override
  VerificationContext validateIntegrity(
      Insertable<BloodSugarSampleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('blood_sugar')) {
      context.handle(
          _bloodSugarMeta,
          bloodSugar.isAcceptableOrUnknown(
              data['blood_sugar']!, _bloodSugarMeta));
    }
    if (data.containsKey('measure_state')) {
      context.handle(
          _measureStateMeta,
          measureState.isAcceptableOrUnknown(
              data['measure_state']!, _measureStateMeta));
    } else if (isInserting) {
      context.missing(_measureStateMeta);
    }
    if (data.containsKey('assign_date')) {
      context.handle(
          _assignDateMeta,
          assignDate.isAcceptableOrUnknown(
              data['assign_date']!, _assignDateMeta));
    } else if (isInserting) {
      context.missing(_assignDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BloodSugarSampleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BloodSugarSampleData.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BloodSugarSampleTable createAlias(String alias) {
    return $BloodSugarSampleTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $BloodSugarSampleTable bloodSugarSample =
      $BloodSugarSampleTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [bloodSugarSample];
}
