// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $LocalFavoritesTable extends LocalFavorites
    with TableInfo<$LocalFavoritesTable, LocalFavoriteRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalFavoritesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _clientUuidMeta = const VerificationMeta(
    'clientUuid',
  );
  @override
  late final GeneratedColumn<String> clientUuid = GeneratedColumn<String>(
    'client_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _outfitIdMeta = const VerificationMeta(
    'outfitId',
  );
  @override
  late final GeneratedColumn<String> outfitId = GeneratedColumn<String>(
    'outfit_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _snapshotJsonMeta = const VerificationMeta(
    'snapshotJson',
  );
  @override
  late final GeneratedColumn<String> snapshotJson = GeneratedColumn<String>(
    'snapshot_json',
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
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  late final GeneratedColumnWithTypeConverter<SyncState, int> syncState =
      GeneratedColumn<int>(
        'sync_state',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<SyncState>($LocalFavoritesTable.$convertersyncState);
  @override
  List<GeneratedColumn> get $columns => [
    clientUuid,
    outfitId,
    snapshotJson,
    createdAt,
    serverUpdatedAt,
    syncState,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_favorites';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalFavoriteRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('client_uuid')) {
      context.handle(
        _clientUuidMeta,
        clientUuid.isAcceptableOrUnknown(data['client_uuid']!, _clientUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_clientUuidMeta);
    }
    if (data.containsKey('outfit_id')) {
      context.handle(
        _outfitIdMeta,
        outfitId.isAcceptableOrUnknown(data['outfit_id']!, _outfitIdMeta),
      );
    }
    if (data.containsKey('snapshot_json')) {
      context.handle(
        _snapshotJsonMeta,
        snapshotJson.isAcceptableOrUnknown(
          data['snapshot_json']!,
          _snapshotJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_snapshotJsonMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {clientUuid};
  @override
  LocalFavoriteRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalFavoriteRow(
      clientUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_uuid'],
      )!,
      outfitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}outfit_id'],
      ),
      snapshotJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}snapshot_json'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      syncState: $LocalFavoritesTable.$convertersyncState.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}sync_state'],
        )!,
      ),
    );
  }

  @override
  $LocalFavoritesTable createAlias(String alias) {
    return $LocalFavoritesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncState, int, int> $convertersyncState =
      const EnumIndexConverter<SyncState>(SyncState.values);
}

class LocalFavoriteRow extends DataClass
    implements Insertable<LocalFavoriteRow> {
  final String clientUuid;
  final String? outfitId;
  final String snapshotJson;
  final DateTime createdAt;
  final DateTime? serverUpdatedAt;
  final SyncState syncState;
  const LocalFavoriteRow({
    required this.clientUuid,
    this.outfitId,
    required this.snapshotJson,
    required this.createdAt,
    this.serverUpdatedAt,
    required this.syncState,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['client_uuid'] = Variable<String>(clientUuid);
    if (!nullToAbsent || outfitId != null) {
      map['outfit_id'] = Variable<String>(outfitId);
    }
    map['snapshot_json'] = Variable<String>(snapshotJson);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    {
      map['sync_state'] = Variable<int>(
        $LocalFavoritesTable.$convertersyncState.toSql(syncState),
      );
    }
    return map;
  }

  LocalFavoritesCompanion toCompanion(bool nullToAbsent) {
    return LocalFavoritesCompanion(
      clientUuid: Value(clientUuid),
      outfitId: outfitId == null && nullToAbsent
          ? const Value.absent()
          : Value(outfitId),
      snapshotJson: Value(snapshotJson),
      createdAt: Value(createdAt),
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      syncState: Value(syncState),
    );
  }

  factory LocalFavoriteRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalFavoriteRow(
      clientUuid: serializer.fromJson<String>(json['clientUuid']),
      outfitId: serializer.fromJson<String?>(json['outfitId']),
      snapshotJson: serializer.fromJson<String>(json['snapshotJson']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      syncState: $LocalFavoritesTable.$convertersyncState.fromJson(
        serializer.fromJson<int>(json['syncState']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'clientUuid': serializer.toJson<String>(clientUuid),
      'outfitId': serializer.toJson<String?>(outfitId),
      'snapshotJson': serializer.toJson<String>(snapshotJson),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'syncState': serializer.toJson<int>(
        $LocalFavoritesTable.$convertersyncState.toJson(syncState),
      ),
    };
  }

  LocalFavoriteRow copyWith({
    String? clientUuid,
    Value<String?> outfitId = const Value.absent(),
    String? snapshotJson,
    DateTime? createdAt,
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    SyncState? syncState,
  }) => LocalFavoriteRow(
    clientUuid: clientUuid ?? this.clientUuid,
    outfitId: outfitId.present ? outfitId.value : this.outfitId,
    snapshotJson: snapshotJson ?? this.snapshotJson,
    createdAt: createdAt ?? this.createdAt,
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    syncState: syncState ?? this.syncState,
  );
  LocalFavoriteRow copyWithCompanion(LocalFavoritesCompanion data) {
    return LocalFavoriteRow(
      clientUuid: data.clientUuid.present
          ? data.clientUuid.value
          : this.clientUuid,
      outfitId: data.outfitId.present ? data.outfitId.value : this.outfitId,
      snapshotJson: data.snapshotJson.present
          ? data.snapshotJson.value
          : this.snapshotJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalFavoriteRow(')
          ..write('clientUuid: $clientUuid, ')
          ..write('outfitId: $outfitId, ')
          ..write('snapshotJson: $snapshotJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('syncState: $syncState')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    clientUuid,
    outfitId,
    snapshotJson,
    createdAt,
    serverUpdatedAt,
    syncState,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalFavoriteRow &&
          other.clientUuid == this.clientUuid &&
          other.outfitId == this.outfitId &&
          other.snapshotJson == this.snapshotJson &&
          other.createdAt == this.createdAt &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.syncState == this.syncState);
}

class LocalFavoritesCompanion extends UpdateCompanion<LocalFavoriteRow> {
  final Value<String> clientUuid;
  final Value<String?> outfitId;
  final Value<String> snapshotJson;
  final Value<DateTime> createdAt;
  final Value<DateTime?> serverUpdatedAt;
  final Value<SyncState> syncState;
  final Value<int> rowid;
  const LocalFavoritesCompanion({
    this.clientUuid = const Value.absent(),
    this.outfitId = const Value.absent(),
    this.snapshotJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalFavoritesCompanion.insert({
    required String clientUuid,
    this.outfitId = const Value.absent(),
    required String snapshotJson,
    required DateTime createdAt,
    this.serverUpdatedAt = const Value.absent(),
    required SyncState syncState,
    this.rowid = const Value.absent(),
  }) : clientUuid = Value(clientUuid),
       snapshotJson = Value(snapshotJson),
       createdAt = Value(createdAt),
       syncState = Value(syncState);
  static Insertable<LocalFavoriteRow> custom({
    Expression<String>? clientUuid,
    Expression<String>? outfitId,
    Expression<String>? snapshotJson,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? serverUpdatedAt,
    Expression<int>? syncState,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (clientUuid != null) 'client_uuid': clientUuid,
      if (outfitId != null) 'outfit_id': outfitId,
      if (snapshotJson != null) 'snapshot_json': snapshotJson,
      if (createdAt != null) 'created_at': createdAt,
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (syncState != null) 'sync_state': syncState,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalFavoritesCompanion copyWith({
    Value<String>? clientUuid,
    Value<String?>? outfitId,
    Value<String>? snapshotJson,
    Value<DateTime>? createdAt,
    Value<DateTime?>? serverUpdatedAt,
    Value<SyncState>? syncState,
    Value<int>? rowid,
  }) {
    return LocalFavoritesCompanion(
      clientUuid: clientUuid ?? this.clientUuid,
      outfitId: outfitId ?? this.outfitId,
      snapshotJson: snapshotJson ?? this.snapshotJson,
      createdAt: createdAt ?? this.createdAt,
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      syncState: syncState ?? this.syncState,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (clientUuid.present) {
      map['client_uuid'] = Variable<String>(clientUuid.value);
    }
    if (outfitId.present) {
      map['outfit_id'] = Variable<String>(outfitId.value);
    }
    if (snapshotJson.present) {
      map['snapshot_json'] = Variable<String>(snapshotJson.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<int>(
        $LocalFavoritesTable.$convertersyncState.toSql(syncState.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalFavoritesCompanion(')
          ..write('clientUuid: $clientUuid, ')
          ..write('outfitId: $outfitId, ')
          ..write('snapshotJson: $snapshotJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('syncState: $syncState, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalSavedOutfitsTable extends LocalSavedOutfits
    with TableInfo<$LocalSavedOutfitsTable, LocalSavedOutfitRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalSavedOutfitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _clientUuidMeta = const VerificationMeta(
    'clientUuid',
  );
  @override
  late final GeneratedColumn<String> clientUuid = GeneratedColumn<String>(
    'client_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _compositionJsonMeta = const VerificationMeta(
    'compositionJson',
  );
  @override
  late final GeneratedColumn<String> compositionJson = GeneratedColumn<String>(
    'composition_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
    'score',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ruleVersionMeta = const VerificationMeta(
    'ruleVersion',
  );
  @override
  late final GeneratedColumn<int> ruleVersion = GeneratedColumn<int>(
    'rule_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
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
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  late final GeneratedColumnWithTypeConverter<SyncState, int> syncState =
      GeneratedColumn<int>(
        'sync_state',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<SyncState>($LocalSavedOutfitsTable.$convertersyncState);
  @override
  List<GeneratedColumn> get $columns => [
    clientUuid,
    title,
    compositionJson,
    score,
    ruleVersion,
    createdAt,
    updatedAt,
    serverUpdatedAt,
    syncState,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_saved_outfits';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalSavedOutfitRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('client_uuid')) {
      context.handle(
        _clientUuidMeta,
        clientUuid.isAcceptableOrUnknown(data['client_uuid']!, _clientUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_clientUuidMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('composition_json')) {
      context.handle(
        _compositionJsonMeta,
        compositionJson.isAcceptableOrUnknown(
          data['composition_json']!,
          _compositionJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_compositionJsonMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    }
    if (data.containsKey('rule_version')) {
      context.handle(
        _ruleVersionMeta,
        ruleVersion.isAcceptableOrUnknown(
          data['rule_version']!,
          _ruleVersionMeta,
        ),
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
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {clientUuid};
  @override
  LocalSavedOutfitRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalSavedOutfitRow(
      clientUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_uuid'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      compositionJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}composition_json'],
      )!,
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}score'],
      ),
      ruleVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rule_version'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      syncState: $LocalSavedOutfitsTable.$convertersyncState.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}sync_state'],
        )!,
      ),
    );
  }

  @override
  $LocalSavedOutfitsTable createAlias(String alias) {
    return $LocalSavedOutfitsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncState, int, int> $convertersyncState =
      const EnumIndexConverter<SyncState>(SyncState.values);
}

class LocalSavedOutfitRow extends DataClass
    implements Insertable<LocalSavedOutfitRow> {
  final String clientUuid;
  final String? title;
  final String compositionJson;
  final int? score;
  final int ruleVersion;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? serverUpdatedAt;
  final SyncState syncState;
  const LocalSavedOutfitRow({
    required this.clientUuid,
    this.title,
    required this.compositionJson,
    this.score,
    required this.ruleVersion,
    required this.createdAt,
    required this.updatedAt,
    this.serverUpdatedAt,
    required this.syncState,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['client_uuid'] = Variable<String>(clientUuid);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    map['composition_json'] = Variable<String>(compositionJson);
    if (!nullToAbsent || score != null) {
      map['score'] = Variable<int>(score);
    }
    map['rule_version'] = Variable<int>(ruleVersion);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    {
      map['sync_state'] = Variable<int>(
        $LocalSavedOutfitsTable.$convertersyncState.toSql(syncState),
      );
    }
    return map;
  }

  LocalSavedOutfitsCompanion toCompanion(bool nullToAbsent) {
    return LocalSavedOutfitsCompanion(
      clientUuid: Value(clientUuid),
      title: title == null && nullToAbsent
          ? const Value.absent()
          : Value(title),
      compositionJson: Value(compositionJson),
      score: score == null && nullToAbsent
          ? const Value.absent()
          : Value(score),
      ruleVersion: Value(ruleVersion),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      syncState: Value(syncState),
    );
  }

  factory LocalSavedOutfitRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalSavedOutfitRow(
      clientUuid: serializer.fromJson<String>(json['clientUuid']),
      title: serializer.fromJson<String?>(json['title']),
      compositionJson: serializer.fromJson<String>(json['compositionJson']),
      score: serializer.fromJson<int?>(json['score']),
      ruleVersion: serializer.fromJson<int>(json['ruleVersion']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      syncState: $LocalSavedOutfitsTable.$convertersyncState.fromJson(
        serializer.fromJson<int>(json['syncState']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'clientUuid': serializer.toJson<String>(clientUuid),
      'title': serializer.toJson<String?>(title),
      'compositionJson': serializer.toJson<String>(compositionJson),
      'score': serializer.toJson<int?>(score),
      'ruleVersion': serializer.toJson<int>(ruleVersion),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'syncState': serializer.toJson<int>(
        $LocalSavedOutfitsTable.$convertersyncState.toJson(syncState),
      ),
    };
  }

  LocalSavedOutfitRow copyWith({
    String? clientUuid,
    Value<String?> title = const Value.absent(),
    String? compositionJson,
    Value<int?> score = const Value.absent(),
    int? ruleVersion,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    SyncState? syncState,
  }) => LocalSavedOutfitRow(
    clientUuid: clientUuid ?? this.clientUuid,
    title: title.present ? title.value : this.title,
    compositionJson: compositionJson ?? this.compositionJson,
    score: score.present ? score.value : this.score,
    ruleVersion: ruleVersion ?? this.ruleVersion,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    syncState: syncState ?? this.syncState,
  );
  LocalSavedOutfitRow copyWithCompanion(LocalSavedOutfitsCompanion data) {
    return LocalSavedOutfitRow(
      clientUuid: data.clientUuid.present
          ? data.clientUuid.value
          : this.clientUuid,
      title: data.title.present ? data.title.value : this.title,
      compositionJson: data.compositionJson.present
          ? data.compositionJson.value
          : this.compositionJson,
      score: data.score.present ? data.score.value : this.score,
      ruleVersion: data.ruleVersion.present
          ? data.ruleVersion.value
          : this.ruleVersion,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalSavedOutfitRow(')
          ..write('clientUuid: $clientUuid, ')
          ..write('title: $title, ')
          ..write('compositionJson: $compositionJson, ')
          ..write('score: $score, ')
          ..write('ruleVersion: $ruleVersion, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('syncState: $syncState')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    clientUuid,
    title,
    compositionJson,
    score,
    ruleVersion,
    createdAt,
    updatedAt,
    serverUpdatedAt,
    syncState,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalSavedOutfitRow &&
          other.clientUuid == this.clientUuid &&
          other.title == this.title &&
          other.compositionJson == this.compositionJson &&
          other.score == this.score &&
          other.ruleVersion == this.ruleVersion &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.syncState == this.syncState);
}

class LocalSavedOutfitsCompanion extends UpdateCompanion<LocalSavedOutfitRow> {
  final Value<String> clientUuid;
  final Value<String?> title;
  final Value<String> compositionJson;
  final Value<int?> score;
  final Value<int> ruleVersion;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> serverUpdatedAt;
  final Value<SyncState> syncState;
  final Value<int> rowid;
  const LocalSavedOutfitsCompanion({
    this.clientUuid = const Value.absent(),
    this.title = const Value.absent(),
    this.compositionJson = const Value.absent(),
    this.score = const Value.absent(),
    this.ruleVersion = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalSavedOutfitsCompanion.insert({
    required String clientUuid,
    this.title = const Value.absent(),
    required String compositionJson,
    this.score = const Value.absent(),
    this.ruleVersion = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.serverUpdatedAt = const Value.absent(),
    required SyncState syncState,
    this.rowid = const Value.absent(),
  }) : clientUuid = Value(clientUuid),
       compositionJson = Value(compositionJson),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       syncState = Value(syncState);
  static Insertable<LocalSavedOutfitRow> custom({
    Expression<String>? clientUuid,
    Expression<String>? title,
    Expression<String>? compositionJson,
    Expression<int>? score,
    Expression<int>? ruleVersion,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? serverUpdatedAt,
    Expression<int>? syncState,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (clientUuid != null) 'client_uuid': clientUuid,
      if (title != null) 'title': title,
      if (compositionJson != null) 'composition_json': compositionJson,
      if (score != null) 'score': score,
      if (ruleVersion != null) 'rule_version': ruleVersion,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (syncState != null) 'sync_state': syncState,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalSavedOutfitsCompanion copyWith({
    Value<String>? clientUuid,
    Value<String?>? title,
    Value<String>? compositionJson,
    Value<int?>? score,
    Value<int>? ruleVersion,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? serverUpdatedAt,
    Value<SyncState>? syncState,
    Value<int>? rowid,
  }) {
    return LocalSavedOutfitsCompanion(
      clientUuid: clientUuid ?? this.clientUuid,
      title: title ?? this.title,
      compositionJson: compositionJson ?? this.compositionJson,
      score: score ?? this.score,
      ruleVersion: ruleVersion ?? this.ruleVersion,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      syncState: syncState ?? this.syncState,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (clientUuid.present) {
      map['client_uuid'] = Variable<String>(clientUuid.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (compositionJson.present) {
      map['composition_json'] = Variable<String>(compositionJson.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (ruleVersion.present) {
      map['rule_version'] = Variable<int>(ruleVersion.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<int>(
        $LocalSavedOutfitsTable.$convertersyncState.toSql(syncState.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalSavedOutfitsCompanion(')
          ..write('clientUuid: $clientUuid, ')
          ..write('title: $title, ')
          ..write('compositionJson: $compositionJson, ')
          ..write('score: $score, ')
          ..write('ruleVersion: $ruleVersion, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('syncState: $syncState, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedResponsesTable extends CachedResponses
    with TableInfo<$CachedResponsesTable, CachedResponseRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedResponsesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _savedAtMeta = const VerificationMeta(
    'savedAt',
  );
  @override
  late final GeneratedColumn<DateTime> savedAt = GeneratedColumn<DateTime>(
    'saved_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, body, savedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_responses';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedResponseRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('saved_at')) {
      context.handle(
        _savedAtMeta,
        savedAt.isAcceptableOrUnknown(data['saved_at']!, _savedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_savedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  CachedResponseRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedResponseRow(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      savedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}saved_at'],
      )!,
    );
  }

  @override
  $CachedResponsesTable createAlias(String alias) {
    return $CachedResponsesTable(attachedDatabase, alias);
  }
}

class CachedResponseRow extends DataClass
    implements Insertable<CachedResponseRow> {
  final String key;
  final String body;
  final DateTime savedAt;
  const CachedResponseRow({
    required this.key,
    required this.body,
    required this.savedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['body'] = Variable<String>(body);
    map['saved_at'] = Variable<DateTime>(savedAt);
    return map;
  }

  CachedResponsesCompanion toCompanion(bool nullToAbsent) {
    return CachedResponsesCompanion(
      key: Value(key),
      body: Value(body),
      savedAt: Value(savedAt),
    );
  }

  factory CachedResponseRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedResponseRow(
      key: serializer.fromJson<String>(json['key']),
      body: serializer.fromJson<String>(json['body']),
      savedAt: serializer.fromJson<DateTime>(json['savedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'body': serializer.toJson<String>(body),
      'savedAt': serializer.toJson<DateTime>(savedAt),
    };
  }

  CachedResponseRow copyWith({String? key, String? body, DateTime? savedAt}) =>
      CachedResponseRow(
        key: key ?? this.key,
        body: body ?? this.body,
        savedAt: savedAt ?? this.savedAt,
      );
  CachedResponseRow copyWithCompanion(CachedResponsesCompanion data) {
    return CachedResponseRow(
      key: data.key.present ? data.key.value : this.key,
      body: data.body.present ? data.body.value : this.body,
      savedAt: data.savedAt.present ? data.savedAt.value : this.savedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedResponseRow(')
          ..write('key: $key, ')
          ..write('body: $body, ')
          ..write('savedAt: $savedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, body, savedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedResponseRow &&
          other.key == this.key &&
          other.body == this.body &&
          other.savedAt == this.savedAt);
}

class CachedResponsesCompanion extends UpdateCompanion<CachedResponseRow> {
  final Value<String> key;
  final Value<String> body;
  final Value<DateTime> savedAt;
  final Value<int> rowid;
  const CachedResponsesCompanion({
    this.key = const Value.absent(),
    this.body = const Value.absent(),
    this.savedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedResponsesCompanion.insert({
    required String key,
    required String body,
    required DateTime savedAt,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       body = Value(body),
       savedAt = Value(savedAt);
  static Insertable<CachedResponseRow> custom({
    Expression<String>? key,
    Expression<String>? body,
    Expression<DateTime>? savedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (body != null) 'body': body,
      if (savedAt != null) 'saved_at': savedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedResponsesCompanion copyWith({
    Value<String>? key,
    Value<String>? body,
    Value<DateTime>? savedAt,
    Value<int>? rowid,
  }) {
    return CachedResponsesCompanion(
      key: key ?? this.key,
      body: body ?? this.body,
      savedAt: savedAt ?? this.savedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (savedAt.present) {
      map['saved_at'] = Variable<DateTime>(savedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedResponsesCompanion(')
          ..write('key: $key, ')
          ..write('body: $body, ')
          ..write('savedAt: $savedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $KeyValuesTable extends KeyValues
    with TableInfo<$KeyValuesTable, KeyValueRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KeyValuesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'key_values';
  @override
  VerificationContext validateIntegrity(
    Insertable<KeyValueRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  KeyValueRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KeyValueRow(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $KeyValuesTable createAlias(String alias) {
    return $KeyValuesTable(attachedDatabase, alias);
  }
}

class KeyValueRow extends DataClass implements Insertable<KeyValueRow> {
  final String key;
  final String value;
  const KeyValueRow({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  KeyValuesCompanion toCompanion(bool nullToAbsent) {
    return KeyValuesCompanion(key: Value(key), value: Value(value));
  }

  factory KeyValueRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KeyValueRow(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  KeyValueRow copyWith({String? key, String? value}) =>
      KeyValueRow(key: key ?? this.key, value: value ?? this.value);
  KeyValueRow copyWithCompanion(KeyValuesCompanion data) {
    return KeyValueRow(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KeyValueRow(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KeyValueRow &&
          other.key == this.key &&
          other.value == this.value);
}

class KeyValuesCompanion extends UpdateCompanion<KeyValueRow> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const KeyValuesCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  KeyValuesCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<KeyValueRow> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  KeyValuesCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return KeyValuesCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KeyValuesCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LocalFavoritesTable localFavorites = $LocalFavoritesTable(this);
  late final $LocalSavedOutfitsTable localSavedOutfits =
      $LocalSavedOutfitsTable(this);
  late final $CachedResponsesTable cachedResponses = $CachedResponsesTable(
    this,
  );
  late final $KeyValuesTable keyValues = $KeyValuesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    localFavorites,
    localSavedOutfits,
    cachedResponses,
    keyValues,
  ];
}

typedef $$LocalFavoritesTableCreateCompanionBuilder =
    LocalFavoritesCompanion Function({
      required String clientUuid,
      Value<String?> outfitId,
      required String snapshotJson,
      required DateTime createdAt,
      Value<DateTime?> serverUpdatedAt,
      required SyncState syncState,
      Value<int> rowid,
    });
typedef $$LocalFavoritesTableUpdateCompanionBuilder =
    LocalFavoritesCompanion Function({
      Value<String> clientUuid,
      Value<String?> outfitId,
      Value<String> snapshotJson,
      Value<DateTime> createdAt,
      Value<DateTime?> serverUpdatedAt,
      Value<SyncState> syncState,
      Value<int> rowid,
    });

class $$LocalFavoritesTableFilterComposer
    extends Composer<_$AppDatabase, $LocalFavoritesTable> {
  $$LocalFavoritesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get outfitId => $composableBuilder(
    column: $table.outfitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get snapshotJson => $composableBuilder(
    column: $table.snapshotJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncState, SyncState, int> get syncState =>
      $composableBuilder(
        column: $table.syncState,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );
}

class $$LocalFavoritesTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalFavoritesTable> {
  $$LocalFavoritesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get outfitId => $composableBuilder(
    column: $table.outfitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get snapshotJson => $composableBuilder(
    column: $table.snapshotJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalFavoritesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalFavoritesTable> {
  $$LocalFavoritesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get outfitId =>
      $composableBuilder(column: $table.outfitId, builder: (column) => column);

  GeneratedColumn<String> get snapshotJson => $composableBuilder(
    column: $table.snapshotJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<SyncState, int> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);
}

class $$LocalFavoritesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalFavoritesTable,
          LocalFavoriteRow,
          $$LocalFavoritesTableFilterComposer,
          $$LocalFavoritesTableOrderingComposer,
          $$LocalFavoritesTableAnnotationComposer,
          $$LocalFavoritesTableCreateCompanionBuilder,
          $$LocalFavoritesTableUpdateCompanionBuilder,
          (
            LocalFavoriteRow,
            BaseReferences<
              _$AppDatabase,
              $LocalFavoritesTable,
              LocalFavoriteRow
            >,
          ),
          LocalFavoriteRow,
          PrefetchHooks Function()
        > {
  $$LocalFavoritesTableTableManager(
    _$AppDatabase db,
    $LocalFavoritesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalFavoritesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalFavoritesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalFavoritesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> clientUuid = const Value.absent(),
                Value<String?> outfitId = const Value.absent(),
                Value<String> snapshotJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<SyncState> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalFavoritesCompanion(
                clientUuid: clientUuid,
                outfitId: outfitId,
                snapshotJson: snapshotJson,
                createdAt: createdAt,
                serverUpdatedAt: serverUpdatedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String clientUuid,
                Value<String?> outfitId = const Value.absent(),
                required String snapshotJson,
                required DateTime createdAt,
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                required SyncState syncState,
                Value<int> rowid = const Value.absent(),
              }) => LocalFavoritesCompanion.insert(
                clientUuid: clientUuid,
                outfitId: outfitId,
                snapshotJson: snapshotJson,
                createdAt: createdAt,
                serverUpdatedAt: serverUpdatedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$LocalFavoritesTable, LocalFavoriteRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $LocalFavoritesTable,
                    LocalFavoriteRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalFavoritesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalFavoritesTable,
      LocalFavoriteRow,
      $$LocalFavoritesTableFilterComposer,
      $$LocalFavoritesTableOrderingComposer,
      $$LocalFavoritesTableAnnotationComposer,
      $$LocalFavoritesTableCreateCompanionBuilder,
      $$LocalFavoritesTableUpdateCompanionBuilder,
      (
        LocalFavoriteRow,
        BaseReferences<_$AppDatabase, $LocalFavoritesTable, LocalFavoriteRow>,
      ),
      LocalFavoriteRow,
      PrefetchHooks Function()
    >;
typedef $$LocalSavedOutfitsTableCreateCompanionBuilder =
    LocalSavedOutfitsCompanion Function({
      required String clientUuid,
      Value<String?> title,
      required String compositionJson,
      Value<int?> score,
      Value<int> ruleVersion,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> serverUpdatedAt,
      required SyncState syncState,
      Value<int> rowid,
    });
typedef $$LocalSavedOutfitsTableUpdateCompanionBuilder =
    LocalSavedOutfitsCompanion Function({
      Value<String> clientUuid,
      Value<String?> title,
      Value<String> compositionJson,
      Value<int?> score,
      Value<int> ruleVersion,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> serverUpdatedAt,
      Value<SyncState> syncState,
      Value<int> rowid,
    });

class $$LocalSavedOutfitsTableFilterComposer
    extends Composer<_$AppDatabase, $LocalSavedOutfitsTable> {
  $$LocalSavedOutfitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get compositionJson => $composableBuilder(
    column: $table.compositionJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ruleVersion => $composableBuilder(
    column: $table.ruleVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncState, SyncState, int> get syncState =>
      $composableBuilder(
        column: $table.syncState,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );
}

class $$LocalSavedOutfitsTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalSavedOutfitsTable> {
  $$LocalSavedOutfitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get compositionJson => $composableBuilder(
    column: $table.compositionJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ruleVersion => $composableBuilder(
    column: $table.ruleVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalSavedOutfitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalSavedOutfitsTable> {
  $$LocalSavedOutfitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get clientUuid => $composableBuilder(
    column: $table.clientUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get compositionJson => $composableBuilder(
    column: $table.compositionJson,
    builder: (column) => column,
  );

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<int> get ruleVersion => $composableBuilder(
    column: $table.ruleVersion,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<SyncState, int> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);
}

class $$LocalSavedOutfitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalSavedOutfitsTable,
          LocalSavedOutfitRow,
          $$LocalSavedOutfitsTableFilterComposer,
          $$LocalSavedOutfitsTableOrderingComposer,
          $$LocalSavedOutfitsTableAnnotationComposer,
          $$LocalSavedOutfitsTableCreateCompanionBuilder,
          $$LocalSavedOutfitsTableUpdateCompanionBuilder,
          (
            LocalSavedOutfitRow,
            BaseReferences<
              _$AppDatabase,
              $LocalSavedOutfitsTable,
              LocalSavedOutfitRow
            >,
          ),
          LocalSavedOutfitRow,
          PrefetchHooks Function()
        > {
  $$LocalSavedOutfitsTableTableManager(
    _$AppDatabase db,
    $LocalSavedOutfitsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalSavedOutfitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalSavedOutfitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalSavedOutfitsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> clientUuid = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String> compositionJson = const Value.absent(),
                Value<int?> score = const Value.absent(),
                Value<int> ruleVersion = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<SyncState> syncState = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalSavedOutfitsCompanion(
                clientUuid: clientUuid,
                title: title,
                compositionJson: compositionJson,
                score: score,
                ruleVersion: ruleVersion,
                createdAt: createdAt,
                updatedAt: updatedAt,
                serverUpdatedAt: serverUpdatedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String clientUuid,
                Value<String?> title = const Value.absent(),
                required String compositionJson,
                Value<int?> score = const Value.absent(),
                Value<int> ruleVersion = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                required SyncState syncState,
                Value<int> rowid = const Value.absent(),
              }) => LocalSavedOutfitsCompanion.insert(
                clientUuid: clientUuid,
                title: title,
                compositionJson: compositionJson,
                score: score,
                ruleVersion: ruleVersion,
                createdAt: createdAt,
                updatedAt: updatedAt,
                serverUpdatedAt: serverUpdatedAt,
                syncState: syncState,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$LocalSavedOutfitsTable, LocalSavedOutfitRow>(
                    table,
                  ),
                  BaseReferences<
                    _$AppDatabase,
                    $LocalSavedOutfitsTable,
                    LocalSavedOutfitRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalSavedOutfitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalSavedOutfitsTable,
      LocalSavedOutfitRow,
      $$LocalSavedOutfitsTableFilterComposer,
      $$LocalSavedOutfitsTableOrderingComposer,
      $$LocalSavedOutfitsTableAnnotationComposer,
      $$LocalSavedOutfitsTableCreateCompanionBuilder,
      $$LocalSavedOutfitsTableUpdateCompanionBuilder,
      (
        LocalSavedOutfitRow,
        BaseReferences<
          _$AppDatabase,
          $LocalSavedOutfitsTable,
          LocalSavedOutfitRow
        >,
      ),
      LocalSavedOutfitRow,
      PrefetchHooks Function()
    >;
typedef $$CachedResponsesTableCreateCompanionBuilder =
    CachedResponsesCompanion Function({
      required String key,
      required String body,
      required DateTime savedAt,
      Value<int> rowid,
    });
typedef $$CachedResponsesTableUpdateCompanionBuilder =
    CachedResponsesCompanion Function({
      Value<String> key,
      Value<String> body,
      Value<DateTime> savedAt,
      Value<int> rowid,
    });

class $$CachedResponsesTableFilterComposer
    extends Composer<_$AppDatabase, $CachedResponsesTable> {
  $$CachedResponsesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get savedAt => $composableBuilder(
    column: $table.savedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedResponsesTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedResponsesTable> {
  $$CachedResponsesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get savedAt => $composableBuilder(
    column: $table.savedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedResponsesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedResponsesTable> {
  $$CachedResponsesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<DateTime> get savedAt =>
      $composableBuilder(column: $table.savedAt, builder: (column) => column);
}

class $$CachedResponsesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedResponsesTable,
          CachedResponseRow,
          $$CachedResponsesTableFilterComposer,
          $$CachedResponsesTableOrderingComposer,
          $$CachedResponsesTableAnnotationComposer,
          $$CachedResponsesTableCreateCompanionBuilder,
          $$CachedResponsesTableUpdateCompanionBuilder,
          (
            CachedResponseRow,
            BaseReferences<
              _$AppDatabase,
              $CachedResponsesTable,
              CachedResponseRow
            >,
          ),
          CachedResponseRow,
          PrefetchHooks Function()
        > {
  $$CachedResponsesTableTableManager(
    _$AppDatabase db,
    $CachedResponsesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedResponsesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedResponsesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedResponsesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<DateTime> savedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedResponsesCompanion(
                key: key,
                body: body,
                savedAt: savedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String body,
                required DateTime savedAt,
                Value<int> rowid = const Value.absent(),
              }) => CachedResponsesCompanion.insert(
                key: key,
                body: body,
                savedAt: savedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CachedResponsesTable, CachedResponseRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $CachedResponsesTable,
                    CachedResponseRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedResponsesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedResponsesTable,
      CachedResponseRow,
      $$CachedResponsesTableFilterComposer,
      $$CachedResponsesTableOrderingComposer,
      $$CachedResponsesTableAnnotationComposer,
      $$CachedResponsesTableCreateCompanionBuilder,
      $$CachedResponsesTableUpdateCompanionBuilder,
      (
        CachedResponseRow,
        BaseReferences<_$AppDatabase, $CachedResponsesTable, CachedResponseRow>,
      ),
      CachedResponseRow,
      PrefetchHooks Function()
    >;
typedef $$KeyValuesTableCreateCompanionBuilder =
    KeyValuesCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$KeyValuesTableUpdateCompanionBuilder =
    KeyValuesCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$KeyValuesTableFilterComposer
    extends Composer<_$AppDatabase, $KeyValuesTable> {
  $$KeyValuesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$KeyValuesTableOrderingComposer
    extends Composer<_$AppDatabase, $KeyValuesTable> {
  $$KeyValuesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$KeyValuesTableAnnotationComposer
    extends Composer<_$AppDatabase, $KeyValuesTable> {
  $$KeyValuesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$KeyValuesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $KeyValuesTable,
          KeyValueRow,
          $$KeyValuesTableFilterComposer,
          $$KeyValuesTableOrderingComposer,
          $$KeyValuesTableAnnotationComposer,
          $$KeyValuesTableCreateCompanionBuilder,
          $$KeyValuesTableUpdateCompanionBuilder,
          (
            KeyValueRow,
            BaseReferences<_$AppDatabase, $KeyValuesTable, KeyValueRow>,
          ),
          KeyValueRow,
          PrefetchHooks Function()
        > {
  $$KeyValuesTableTableManager(_$AppDatabase db, $KeyValuesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KeyValuesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KeyValuesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KeyValuesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => KeyValuesCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => KeyValuesCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$KeyValuesTable, KeyValueRow>(table),
                  BaseReferences<_$AppDatabase, $KeyValuesTable, KeyValueRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$KeyValuesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $KeyValuesTable,
      KeyValueRow,
      $$KeyValuesTableFilterComposer,
      $$KeyValuesTableOrderingComposer,
      $$KeyValuesTableAnnotationComposer,
      $$KeyValuesTableCreateCompanionBuilder,
      $$KeyValuesTableUpdateCompanionBuilder,
      (
        KeyValueRow,
        BaseReferences<_$AppDatabase, $KeyValuesTable, KeyValueRow>,
      ),
      KeyValueRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LocalFavoritesTableTableManager get localFavorites =>
      $$LocalFavoritesTableTableManager(_db, _db.localFavorites);
  $$LocalSavedOutfitsTableTableManager get localSavedOutfits =>
      $$LocalSavedOutfitsTableTableManager(_db, _db.localSavedOutfits);
  $$CachedResponsesTableTableManager get cachedResponses =>
      $$CachedResponsesTableTableManager(_db, _db.cachedResponses);
  $$KeyValuesTableTableManager get keyValues =>
      $$KeyValuesTableTableManager(_db, _db.keyValues);
}
