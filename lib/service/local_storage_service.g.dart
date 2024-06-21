// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_storage_service.dart';

// ignore_for_file: type=lint
class $AuthInfoTable extends AuthInfo
    with TableInfo<$AuthInfoTable, AuthInfoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthInfoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
      'token', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [token];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'auth_info';
  @override
  VerificationContext validateIntegrity(Insertable<AuthInfoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token']!, _tokenMeta));
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  AuthInfoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuthInfoData(
      token: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}token'])!,
    );
  }

  @override
  $AuthInfoTable createAlias(String alias) {
    return $AuthInfoTable(attachedDatabase, alias);
  }
}

class AuthInfoData extends DataClass implements Insertable<AuthInfoData> {
  final String token;
  const AuthInfoData({required this.token});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['token'] = Variable<String>(token);
    return map;
  }

  AuthInfoCompanion toCompanion(bool nullToAbsent) {
    return AuthInfoCompanion(
      token: Value(token),
    );
  }

  factory AuthInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuthInfoData(
      token: serializer.fromJson<String>(json['token']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'token': serializer.toJson<String>(token),
    };
  }

  AuthInfoData copyWith({String? token}) => AuthInfoData(
        token: token ?? this.token,
      );
  @override
  String toString() {
    return (StringBuffer('AuthInfoData(')
          ..write('token: $token')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => token.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthInfoData && other.token == this.token);
}

class AuthInfoCompanion extends UpdateCompanion<AuthInfoData> {
  final Value<String> token;
  final Value<int> rowid;
  const AuthInfoCompanion({
    this.token = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AuthInfoCompanion.insert({
    required String token,
    this.rowid = const Value.absent(),
  }) : token = Value(token);
  static Insertable<AuthInfoData> custom({
    Expression<String>? token,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (token != null) 'token': token,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AuthInfoCompanion copyWith({Value<String>? token, Value<int>? rowid}) {
    return AuthInfoCompanion(
      token: token ?? this.token,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthInfoCompanion(')
          ..write('token: $token, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalStorageService extends GeneratedDatabase {
  _$LocalStorageService(QueryExecutor e) : super(e);
  _$LocalStorageServiceManager get managers =>
      _$LocalStorageServiceManager(this);
  late final $AuthInfoTable authInfo = $AuthInfoTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [authInfo];
}

typedef $$AuthInfoTableInsertCompanionBuilder = AuthInfoCompanion Function({
  required String token,
  Value<int> rowid,
});
typedef $$AuthInfoTableUpdateCompanionBuilder = AuthInfoCompanion Function({
  Value<String> token,
  Value<int> rowid,
});

class $$AuthInfoTableTableManager extends RootTableManager<
    _$LocalStorageService,
    $AuthInfoTable,
    AuthInfoData,
    $$AuthInfoTableFilterComposer,
    $$AuthInfoTableOrderingComposer,
    $$AuthInfoTableProcessedTableManager,
    $$AuthInfoTableInsertCompanionBuilder,
    $$AuthInfoTableUpdateCompanionBuilder> {
  $$AuthInfoTableTableManager(_$LocalStorageService db, $AuthInfoTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AuthInfoTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AuthInfoTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$AuthInfoTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<String> token = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AuthInfoCompanion(
            token: token,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required String token,
            Value<int> rowid = const Value.absent(),
          }) =>
              AuthInfoCompanion.insert(
            token: token,
            rowid: rowid,
          ),
        ));
}

class $$AuthInfoTableProcessedTableManager extends ProcessedTableManager<
    _$LocalStorageService,
    $AuthInfoTable,
    AuthInfoData,
    $$AuthInfoTableFilterComposer,
    $$AuthInfoTableOrderingComposer,
    $$AuthInfoTableProcessedTableManager,
    $$AuthInfoTableInsertCompanionBuilder,
    $$AuthInfoTableUpdateCompanionBuilder> {
  $$AuthInfoTableProcessedTableManager(super.$state);
}

class $$AuthInfoTableFilterComposer
    extends FilterComposer<_$LocalStorageService, $AuthInfoTable> {
  $$AuthInfoTableFilterComposer(super.$state);
  ColumnFilters<String> get token => $state.composableBuilder(
      column: $state.table.token,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$AuthInfoTableOrderingComposer
    extends OrderingComposer<_$LocalStorageService, $AuthInfoTable> {
  $$AuthInfoTableOrderingComposer(super.$state);
  ColumnOrderings<String> get token => $state.composableBuilder(
      column: $state.table.token,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$LocalStorageServiceManager {
  final _$LocalStorageService _db;
  _$LocalStorageServiceManager(this._db);
  $$AuthInfoTableTableManager get authInfo =>
      $$AuthInfoTableTableManager(_db, _db.authInfo);
}
