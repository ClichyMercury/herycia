import 'dart:convert';

import 'package:drift/drift.dart' show Value;
import 'package:flutter/foundation.dart';

import '../../../core/storage/app_database.dart';
import '../domain/wardrobe_models.dart';

@immutable
class LocalFavorite {
  const LocalFavorite({
    required this.clientUuid,
    required this.snapshot,
    required this.createdAt,
    required this.syncState,
    this.outfitId,
    this.serverUpdatedAt,
  });

  factory LocalFavorite.fromRow(LocalFavoriteRow row) => LocalFavorite(
        clientUuid: row.clientUuid,
        outfitId: row.outfitId,
        snapshot: LookSnapshot.fromJson(jsonDecode(row.snapshotJson) as Map<String, dynamic>),
        createdAt: row.createdAt,
        serverUpdatedAt: row.serverUpdatedAt,
        syncState: row.syncState,
      );

  factory LocalFavorite.fromRemote(Favorite remote) => LocalFavorite(
        clientUuid: remote.id,
        outfitId: remote.outfitId,
        snapshot: remote.snapshot,
        createdAt: remote.createdAt,
        serverUpdatedAt: remote.updatedAt,
        syncState: SyncState.synced,
      );

  final String clientUuid;
  final String? outfitId;
  final LookSnapshot snapshot;
  final DateTime createdAt;
  final DateTime? serverUpdatedAt;
  final SyncState syncState;

  String get signature => outfitId != null ? 'look:$outfitId' : snapshotSignature(snapshot);

  static String snapshotSignature(LookSnapshot snapshot) =>
      'custom:${([for (final i in snapshot.items) '${i.role.name}:${i.clothingType.slug}:${i.color.slug}']..sort()).join('|')}';

  LocalFavoritesCompanion toCompanion({SyncState? state, Value<DateTime?> serverUpdatedAt = const Value.absent()}) =>
      LocalFavoritesCompanion.insert(
        clientUuid: clientUuid,
        outfitId: Value(outfitId),
        snapshotJson: jsonEncode(snapshot.toJson()),
        createdAt: createdAt,
        serverUpdatedAt: serverUpdatedAt.present ? serverUpdatedAt : Value(this.serverUpdatedAt),
        syncState: state ?? syncState,
      );

  LocalFavorite copyWith({String? clientUuid, String? outfitId, bool clearOutfit = false, SyncState? syncState}) =>
      LocalFavorite(
        clientUuid: clientUuid ?? this.clientUuid,
        outfitId: clearOutfit ? null : outfitId ?? this.outfitId,
        snapshot: snapshot,
        createdAt: createdAt,
        serverUpdatedAt: serverUpdatedAt,
        syncState: syncState ?? this.syncState,
      );
}

@immutable
class LocalSavedOutfit {
  const LocalSavedOutfit({
    required this.clientUuid,
    required this.composition,
    required this.createdAt,
    required this.updatedAt,
    required this.syncState,
    this.title,
    this.score,
    this.ruleVersion = 1,
    this.serverUpdatedAt,
  });

  factory LocalSavedOutfit.fromRow(LocalSavedOutfitRow row) => LocalSavedOutfit(
        clientUuid: row.clientUuid,
        title: row.title,
        composition: CompositionPayload.fromJson(jsonDecode(row.compositionJson) as Map<String, dynamic>),
        score: row.score,
        ruleVersion: row.ruleVersion,
        createdAt: row.createdAt,
        updatedAt: row.updatedAt,
        serverUpdatedAt: row.serverUpdatedAt,
        syncState: row.syncState,
      );

  factory LocalSavedOutfit.fromRemote(SavedOutfit remote) => LocalSavedOutfit(
        clientUuid: remote.id,
        title: remote.title,
        composition: remote.composition,
        score: remote.score,
        ruleVersion: remote.ruleVersion,
        createdAt: remote.createdAt,
        updatedAt: remote.updatedAt,
        serverUpdatedAt: remote.updatedAt,
        syncState: SyncState.synced,
      );

  final String clientUuid;
  final String? title;
  final CompositionPayload composition;
  final int? score;
  final int ruleVersion;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? serverUpdatedAt;
  final SyncState syncState;

  SavedOutfitInput toInput() =>
      SavedOutfitInput(title: title, composition: composition, score: score, ruleVersion: ruleVersion);

  LocalSavedOutfitsCompanion toCompanion({SyncState? state, Value<DateTime?> serverUpdatedAt = const Value.absent()}) =>
      LocalSavedOutfitsCompanion.insert(
        clientUuid: clientUuid,
        title: Value(title),
        compositionJson: jsonEncode(composition.toJson()),
        score: Value(score),
        ruleVersion: Value(ruleVersion),
        createdAt: createdAt,
        updatedAt: updatedAt,
        serverUpdatedAt: serverUpdatedAt.present ? serverUpdatedAt : Value(this.serverUpdatedAt),
        syncState: state ?? syncState,
      );
}
