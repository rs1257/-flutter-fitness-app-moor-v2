// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Measurement extends DataClass implements Insertable<Measurement> {
  final int id;
  final DateTime date;
  final double value;
  final String type;
  Measurement(
      {this.id,
      @required this.date,
      @required this.value,
      @required this.type});
  factory Measurement.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    final stringType = db.typeSystem.forDartType<String>();
    return Measurement(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      value:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}value']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
    );
  }
  factory Measurement.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Measurement(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      value: serializer.fromJson<double>(json['value']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'value': serializer.toJson<double>(value),
      'type': serializer.toJson<String>(type),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Measurement>>(bool nullToAbsent) {
    return MeasurementsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
    ) as T;
  }

  Measurement copyWith({int id, DateTime date, double value, String type}) =>
      Measurement(
        id: id ?? this.id,
        date: date ?? this.date,
        value: value ?? this.value,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('Measurement(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('value: $value, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode, $mrjc(date.hashCode, $mrjc(value.hashCode, type.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Measurement &&
          other.id == id &&
          other.date == date &&
          other.value == value &&
          other.type == type);
}

class MeasurementsCompanion extends UpdateCompanion<Measurement> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<double> value;
  final Value<String> type;
  const MeasurementsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.value = const Value.absent(),
    this.type = const Value.absent(),
  });
  MeasurementsCompanion copyWith(
      {Value<int> id,
      Value<DateTime> date,
      Value<double> value,
      Value<String> type}) {
    return MeasurementsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      value: value ?? this.value,
      type: type ?? this.type,
    );
  }
}

class $MeasurementsTable extends Measurements
    with TableInfo<$MeasurementsTable, Measurement> {
  final GeneratedDatabase _db;
  final String _alias;
  $MeasurementsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  GeneratedRealColumn _value;
  @override
  GeneratedRealColumn get value => _value ??= _constructValue();
  GeneratedRealColumn _constructValue() {
    return GeneratedRealColumn(
      'value',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn(
      'type',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, date, value, type];
  @override
  $MeasurementsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'measurements';
  @override
  final String actualTableName = 'measurements';
  @override
  VerificationContext validateIntegrity(MeasurementsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.date.present) {
      context.handle(
          _dateMeta, date.isAcceptableValue(d.date.value, _dateMeta));
    } else if (date.isRequired && isInserting) {
      context.missing(_dateMeta);
    }
    if (d.value.present) {
      context.handle(
          _valueMeta, value.isAcceptableValue(d.value.value, _valueMeta));
    } else if (value.isRequired && isInserting) {
      context.missing(_valueMeta);
    }
    if (d.type.present) {
      context.handle(
          _typeMeta, type.isAcceptableValue(d.type.value, _typeMeta));
    } else if (type.isRequired && isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Measurement map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Measurement.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(MeasurementsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.date.present) {
      map['date'] = Variable<DateTime, DateTimeType>(d.date.value);
    }
    if (d.value.present) {
      map['value'] = Variable<double, RealType>(d.value.value);
    }
    if (d.type.present) {
      map['type'] = Variable<String, StringType>(d.type.value);
    }
    return map;
  }

  @override
  $MeasurementsTable createAlias(String alias) {
    return $MeasurementsTable(_db, alias);
  }
}

class Exercise extends DataClass implements Insertable<Exercise> {
  final int id;
  final Uint8List icon;
  final String name;
  final String description;
  final String equipment;
  final int type;
  final String primaryMuscles;
  final String secondaryMuscles;
  Exercise(
      {this.id,
      @required this.icon,
      @required this.name,
      @required this.description,
      @required this.equipment,
      @required this.type,
      @required this.primaryMuscles,
      @required this.secondaryMuscles});
  factory Exercise.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final uint8ListType = db.typeSystem.forDartType<Uint8List>();
    final stringType = db.typeSystem.forDartType<String>();
    return Exercise(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      icon:
          uint8ListType.mapFromDatabaseResponse(data['${effectivePrefix}icon']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      equipment: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}equipment']),
      type: intType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      primaryMuscles: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}primary_muscles']),
      secondaryMuscles: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}secondary_muscles']),
    );
  }
  factory Exercise.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Exercise(
      id: serializer.fromJson<int>(json['id']),
      icon: serializer.fromJson<Uint8List>(json['icon']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      equipment: serializer.fromJson<String>(json['equipment']),
      type: serializer.fromJson<int>(json['type']),
      primaryMuscles: serializer.fromJson<String>(json['primaryMuscles']),
      secondaryMuscles: serializer.fromJson<String>(json['secondaryMuscles']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'icon': serializer.toJson<Uint8List>(icon),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'equipment': serializer.toJson<String>(equipment),
      'type': serializer.toJson<int>(type),
      'primaryMuscles': serializer.toJson<String>(primaryMuscles),
      'secondaryMuscles': serializer.toJson<String>(secondaryMuscles),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Exercise>>(bool nullToAbsent) {
    return ExercisesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      equipment: equipment == null && nullToAbsent
          ? const Value.absent()
          : Value(equipment),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      primaryMuscles: primaryMuscles == null && nullToAbsent
          ? const Value.absent()
          : Value(primaryMuscles),
      secondaryMuscles: secondaryMuscles == null && nullToAbsent
          ? const Value.absent()
          : Value(secondaryMuscles),
    ) as T;
  }

  Exercise copyWith(
          {int id,
          Uint8List icon,
          String name,
          String description,
          String equipment,
          int type,
          String primaryMuscles,
          String secondaryMuscles}) =>
      Exercise(
        id: id ?? this.id,
        icon: icon ?? this.icon,
        name: name ?? this.name,
        description: description ?? this.description,
        equipment: equipment ?? this.equipment,
        type: type ?? this.type,
        primaryMuscles: primaryMuscles ?? this.primaryMuscles,
        secondaryMuscles: secondaryMuscles ?? this.secondaryMuscles,
      );
  @override
  String toString() {
    return (StringBuffer('Exercise(')
          ..write('id: $id, ')
          ..write('icon: $icon, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('equipment: $equipment, ')
          ..write('type: $type, ')
          ..write('primaryMuscles: $primaryMuscles, ')
          ..write('secondaryMuscles: $secondaryMuscles')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          icon.hashCode,
          $mrjc(
              name.hashCode,
              $mrjc(
                  description.hashCode,
                  $mrjc(
                      equipment.hashCode,
                      $mrjc(
                          type.hashCode,
                          $mrjc(primaryMuscles.hashCode,
                              secondaryMuscles.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Exercise &&
          other.id == id &&
          other.icon == icon &&
          other.name == name &&
          other.description == description &&
          other.equipment == equipment &&
          other.type == type &&
          other.primaryMuscles == primaryMuscles &&
          other.secondaryMuscles == secondaryMuscles);
}

class ExercisesCompanion extends UpdateCompanion<Exercise> {
  final Value<int> id;
  final Value<Uint8List> icon;
  final Value<String> name;
  final Value<String> description;
  final Value<String> equipment;
  final Value<int> type;
  final Value<String> primaryMuscles;
  final Value<String> secondaryMuscles;
  const ExercisesCompanion({
    this.id = const Value.absent(),
    this.icon = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.equipment = const Value.absent(),
    this.type = const Value.absent(),
    this.primaryMuscles = const Value.absent(),
    this.secondaryMuscles = const Value.absent(),
  });
  ExercisesCompanion copyWith(
      {Value<int> id,
      Value<Uint8List> icon,
      Value<String> name,
      Value<String> description,
      Value<String> equipment,
      Value<int> type,
      Value<String> primaryMuscles,
      Value<String> secondaryMuscles}) {
    return ExercisesCompanion(
      id: id ?? this.id,
      icon: icon ?? this.icon,
      name: name ?? this.name,
      description: description ?? this.description,
      equipment: equipment ?? this.equipment,
      type: type ?? this.type,
      primaryMuscles: primaryMuscles ?? this.primaryMuscles,
      secondaryMuscles: secondaryMuscles ?? this.secondaryMuscles,
    );
  }
}

class $ExercisesTable extends Exercises
    with TableInfo<$ExercisesTable, Exercise> {
  final GeneratedDatabase _db;
  final String _alias;
  $ExercisesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _iconMeta = const VerificationMeta('icon');
  GeneratedBlobColumn _icon;
  @override
  GeneratedBlobColumn get icon => _icon ??= _constructIcon();
  GeneratedBlobColumn _constructIcon() {
    return GeneratedBlobColumn(
      'icon',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _equipmentMeta = const VerificationMeta('equipment');
  GeneratedTextColumn _equipment;
  @override
  GeneratedTextColumn get equipment => _equipment ??= _constructEquipment();
  GeneratedTextColumn _constructEquipment() {
    return GeneratedTextColumn(
      'equipment',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedIntColumn _type;
  @override
  GeneratedIntColumn get type => _type ??= _constructType();
  GeneratedIntColumn _constructType() {
    return GeneratedIntColumn(
      'type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _primaryMusclesMeta =
      const VerificationMeta('primaryMuscles');
  GeneratedTextColumn _primaryMuscles;
  @override
  GeneratedTextColumn get primaryMuscles =>
      _primaryMuscles ??= _constructPrimaryMuscles();
  GeneratedTextColumn _constructPrimaryMuscles() {
    return GeneratedTextColumn(
      'primary_muscles',
      $tableName,
      false,
    );
  }

  final VerificationMeta _secondaryMusclesMeta =
      const VerificationMeta('secondaryMuscles');
  GeneratedTextColumn _secondaryMuscles;
  @override
  GeneratedTextColumn get secondaryMuscles =>
      _secondaryMuscles ??= _constructSecondaryMuscles();
  GeneratedTextColumn _constructSecondaryMuscles() {
    return GeneratedTextColumn(
      'secondary_muscles',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        icon,
        name,
        description,
        equipment,
        type,
        primaryMuscles,
        secondaryMuscles
      ];
  @override
  $ExercisesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'exercises';
  @override
  final String actualTableName = 'exercises';
  @override
  VerificationContext validateIntegrity(ExercisesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.icon.present) {
      context.handle(
          _iconMeta, icon.isAcceptableValue(d.icon.value, _iconMeta));
    } else if (icon.isRequired && isInserting) {
      context.missing(_iconMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.description.present) {
      context.handle(_descriptionMeta,
          description.isAcceptableValue(d.description.value, _descriptionMeta));
    } else if (description.isRequired && isInserting) {
      context.missing(_descriptionMeta);
    }
    if (d.equipment.present) {
      context.handle(_equipmentMeta,
          equipment.isAcceptableValue(d.equipment.value, _equipmentMeta));
    } else if (equipment.isRequired && isInserting) {
      context.missing(_equipmentMeta);
    }
    if (d.type.present) {
      context.handle(
          _typeMeta, type.isAcceptableValue(d.type.value, _typeMeta));
    } else if (type.isRequired && isInserting) {
      context.missing(_typeMeta);
    }
    if (d.primaryMuscles.present) {
      context.handle(
          _primaryMusclesMeta,
          primaryMuscles.isAcceptableValue(
              d.primaryMuscles.value, _primaryMusclesMeta));
    } else if (primaryMuscles.isRequired && isInserting) {
      context.missing(_primaryMusclesMeta);
    }
    if (d.secondaryMuscles.present) {
      context.handle(
          _secondaryMusclesMeta,
          secondaryMuscles.isAcceptableValue(
              d.secondaryMuscles.value, _secondaryMusclesMeta));
    } else if (secondaryMuscles.isRequired && isInserting) {
      context.missing(_secondaryMusclesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Exercise map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Exercise.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ExercisesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.icon.present) {
      map['icon'] = Variable<Uint8List, BlobType>(d.icon.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.description.present) {
      map['description'] = Variable<String, StringType>(d.description.value);
    }
    if (d.equipment.present) {
      map['equipment'] = Variable<String, StringType>(d.equipment.value);
    }
    if (d.type.present) {
      map['type'] = Variable<int, IntType>(d.type.value);
    }
    if (d.primaryMuscles.present) {
      map['primary_muscles'] =
          Variable<String, StringType>(d.primaryMuscles.value);
    }
    if (d.secondaryMuscles.present) {
      map['secondary_muscles'] =
          Variable<String, StringType>(d.secondaryMuscles.value);
    }
    return map;
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(_db, alias);
  }
}

class ExerciseRecord extends DataClass implements Insertable<ExerciseRecord> {
  final int id;
  final int exercise;
  final DateTime date;
  final int sets;
  final int reps;
  final double weight;
  final int rest;
  ExerciseRecord(
      {this.id,
      @required this.exercise,
      @required this.date,
      @required this.sets,
      @required this.reps,
      @required this.weight,
      @required this.rest});
  factory ExerciseRecord.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    return ExerciseRecord(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      exercise:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}exercise']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      sets: intType.mapFromDatabaseResponse(data['${effectivePrefix}sets']),
      reps: intType.mapFromDatabaseResponse(data['${effectivePrefix}reps']),
      weight:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}weight']),
      rest: intType.mapFromDatabaseResponse(data['${effectivePrefix}rest']),
    );
  }
  factory ExerciseRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return ExerciseRecord(
      id: serializer.fromJson<int>(json['id']),
      exercise: serializer.fromJson<int>(json['exercise']),
      date: serializer.fromJson<DateTime>(json['date']),
      sets: serializer.fromJson<int>(json['sets']),
      reps: serializer.fromJson<int>(json['reps']),
      weight: serializer.fromJson<double>(json['weight']),
      rest: serializer.fromJson<int>(json['rest']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'exercise': serializer.toJson<int>(exercise),
      'date': serializer.toJson<DateTime>(date),
      'sets': serializer.toJson<int>(sets),
      'reps': serializer.toJson<int>(reps),
      'weight': serializer.toJson<double>(weight),
      'rest': serializer.toJson<int>(rest),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<ExerciseRecord>>(
      bool nullToAbsent) {
    return ExerciseRecordsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      exercise: exercise == null && nullToAbsent
          ? const Value.absent()
          : Value(exercise),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      sets: sets == null && nullToAbsent ? const Value.absent() : Value(sets),
      reps: reps == null && nullToAbsent ? const Value.absent() : Value(reps),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      rest: rest == null && nullToAbsent ? const Value.absent() : Value(rest),
    ) as T;
  }

  ExerciseRecord copyWith(
          {int id,
          int exercise,
          DateTime date,
          int sets,
          int reps,
          double weight,
          int rest}) =>
      ExerciseRecord(
        id: id ?? this.id,
        exercise: exercise ?? this.exercise,
        date: date ?? this.date,
        sets: sets ?? this.sets,
        reps: reps ?? this.reps,
        weight: weight ?? this.weight,
        rest: rest ?? this.rest,
      );
  @override
  String toString() {
    return (StringBuffer('ExerciseRecord(')
          ..write('id: $id, ')
          ..write('exercise: $exercise, ')
          ..write('date: $date, ')
          ..write('sets: $sets, ')
          ..write('reps: $reps, ')
          ..write('weight: $weight, ')
          ..write('rest: $rest')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          exercise.hashCode,
          $mrjc(
              date.hashCode,
              $mrjc(
                  sets.hashCode,
                  $mrjc(reps.hashCode,
                      $mrjc(weight.hashCode, rest.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ExerciseRecord &&
          other.id == id &&
          other.exercise == exercise &&
          other.date == date &&
          other.sets == sets &&
          other.reps == reps &&
          other.weight == weight &&
          other.rest == rest);
}

class ExerciseRecordsCompanion extends UpdateCompanion<ExerciseRecord> {
  final Value<int> id;
  final Value<int> exercise;
  final Value<DateTime> date;
  final Value<int> sets;
  final Value<int> reps;
  final Value<double> weight;
  final Value<int> rest;
  const ExerciseRecordsCompanion({
    this.id = const Value.absent(),
    this.exercise = const Value.absent(),
    this.date = const Value.absent(),
    this.sets = const Value.absent(),
    this.reps = const Value.absent(),
    this.weight = const Value.absent(),
    this.rest = const Value.absent(),
  });
  ExerciseRecordsCompanion copyWith(
      {Value<int> id,
      Value<int> exercise,
      Value<DateTime> date,
      Value<int> sets,
      Value<int> reps,
      Value<double> weight,
      Value<int> rest}) {
    return ExerciseRecordsCompanion(
      id: id ?? this.id,
      exercise: exercise ?? this.exercise,
      date: date ?? this.date,
      sets: sets ?? this.sets,
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
      rest: rest ?? this.rest,
    );
  }
}

class $ExerciseRecordsTable extends ExerciseRecords
    with TableInfo<$ExerciseRecordsTable, ExerciseRecord> {
  final GeneratedDatabase _db;
  final String _alias;
  $ExerciseRecordsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _exerciseMeta = const VerificationMeta('exercise');
  GeneratedIntColumn _exercise;
  @override
  GeneratedIntColumn get exercise => _exercise ??= _constructExercise();
  GeneratedIntColumn _constructExercise() {
    return GeneratedIntColumn(
      'exercise',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _setsMeta = const VerificationMeta('sets');
  GeneratedIntColumn _sets;
  @override
  GeneratedIntColumn get sets => _sets ??= _constructSets();
  GeneratedIntColumn _constructSets() {
    return GeneratedIntColumn(
      'sets',
      $tableName,
      false,
    );
  }

  final VerificationMeta _repsMeta = const VerificationMeta('reps');
  GeneratedIntColumn _reps;
  @override
  GeneratedIntColumn get reps => _reps ??= _constructReps();
  GeneratedIntColumn _constructReps() {
    return GeneratedIntColumn(
      'reps',
      $tableName,
      false,
    );
  }

  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  GeneratedRealColumn _weight;
  @override
  GeneratedRealColumn get weight => _weight ??= _constructWeight();
  GeneratedRealColumn _constructWeight() {
    return GeneratedRealColumn(
      'weight',
      $tableName,
      false,
    );
  }

  final VerificationMeta _restMeta = const VerificationMeta('rest');
  GeneratedIntColumn _rest;
  @override
  GeneratedIntColumn get rest => _rest ??= _constructRest();
  GeneratedIntColumn _constructRest() {
    return GeneratedIntColumn(
      'rest',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, exercise, date, sets, reps, weight, rest];
  @override
  $ExerciseRecordsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'exercise_records';
  @override
  final String actualTableName = 'exercise_records';
  @override
  VerificationContext validateIntegrity(ExerciseRecordsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.exercise.present) {
      context.handle(_exerciseMeta,
          exercise.isAcceptableValue(d.exercise.value, _exerciseMeta));
    } else if (exercise.isRequired && isInserting) {
      context.missing(_exerciseMeta);
    }
    if (d.date.present) {
      context.handle(
          _dateMeta, date.isAcceptableValue(d.date.value, _dateMeta));
    } else if (date.isRequired && isInserting) {
      context.missing(_dateMeta);
    }
    if (d.sets.present) {
      context.handle(
          _setsMeta, sets.isAcceptableValue(d.sets.value, _setsMeta));
    } else if (sets.isRequired && isInserting) {
      context.missing(_setsMeta);
    }
    if (d.reps.present) {
      context.handle(
          _repsMeta, reps.isAcceptableValue(d.reps.value, _repsMeta));
    } else if (reps.isRequired && isInserting) {
      context.missing(_repsMeta);
    }
    if (d.weight.present) {
      context.handle(
          _weightMeta, weight.isAcceptableValue(d.weight.value, _weightMeta));
    } else if (weight.isRequired && isInserting) {
      context.missing(_weightMeta);
    }
    if (d.rest.present) {
      context.handle(
          _restMeta, rest.isAcceptableValue(d.rest.value, _restMeta));
    } else if (rest.isRequired && isInserting) {
      context.missing(_restMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExerciseRecord map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ExerciseRecord.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ExerciseRecordsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.exercise.present) {
      map['exercise'] = Variable<int, IntType>(d.exercise.value);
    }
    if (d.date.present) {
      map['date'] = Variable<DateTime, DateTimeType>(d.date.value);
    }
    if (d.sets.present) {
      map['sets'] = Variable<int, IntType>(d.sets.value);
    }
    if (d.reps.present) {
      map['reps'] = Variable<int, IntType>(d.reps.value);
    }
    if (d.weight.present) {
      map['weight'] = Variable<double, RealType>(d.weight.value);
    }
    if (d.rest.present) {
      map['rest'] = Variable<int, IntType>(d.rest.value);
    }
    return map;
  }

  @override
  $ExerciseRecordsTable createAlias(String alias) {
    return $ExerciseRecordsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $MeasurementsTable _measurements;
  $MeasurementsTable get measurements =>
      _measurements ??= $MeasurementsTable(this);
  $ExercisesTable _exercises;
  $ExercisesTable get exercises => _exercises ??= $ExercisesTable(this);
  $ExerciseRecordsTable _exerciseRecords;
  $ExerciseRecordsTable get exerciseRecords =>
      _exerciseRecords ??= $ExerciseRecordsTable(this);
  MeasurementDao _measurementDao;
  MeasurementDao get measurementDao =>
      _measurementDao ??= MeasurementDao(this as AppDatabase);
  ExerciseDao _exerciseDao;
  ExerciseDao get exerciseDao =>
      _exerciseDao ??= ExerciseDao(this as AppDatabase);
  ExerciseRecordDao _exerciseRecordDao;
  ExerciseRecordDao get exerciseRecordDao =>
      _exerciseRecordDao ??= ExerciseRecordDao(this as AppDatabase);
  @override
  List<TableInfo> get allTables => [measurements, exercises, exerciseRecords];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$MeasurementDaoMixin on DatabaseAccessor<AppDatabase> {
  $MeasurementsTable get measurements => db.measurements;
}

mixin _$ExerciseDaoMixin on DatabaseAccessor<AppDatabase> {
  $ExercisesTable get exercises => db.exercises;
}

mixin _$ExerciseRecordDaoMixin on DatabaseAccessor<AppDatabase> {
  $ExerciseRecordsTable get exerciseRecords => db.exerciseRecords;
}
