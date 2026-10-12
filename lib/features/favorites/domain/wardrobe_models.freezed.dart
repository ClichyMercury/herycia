// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wardrobe_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompositionPayload {

 List<RequestItem> get items; String? get occasionSlug; String? get styleSlug;
/// Create a copy of CompositionPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompositionPayloadCopyWith<CompositionPayload> get copyWith => _$CompositionPayloadCopyWithImpl<CompositionPayload>(this as CompositionPayload, _$identity);

  /// Serializes this CompositionPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompositionPayload&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.occasionSlug, occasionSlug) || other.occasionSlug == occasionSlug)&&(identical(other.styleSlug, styleSlug) || other.styleSlug == styleSlug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),occasionSlug,styleSlug);

@override
String toString() {
  return 'CompositionPayload(items: $items, occasionSlug: $occasionSlug, styleSlug: $styleSlug)';
}


}

/// @nodoc
abstract mixin class $CompositionPayloadCopyWith<$Res>  {
  factory $CompositionPayloadCopyWith(CompositionPayload value, $Res Function(CompositionPayload) _then) = _$CompositionPayloadCopyWithImpl;
@useResult
$Res call({
 List<RequestItem> items, String? occasionSlug, String? styleSlug
});




}
/// @nodoc
class _$CompositionPayloadCopyWithImpl<$Res>
    implements $CompositionPayloadCopyWith<$Res> {
  _$CompositionPayloadCopyWithImpl(this._self, this._then);

  final CompositionPayload _self;
  final $Res Function(CompositionPayload) _then;

/// Create a copy of CompositionPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? occasionSlug = freezed,Object? styleSlug = freezed,}) {
  return _then(CompositionPayload(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<RequestItem>,occasionSlug: freezed == occasionSlug ? _self.occasionSlug : occasionSlug // ignore: cast_nullable_to_non_nullable
as String?,styleSlug: freezed == styleSlug ? _self.styleSlug : styleSlug // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CompositionPayload].
extension CompositionPayloadPatterns on CompositionPayload {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompositionPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompositionPayload() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompositionPayload value)  $default,){
final _that = this;
switch (_that) {
case _CompositionPayload():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompositionPayload value)?  $default,){
final _that = this;
switch (_that) {
case _CompositionPayload() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RequestItem> items,  String? occasionSlug,  String? styleSlug)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompositionPayload() when $default != null:
return $default(_that.items,_that.occasionSlug,_that.styleSlug);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RequestItem> items,  String? occasionSlug,  String? styleSlug)  $default,) {final _that = this;
switch (_that) {
case _CompositionPayload():
return $default(_that.items,_that.occasionSlug,_that.styleSlug);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RequestItem> items,  String? occasionSlug,  String? styleSlug)?  $default,) {final _that = this;
switch (_that) {
case _CompositionPayload() when $default != null:
return $default(_that.items,_that.occasionSlug,_that.styleSlug);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompositionPayload implements CompositionPayload {
  const _CompositionPayload({required  List<RequestItem> items, this.occasionSlug, this.styleSlug}): _items = items;
  factory _CompositionPayload.fromJson(Map<String, dynamic> json) => _$CompositionPayloadFromJson(json);

 final  List<RequestItem> _items;
@override List<RequestItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? occasionSlug;
@override final  String? styleSlug;

/// Create a copy of CompositionPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompositionPayloadCopyWith<_CompositionPayload> get copyWith => __$CompositionPayloadCopyWithImpl<_CompositionPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompositionPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompositionPayload&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.occasionSlug, occasionSlug) || other.occasionSlug == occasionSlug)&&(identical(other.styleSlug, styleSlug) || other.styleSlug == styleSlug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),occasionSlug,styleSlug);

@override
String toString() {
  return 'CompositionPayload(items: $items, occasionSlug: $occasionSlug, styleSlug: $styleSlug)';
}


}

/// @nodoc
abstract mixin class _$CompositionPayloadCopyWith<$Res> implements $CompositionPayloadCopyWith<$Res> {
  factory _$CompositionPayloadCopyWith(_CompositionPayload value, $Res Function(_CompositionPayload) _then) = __$CompositionPayloadCopyWithImpl;
@override @useResult
$Res call({
 List<RequestItem> items, String? occasionSlug, String? styleSlug
});




}
/// @nodoc
class __$CompositionPayloadCopyWithImpl<$Res>
    implements _$CompositionPayloadCopyWith<$Res> {
  __$CompositionPayloadCopyWithImpl(this._self, this._then);

  final _CompositionPayload _self;
  final $Res Function(_CompositionPayload) _then;

/// Create a copy of CompositionPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? occasionSlug = freezed,Object? styleSlug = freezed,}) {
  return _then(_CompositionPayload(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<RequestItem>,occasionSlug: freezed == occasionSlug ? _self.occasionSlug : occasionSlug // ignore: cast_nullable_to_non_nullable
as String?,styleSlug: freezed == styleSlug ? _self.styleSlug : styleSlug // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LookSnapshot {

 String get title; List<RequestItem> get items; String? get occasionSlug; String? get styleSlug; int? get score; String? get imageUrl; String? get explanation;
/// Create a copy of LookSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LookSnapshotCopyWith<LookSnapshot> get copyWith => _$LookSnapshotCopyWithImpl<LookSnapshot>(this as LookSnapshot, _$identity);

  /// Serializes this LookSnapshot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LookSnapshot&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.occasionSlug, occasionSlug) || other.occasionSlug == occasionSlug)&&(identical(other.styleSlug, styleSlug) || other.styleSlug == styleSlug)&&(identical(other.score, score) || other.score == score)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(items),occasionSlug,styleSlug,score,imageUrl,explanation);

@override
String toString() {
  return 'LookSnapshot(title: $title, items: $items, occasionSlug: $occasionSlug, styleSlug: $styleSlug, score: $score, imageUrl: $imageUrl, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class $LookSnapshotCopyWith<$Res>  {
  factory $LookSnapshotCopyWith(LookSnapshot value, $Res Function(LookSnapshot) _then) = _$LookSnapshotCopyWithImpl;
@useResult
$Res call({
 String title, List<RequestItem> items, String? occasionSlug, String? styleSlug, int? score, String? imageUrl, String? explanation
});




}
/// @nodoc
class _$LookSnapshotCopyWithImpl<$Res>
    implements $LookSnapshotCopyWith<$Res> {
  _$LookSnapshotCopyWithImpl(this._self, this._then);

  final LookSnapshot _self;
  final $Res Function(LookSnapshot) _then;

/// Create a copy of LookSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? items = null,Object? occasionSlug = freezed,Object? styleSlug = freezed,Object? score = freezed,Object? imageUrl = freezed,Object? explanation = freezed,}) {
  return _then(LookSnapshot(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<RequestItem>,occasionSlug: freezed == occasionSlug ? _self.occasionSlug : occasionSlug // ignore: cast_nullable_to_non_nullable
as String?,styleSlug: freezed == styleSlug ? _self.styleSlug : styleSlug // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LookSnapshot].
extension LookSnapshotPatterns on LookSnapshot {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LookSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LookSnapshot() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LookSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _LookSnapshot():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LookSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _LookSnapshot() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  List<RequestItem> items,  String? occasionSlug,  String? styleSlug,  int? score,  String? imageUrl,  String? explanation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LookSnapshot() when $default != null:
return $default(_that.title,_that.items,_that.occasionSlug,_that.styleSlug,_that.score,_that.imageUrl,_that.explanation);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  List<RequestItem> items,  String? occasionSlug,  String? styleSlug,  int? score,  String? imageUrl,  String? explanation)  $default,) {final _that = this;
switch (_that) {
case _LookSnapshot():
return $default(_that.title,_that.items,_that.occasionSlug,_that.styleSlug,_that.score,_that.imageUrl,_that.explanation);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  List<RequestItem> items,  String? occasionSlug,  String? styleSlug,  int? score,  String? imageUrl,  String? explanation)?  $default,) {final _that = this;
switch (_that) {
case _LookSnapshot() when $default != null:
return $default(_that.title,_that.items,_that.occasionSlug,_that.styleSlug,_that.score,_that.imageUrl,_that.explanation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LookSnapshot implements LookSnapshot {
  const _LookSnapshot({required this.title, required  List<RequestItem> items, this.occasionSlug, this.styleSlug, this.score, this.imageUrl, this.explanation}): _items = items;
  factory _LookSnapshot.fromJson(Map<String, dynamic> json) => _$LookSnapshotFromJson(json);

@override final  String title;
 final  List<RequestItem> _items;
@override List<RequestItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? occasionSlug;
@override final  String? styleSlug;
@override final  int? score;
@override final  String? imageUrl;
@override final  String? explanation;

/// Create a copy of LookSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LookSnapshotCopyWith<_LookSnapshot> get copyWith => __$LookSnapshotCopyWithImpl<_LookSnapshot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LookSnapshotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LookSnapshot&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.occasionSlug, occasionSlug) || other.occasionSlug == occasionSlug)&&(identical(other.styleSlug, styleSlug) || other.styleSlug == styleSlug)&&(identical(other.score, score) || other.score == score)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(_items),occasionSlug,styleSlug,score,imageUrl,explanation);

@override
String toString() {
  return 'LookSnapshot(title: $title, items: $items, occasionSlug: $occasionSlug, styleSlug: $styleSlug, score: $score, imageUrl: $imageUrl, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class _$LookSnapshotCopyWith<$Res> implements $LookSnapshotCopyWith<$Res> {
  factory _$LookSnapshotCopyWith(_LookSnapshot value, $Res Function(_LookSnapshot) _then) = __$LookSnapshotCopyWithImpl;
@override @useResult
$Res call({
 String title, List<RequestItem> items, String? occasionSlug, String? styleSlug, int? score, String? imageUrl, String? explanation
});




}
/// @nodoc
class __$LookSnapshotCopyWithImpl<$Res>
    implements _$LookSnapshotCopyWith<$Res> {
  __$LookSnapshotCopyWithImpl(this._self, this._then);

  final _LookSnapshot _self;
  final $Res Function(_LookSnapshot) _then;

/// Create a copy of LookSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? items = null,Object? occasionSlug = freezed,Object? styleSlug = freezed,Object? score = freezed,Object? imageUrl = freezed,Object? explanation = freezed,}) {
  return _then(_LookSnapshot(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<RequestItem>,occasionSlug: freezed == occasionSlug ? _self.occasionSlug : occasionSlug // ignore: cast_nullable_to_non_nullable
as String?,styleSlug: freezed == styleSlug ? _self.styleSlug : styleSlug // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Favorite {

@IdConverter() String get id; String get clientUuid;@NullableIdConverter() String? get outfitId; LookSnapshot get snapshot;@UtcDateTimeConverter() DateTime get createdAt;@UtcDateTimeConverter() DateTime get updatedAt;
/// Create a copy of Favorite
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteCopyWith<Favorite> get copyWith => _$FavoriteCopyWithImpl<Favorite>(this as Favorite, _$identity);

  /// Serializes this Favorite to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Favorite&&(identical(other.id, id) || other.id == id)&&(identical(other.clientUuid, clientUuid) || other.clientUuid == clientUuid)&&(identical(other.outfitId, outfitId) || other.outfitId == outfitId)&&(identical(other.snapshot, snapshot) || other.snapshot == snapshot)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientUuid,outfitId,snapshot,createdAt,updatedAt);

@override
String toString() {
  return 'Favorite(id: $id, clientUuid: $clientUuid, outfitId: $outfitId, snapshot: $snapshot, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $FavoriteCopyWith<$Res>  {
  factory $FavoriteCopyWith(Favorite value, $Res Function(Favorite) _then) = _$FavoriteCopyWithImpl;
@useResult
$Res call({
@IdConverter() String id, String clientUuid,@NullableIdConverter() String? outfitId, LookSnapshot snapshot,@UtcDateTimeConverter() DateTime createdAt,@UtcDateTimeConverter() DateTime updatedAt
});


$LookSnapshotCopyWith<$Res> get snapshot;

}
/// @nodoc
class _$FavoriteCopyWithImpl<$Res>
    implements $FavoriteCopyWith<$Res> {
  _$FavoriteCopyWithImpl(this._self, this._then);

  final Favorite _self;
  final $Res Function(Favorite) _then;

/// Create a copy of Favorite
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clientUuid = null,Object? outfitId = freezed,Object? snapshot = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(Favorite(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientUuid: null == clientUuid ? _self.clientUuid : clientUuid // ignore: cast_nullable_to_non_nullable
as String,outfitId: freezed == outfitId ? _self.outfitId : outfitId // ignore: cast_nullable_to_non_nullable
as String?,snapshot: null == snapshot ? _self.snapshot : snapshot // ignore: cast_nullable_to_non_nullable
as LookSnapshot,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of Favorite
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LookSnapshotCopyWith<$Res> get snapshot {
  
  return $LookSnapshotCopyWith<$Res>(_self.snapshot, (value) {
    return _then(_self.copyWith(snapshot: value));
  });
}
}


/// Adds pattern-matching-related methods to [Favorite].
extension FavoritePatterns on Favorite {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Favorite value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Favorite() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Favorite value)  $default,){
final _that = this;
switch (_that) {
case _Favorite():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Favorite value)?  $default,){
final _that = this;
switch (_that) {
case _Favorite() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String clientUuid, @NullableIdConverter()  String? outfitId,  LookSnapshot snapshot, @UtcDateTimeConverter()  DateTime createdAt, @UtcDateTimeConverter()  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Favorite() when $default != null:
return $default(_that.id,_that.clientUuid,_that.outfitId,_that.snapshot,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String clientUuid, @NullableIdConverter()  String? outfitId,  LookSnapshot snapshot, @UtcDateTimeConverter()  DateTime createdAt, @UtcDateTimeConverter()  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Favorite():
return $default(_that.id,_that.clientUuid,_that.outfitId,_that.snapshot,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String id,  String clientUuid, @NullableIdConverter()  String? outfitId,  LookSnapshot snapshot, @UtcDateTimeConverter()  DateTime createdAt, @UtcDateTimeConverter()  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Favorite() when $default != null:
return $default(_that.id,_that.clientUuid,_that.outfitId,_that.snapshot,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Favorite implements Favorite {
  const _Favorite({@IdConverter() required this.id, required this.clientUuid, @NullableIdConverter() this.outfitId, required this.snapshot, @UtcDateTimeConverter() required this.createdAt, @UtcDateTimeConverter() required this.updatedAt});
  factory _Favorite.fromJson(Map<String, dynamic> json) => _$FavoriteFromJson(json);

@override@IdConverter() final  String id;
@override final  String clientUuid;
@override@NullableIdConverter() final  String? outfitId;
@override final  LookSnapshot snapshot;
@override@UtcDateTimeConverter() final  DateTime createdAt;
@override@UtcDateTimeConverter() final  DateTime updatedAt;

/// Create a copy of Favorite
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteCopyWith<_Favorite> get copyWith => __$FavoriteCopyWithImpl<_Favorite>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FavoriteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Favorite&&(identical(other.id, id) || other.id == id)&&(identical(other.clientUuid, clientUuid) || other.clientUuid == clientUuid)&&(identical(other.outfitId, outfitId) || other.outfitId == outfitId)&&(identical(other.snapshot, snapshot) || other.snapshot == snapshot)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientUuid,outfitId,snapshot,createdAt,updatedAt);

@override
String toString() {
  return 'Favorite(id: $id, clientUuid: $clientUuid, outfitId: $outfitId, snapshot: $snapshot, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$FavoriteCopyWith<$Res> implements $FavoriteCopyWith<$Res> {
  factory _$FavoriteCopyWith(_Favorite value, $Res Function(_Favorite) _then) = __$FavoriteCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String id, String clientUuid,@NullableIdConverter() String? outfitId, LookSnapshot snapshot,@UtcDateTimeConverter() DateTime createdAt,@UtcDateTimeConverter() DateTime updatedAt
});


@override $LookSnapshotCopyWith<$Res> get snapshot;

}
/// @nodoc
class __$FavoriteCopyWithImpl<$Res>
    implements _$FavoriteCopyWith<$Res> {
  __$FavoriteCopyWithImpl(this._self, this._then);

  final _Favorite _self;
  final $Res Function(_Favorite) _then;

/// Create a copy of Favorite
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clientUuid = null,Object? outfitId = freezed,Object? snapshot = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Favorite(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientUuid: null == clientUuid ? _self.clientUuid : clientUuid // ignore: cast_nullable_to_non_nullable
as String,outfitId: freezed == outfitId ? _self.outfitId : outfitId // ignore: cast_nullable_to_non_nullable
as String?,snapshot: null == snapshot ? _self.snapshot : snapshot // ignore: cast_nullable_to_non_nullable
as LookSnapshot,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of Favorite
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LookSnapshotCopyWith<$Res> get snapshot {
  
  return $LookSnapshotCopyWith<$Res>(_self.snapshot, (value) {
    return _then(_self.copyWith(snapshot: value));
  });
}
}


/// @nodoc
mixin _$FavoriteInput {

 String get clientUuid;@NullableIdConverter() String? get outfitId; LookSnapshot get snapshot;
/// Create a copy of FavoriteInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteInputCopyWith<FavoriteInput> get copyWith => _$FavoriteInputCopyWithImpl<FavoriteInput>(this as FavoriteInput, _$identity);

  /// Serializes this FavoriteInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteInput&&(identical(other.clientUuid, clientUuid) || other.clientUuid == clientUuid)&&(identical(other.outfitId, outfitId) || other.outfitId == outfitId)&&(identical(other.snapshot, snapshot) || other.snapshot == snapshot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientUuid,outfitId,snapshot);

@override
String toString() {
  return 'FavoriteInput(clientUuid: $clientUuid, outfitId: $outfitId, snapshot: $snapshot)';
}


}

/// @nodoc
abstract mixin class $FavoriteInputCopyWith<$Res>  {
  factory $FavoriteInputCopyWith(FavoriteInput value, $Res Function(FavoriteInput) _then) = _$FavoriteInputCopyWithImpl;
@useResult
$Res call({
 String clientUuid,@NullableIdConverter() String? outfitId, LookSnapshot snapshot
});


$LookSnapshotCopyWith<$Res> get snapshot;

}
/// @nodoc
class _$FavoriteInputCopyWithImpl<$Res>
    implements $FavoriteInputCopyWith<$Res> {
  _$FavoriteInputCopyWithImpl(this._self, this._then);

  final FavoriteInput _self;
  final $Res Function(FavoriteInput) _then;

/// Create a copy of FavoriteInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientUuid = null,Object? outfitId = freezed,Object? snapshot = null,}) {
  return _then(FavoriteInput(
clientUuid: null == clientUuid ? _self.clientUuid : clientUuid // ignore: cast_nullable_to_non_nullable
as String,outfitId: freezed == outfitId ? _self.outfitId : outfitId // ignore: cast_nullable_to_non_nullable
as String?,snapshot: null == snapshot ? _self.snapshot : snapshot // ignore: cast_nullable_to_non_nullable
as LookSnapshot,
  ));
}
/// Create a copy of FavoriteInput
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LookSnapshotCopyWith<$Res> get snapshot {
  
  return $LookSnapshotCopyWith<$Res>(_self.snapshot, (value) {
    return _then(_self.copyWith(snapshot: value));
  });
}
}


/// Adds pattern-matching-related methods to [FavoriteInput].
extension FavoriteInputPatterns on FavoriteInput {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoriteInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoriteInput() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoriteInput value)  $default,){
final _that = this;
switch (_that) {
case _FavoriteInput():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoriteInput value)?  $default,){
final _that = this;
switch (_that) {
case _FavoriteInput() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String clientUuid, @NullableIdConverter()  String? outfitId,  LookSnapshot snapshot)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoriteInput() when $default != null:
return $default(_that.clientUuid,_that.outfitId,_that.snapshot);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String clientUuid, @NullableIdConverter()  String? outfitId,  LookSnapshot snapshot)  $default,) {final _that = this;
switch (_that) {
case _FavoriteInput():
return $default(_that.clientUuid,_that.outfitId,_that.snapshot);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String clientUuid, @NullableIdConverter()  String? outfitId,  LookSnapshot snapshot)?  $default,) {final _that = this;
switch (_that) {
case _FavoriteInput() when $default != null:
return $default(_that.clientUuid,_that.outfitId,_that.snapshot);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FavoriteInput implements FavoriteInput {
  const _FavoriteInput({required this.clientUuid, @NullableIdConverter() this.outfitId, required this.snapshot});
  factory _FavoriteInput.fromJson(Map<String, dynamic> json) => _$FavoriteInputFromJson(json);

@override final  String clientUuid;
@override@NullableIdConverter() final  String? outfitId;
@override final  LookSnapshot snapshot;

/// Create a copy of FavoriteInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteInputCopyWith<_FavoriteInput> get copyWith => __$FavoriteInputCopyWithImpl<_FavoriteInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FavoriteInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteInput&&(identical(other.clientUuid, clientUuid) || other.clientUuid == clientUuid)&&(identical(other.outfitId, outfitId) || other.outfitId == outfitId)&&(identical(other.snapshot, snapshot) || other.snapshot == snapshot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientUuid,outfitId,snapshot);

@override
String toString() {
  return 'FavoriteInput(clientUuid: $clientUuid, outfitId: $outfitId, snapshot: $snapshot)';
}


}

/// @nodoc
abstract mixin class _$FavoriteInputCopyWith<$Res> implements $FavoriteInputCopyWith<$Res> {
  factory _$FavoriteInputCopyWith(_FavoriteInput value, $Res Function(_FavoriteInput) _then) = __$FavoriteInputCopyWithImpl;
@override @useResult
$Res call({
 String clientUuid,@NullableIdConverter() String? outfitId, LookSnapshot snapshot
});


@override $LookSnapshotCopyWith<$Res> get snapshot;

}
/// @nodoc
class __$FavoriteInputCopyWithImpl<$Res>
    implements _$FavoriteInputCopyWith<$Res> {
  __$FavoriteInputCopyWithImpl(this._self, this._then);

  final _FavoriteInput _self;
  final $Res Function(_FavoriteInput) _then;

/// Create a copy of FavoriteInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientUuid = null,Object? outfitId = freezed,Object? snapshot = null,}) {
  return _then(_FavoriteInput(
clientUuid: null == clientUuid ? _self.clientUuid : clientUuid // ignore: cast_nullable_to_non_nullable
as String,outfitId: freezed == outfitId ? _self.outfitId : outfitId // ignore: cast_nullable_to_non_nullable
as String?,snapshot: null == snapshot ? _self.snapshot : snapshot // ignore: cast_nullable_to_non_nullable
as LookSnapshot,
  ));
}

/// Create a copy of FavoriteInput
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LookSnapshotCopyWith<$Res> get snapshot {
  
  return $LookSnapshotCopyWith<$Res>(_self.snapshot, (value) {
    return _then(_self.copyWith(snapshot: value));
  });
}
}


/// @nodoc
mixin _$SavedOutfit {

@IdConverter() String get id; String get clientUuid; String? get title; CompositionPayload get composition; int? get score; String? get ruleVersion;@UtcDateTimeConverter() DateTime get createdAt;@UtcDateTimeConverter() DateTime get updatedAt;
/// Create a copy of SavedOutfit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedOutfitCopyWith<SavedOutfit> get copyWith => _$SavedOutfitCopyWithImpl<SavedOutfit>(this as SavedOutfit, _$identity);

  /// Serializes this SavedOutfit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedOutfit&&(identical(other.id, id) || other.id == id)&&(identical(other.clientUuid, clientUuid) || other.clientUuid == clientUuid)&&(identical(other.title, title) || other.title == title)&&(identical(other.composition, composition) || other.composition == composition)&&(identical(other.score, score) || other.score == score)&&(identical(other.ruleVersion, ruleVersion) || other.ruleVersion == ruleVersion)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientUuid,title,composition,score,ruleVersion,createdAt,updatedAt);

@override
String toString() {
  return 'SavedOutfit(id: $id, clientUuid: $clientUuid, title: $title, composition: $composition, score: $score, ruleVersion: $ruleVersion, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SavedOutfitCopyWith<$Res>  {
  factory $SavedOutfitCopyWith(SavedOutfit value, $Res Function(SavedOutfit) _then) = _$SavedOutfitCopyWithImpl;
@useResult
$Res call({
@IdConverter() String id, String clientUuid, String? title, CompositionPayload composition, int? score, String? ruleVersion,@UtcDateTimeConverter() DateTime createdAt,@UtcDateTimeConverter() DateTime updatedAt
});


$CompositionPayloadCopyWith<$Res> get composition;

}
/// @nodoc
class _$SavedOutfitCopyWithImpl<$Res>
    implements $SavedOutfitCopyWith<$Res> {
  _$SavedOutfitCopyWithImpl(this._self, this._then);

  final SavedOutfit _self;
  final $Res Function(SavedOutfit) _then;

/// Create a copy of SavedOutfit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clientUuid = null,Object? title = freezed,Object? composition = null,Object? score = freezed,Object? ruleVersion = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(SavedOutfit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientUuid: null == clientUuid ? _self.clientUuid : clientUuid // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,composition: null == composition ? _self.composition : composition // ignore: cast_nullable_to_non_nullable
as CompositionPayload,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,ruleVersion: freezed == ruleVersion ? _self.ruleVersion : ruleVersion // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of SavedOutfit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompositionPayloadCopyWith<$Res> get composition {
  
  return $CompositionPayloadCopyWith<$Res>(_self.composition, (value) {
    return _then(_self.copyWith(composition: value));
  });
}
}


/// Adds pattern-matching-related methods to [SavedOutfit].
extension SavedOutfitPatterns on SavedOutfit {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedOutfit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedOutfit() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedOutfit value)  $default,){
final _that = this;
switch (_that) {
case _SavedOutfit():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedOutfit value)?  $default,){
final _that = this;
switch (_that) {
case _SavedOutfit() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String clientUuid,  String? title,  CompositionPayload composition,  int? score,  String? ruleVersion, @UtcDateTimeConverter()  DateTime createdAt, @UtcDateTimeConverter()  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedOutfit() when $default != null:
return $default(_that.id,_that.clientUuid,_that.title,_that.composition,_that.score,_that.ruleVersion,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String clientUuid,  String? title,  CompositionPayload composition,  int? score,  String? ruleVersion, @UtcDateTimeConverter()  DateTime createdAt, @UtcDateTimeConverter()  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SavedOutfit():
return $default(_that.id,_that.clientUuid,_that.title,_that.composition,_that.score,_that.ruleVersion,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String id,  String clientUuid,  String? title,  CompositionPayload composition,  int? score,  String? ruleVersion, @UtcDateTimeConverter()  DateTime createdAt, @UtcDateTimeConverter()  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SavedOutfit() when $default != null:
return $default(_that.id,_that.clientUuid,_that.title,_that.composition,_that.score,_that.ruleVersion,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedOutfit implements SavedOutfit {
  const _SavedOutfit({@IdConverter() required this.id, required this.clientUuid, this.title, required this.composition, this.score, this.ruleVersion, @UtcDateTimeConverter() required this.createdAt, @UtcDateTimeConverter() required this.updatedAt});
  factory _SavedOutfit.fromJson(Map<String, dynamic> json) => _$SavedOutfitFromJson(json);

@override@IdConverter() final  String id;
@override final  String clientUuid;
@override final  String? title;
@override final  CompositionPayload composition;
@override final  int? score;
@override final  String? ruleVersion;
@override@UtcDateTimeConverter() final  DateTime createdAt;
@override@UtcDateTimeConverter() final  DateTime updatedAt;

/// Create a copy of SavedOutfit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedOutfitCopyWith<_SavedOutfit> get copyWith => __$SavedOutfitCopyWithImpl<_SavedOutfit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedOutfitToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedOutfit&&(identical(other.id, id) || other.id == id)&&(identical(other.clientUuid, clientUuid) || other.clientUuid == clientUuid)&&(identical(other.title, title) || other.title == title)&&(identical(other.composition, composition) || other.composition == composition)&&(identical(other.score, score) || other.score == score)&&(identical(other.ruleVersion, ruleVersion) || other.ruleVersion == ruleVersion)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientUuid,title,composition,score,ruleVersion,createdAt,updatedAt);

@override
String toString() {
  return 'SavedOutfit(id: $id, clientUuid: $clientUuid, title: $title, composition: $composition, score: $score, ruleVersion: $ruleVersion, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SavedOutfitCopyWith<$Res> implements $SavedOutfitCopyWith<$Res> {
  factory _$SavedOutfitCopyWith(_SavedOutfit value, $Res Function(_SavedOutfit) _then) = __$SavedOutfitCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String id, String clientUuid, String? title, CompositionPayload composition, int? score, String? ruleVersion,@UtcDateTimeConverter() DateTime createdAt,@UtcDateTimeConverter() DateTime updatedAt
});


@override $CompositionPayloadCopyWith<$Res> get composition;

}
/// @nodoc
class __$SavedOutfitCopyWithImpl<$Res>
    implements _$SavedOutfitCopyWith<$Res> {
  __$SavedOutfitCopyWithImpl(this._self, this._then);

  final _SavedOutfit _self;
  final $Res Function(_SavedOutfit) _then;

/// Create a copy of SavedOutfit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clientUuid = null,Object? title = freezed,Object? composition = null,Object? score = freezed,Object? ruleVersion = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_SavedOutfit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientUuid: null == clientUuid ? _self.clientUuid : clientUuid // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,composition: null == composition ? _self.composition : composition // ignore: cast_nullable_to_non_nullable
as CompositionPayload,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,ruleVersion: freezed == ruleVersion ? _self.ruleVersion : ruleVersion // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of SavedOutfit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompositionPayloadCopyWith<$Res> get composition {
  
  return $CompositionPayloadCopyWith<$Res>(_self.composition, (value) {
    return _then(_self.copyWith(composition: value));
  });
}
}


/// @nodoc
mixin _$SavedOutfitInput {

 String get clientUuid; String? get title; CompositionPayload get composition; int? get score; String? get ruleVersion;@NullableUtcDateTimeConverter() DateTime? get baseUpdatedAt;
/// Create a copy of SavedOutfitInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedOutfitInputCopyWith<SavedOutfitInput> get copyWith => _$SavedOutfitInputCopyWithImpl<SavedOutfitInput>(this as SavedOutfitInput, _$identity);

  /// Serializes this SavedOutfitInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedOutfitInput&&(identical(other.clientUuid, clientUuid) || other.clientUuid == clientUuid)&&(identical(other.title, title) || other.title == title)&&(identical(other.composition, composition) || other.composition == composition)&&(identical(other.score, score) || other.score == score)&&(identical(other.ruleVersion, ruleVersion) || other.ruleVersion == ruleVersion)&&(identical(other.baseUpdatedAt, baseUpdatedAt) || other.baseUpdatedAt == baseUpdatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientUuid,title,composition,score,ruleVersion,baseUpdatedAt);

@override
String toString() {
  return 'SavedOutfitInput(clientUuid: $clientUuid, title: $title, composition: $composition, score: $score, ruleVersion: $ruleVersion, baseUpdatedAt: $baseUpdatedAt)';
}


}

/// @nodoc
abstract mixin class $SavedOutfitInputCopyWith<$Res>  {
  factory $SavedOutfitInputCopyWith(SavedOutfitInput value, $Res Function(SavedOutfitInput) _then) = _$SavedOutfitInputCopyWithImpl;
@useResult
$Res call({
 String clientUuid, String? title, CompositionPayload composition, int? score, String? ruleVersion,@NullableUtcDateTimeConverter() DateTime? baseUpdatedAt
});


$CompositionPayloadCopyWith<$Res> get composition;

}
/// @nodoc
class _$SavedOutfitInputCopyWithImpl<$Res>
    implements $SavedOutfitInputCopyWith<$Res> {
  _$SavedOutfitInputCopyWithImpl(this._self, this._then);

  final SavedOutfitInput _self;
  final $Res Function(SavedOutfitInput) _then;

/// Create a copy of SavedOutfitInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientUuid = null,Object? title = freezed,Object? composition = null,Object? score = freezed,Object? ruleVersion = freezed,Object? baseUpdatedAt = freezed,}) {
  return _then(SavedOutfitInput(
clientUuid: null == clientUuid ? _self.clientUuid : clientUuid // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,composition: null == composition ? _self.composition : composition // ignore: cast_nullable_to_non_nullable
as CompositionPayload,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,ruleVersion: freezed == ruleVersion ? _self.ruleVersion : ruleVersion // ignore: cast_nullable_to_non_nullable
as String?,baseUpdatedAt: freezed == baseUpdatedAt ? _self.baseUpdatedAt : baseUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of SavedOutfitInput
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompositionPayloadCopyWith<$Res> get composition {
  
  return $CompositionPayloadCopyWith<$Res>(_self.composition, (value) {
    return _then(_self.copyWith(composition: value));
  });
}
}


/// Adds pattern-matching-related methods to [SavedOutfitInput].
extension SavedOutfitInputPatterns on SavedOutfitInput {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedOutfitInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedOutfitInput() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedOutfitInput value)  $default,){
final _that = this;
switch (_that) {
case _SavedOutfitInput():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedOutfitInput value)?  $default,){
final _that = this;
switch (_that) {
case _SavedOutfitInput() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String clientUuid,  String? title,  CompositionPayload composition,  int? score,  String? ruleVersion, @NullableUtcDateTimeConverter()  DateTime? baseUpdatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedOutfitInput() when $default != null:
return $default(_that.clientUuid,_that.title,_that.composition,_that.score,_that.ruleVersion,_that.baseUpdatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String clientUuid,  String? title,  CompositionPayload composition,  int? score,  String? ruleVersion, @NullableUtcDateTimeConverter()  DateTime? baseUpdatedAt)  $default,) {final _that = this;
switch (_that) {
case _SavedOutfitInput():
return $default(_that.clientUuid,_that.title,_that.composition,_that.score,_that.ruleVersion,_that.baseUpdatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String clientUuid,  String? title,  CompositionPayload composition,  int? score,  String? ruleVersion, @NullableUtcDateTimeConverter()  DateTime? baseUpdatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SavedOutfitInput() when $default != null:
return $default(_that.clientUuid,_that.title,_that.composition,_that.score,_that.ruleVersion,_that.baseUpdatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedOutfitInput implements SavedOutfitInput {
  const _SavedOutfitInput({required this.clientUuid, this.title, required this.composition, this.score, this.ruleVersion, @NullableUtcDateTimeConverter() this.baseUpdatedAt});
  factory _SavedOutfitInput.fromJson(Map<String, dynamic> json) => _$SavedOutfitInputFromJson(json);

@override final  String clientUuid;
@override final  String? title;
@override final  CompositionPayload composition;
@override final  int? score;
@override final  String? ruleVersion;
@override@NullableUtcDateTimeConverter() final  DateTime? baseUpdatedAt;

/// Create a copy of SavedOutfitInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedOutfitInputCopyWith<_SavedOutfitInput> get copyWith => __$SavedOutfitInputCopyWithImpl<_SavedOutfitInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedOutfitInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedOutfitInput&&(identical(other.clientUuid, clientUuid) || other.clientUuid == clientUuid)&&(identical(other.title, title) || other.title == title)&&(identical(other.composition, composition) || other.composition == composition)&&(identical(other.score, score) || other.score == score)&&(identical(other.ruleVersion, ruleVersion) || other.ruleVersion == ruleVersion)&&(identical(other.baseUpdatedAt, baseUpdatedAt) || other.baseUpdatedAt == baseUpdatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientUuid,title,composition,score,ruleVersion,baseUpdatedAt);

@override
String toString() {
  return 'SavedOutfitInput(clientUuid: $clientUuid, title: $title, composition: $composition, score: $score, ruleVersion: $ruleVersion, baseUpdatedAt: $baseUpdatedAt)';
}


}

/// @nodoc
abstract mixin class _$SavedOutfitInputCopyWith<$Res> implements $SavedOutfitInputCopyWith<$Res> {
  factory _$SavedOutfitInputCopyWith(_SavedOutfitInput value, $Res Function(_SavedOutfitInput) _then) = __$SavedOutfitInputCopyWithImpl;
@override @useResult
$Res call({
 String clientUuid, String? title, CompositionPayload composition, int? score, String? ruleVersion,@NullableUtcDateTimeConverter() DateTime? baseUpdatedAt
});


@override $CompositionPayloadCopyWith<$Res> get composition;

}
/// @nodoc
class __$SavedOutfitInputCopyWithImpl<$Res>
    implements _$SavedOutfitInputCopyWith<$Res> {
  __$SavedOutfitInputCopyWithImpl(this._self, this._then);

  final _SavedOutfitInput _self;
  final $Res Function(_SavedOutfitInput) _then;

/// Create a copy of SavedOutfitInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientUuid = null,Object? title = freezed,Object? composition = null,Object? score = freezed,Object? ruleVersion = freezed,Object? baseUpdatedAt = freezed,}) {
  return _then(_SavedOutfitInput(
clientUuid: null == clientUuid ? _self.clientUuid : clientUuid // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,composition: null == composition ? _self.composition : composition // ignore: cast_nullable_to_non_nullable
as CompositionPayload,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,ruleVersion: freezed == ruleVersion ? _self.ruleVersion : ruleVersion // ignore: cast_nullable_to_non_nullable
as String?,baseUpdatedAt: freezed == baseUpdatedAt ? _self.baseUpdatedAt : baseUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of SavedOutfitInput
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompositionPayloadCopyWith<$Res> get composition {
  
  return $CompositionPayloadCopyWith<$Res>(_self.composition, (value) {
    return _then(_self.copyWith(composition: value));
  });
}
}

// dart format on
