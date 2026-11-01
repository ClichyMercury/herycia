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
mixin _$SnapshotRef {

 String get slug; String get name;
/// Create a copy of SnapshotRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SnapshotRefCopyWith<SnapshotRef> get copyWith => _$SnapshotRefCopyWithImpl<SnapshotRef>(this as SnapshotRef, _$identity);

  /// Serializes this SnapshotRef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SnapshotRef&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slug,name);

@override
String toString() {
  return 'SnapshotRef(slug: $slug, name: $name)';
}


}

/// @nodoc
abstract mixin class $SnapshotRefCopyWith<$Res>  {
  factory $SnapshotRefCopyWith(SnapshotRef value, $Res Function(SnapshotRef) _then) = _$SnapshotRefCopyWithImpl;
@useResult
$Res call({
 String slug, String name
});




}
/// @nodoc
class _$SnapshotRefCopyWithImpl<$Res>
    implements $SnapshotRefCopyWith<$Res> {
  _$SnapshotRefCopyWithImpl(this._self, this._then);

  final SnapshotRef _self;
  final $Res Function(SnapshotRef) _then;

/// Create a copy of SnapshotRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slug = null,Object? name = null,}) {
  return _then(SnapshotRef(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SnapshotRef].
extension SnapshotRefPatterns on SnapshotRef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SnapshotRef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SnapshotRef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SnapshotRef value)  $default,){
final _that = this;
switch (_that) {
case _SnapshotRef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SnapshotRef value)?  $default,){
final _that = this;
switch (_that) {
case _SnapshotRef() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String slug,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SnapshotRef() when $default != null:
return $default(_that.slug,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String slug,  String name)  $default,) {final _that = this;
switch (_that) {
case _SnapshotRef():
return $default(_that.slug,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String slug,  String name)?  $default,) {final _that = this;
switch (_that) {
case _SnapshotRef() when $default != null:
return $default(_that.slug,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SnapshotRef implements SnapshotRef {
  const _SnapshotRef({required this.slug, required this.name});
  factory _SnapshotRef.fromJson(Map<String, dynamic> json) => _$SnapshotRefFromJson(json);

@override final  String slug;
@override final  String name;

/// Create a copy of SnapshotRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SnapshotRefCopyWith<_SnapshotRef> get copyWith => __$SnapshotRefCopyWithImpl<_SnapshotRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SnapshotRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SnapshotRef&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slug,name);

@override
String toString() {
  return 'SnapshotRef(slug: $slug, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SnapshotRefCopyWith<$Res> implements $SnapshotRefCopyWith<$Res> {
  factory _$SnapshotRefCopyWith(_SnapshotRef value, $Res Function(_SnapshotRef) _then) = __$SnapshotRefCopyWithImpl;
@override @useResult
$Res call({
 String slug, String name
});




}
/// @nodoc
class __$SnapshotRefCopyWithImpl<$Res>
    implements _$SnapshotRefCopyWith<$Res> {
  __$SnapshotRefCopyWithImpl(this._self, this._then);

  final _SnapshotRef _self;
  final $Res Function(_SnapshotRef) _then;

/// Create a copy of SnapshotRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slug = null,Object? name = null,}) {
  return _then(_SnapshotRef(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SnapshotColor {

 String get slug; String get name; String get hexCode;
/// Create a copy of SnapshotColor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SnapshotColorCopyWith<SnapshotColor> get copyWith => _$SnapshotColorCopyWithImpl<SnapshotColor>(this as SnapshotColor, _$identity);

  /// Serializes this SnapshotColor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SnapshotColor&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.hexCode, hexCode) || other.hexCode == hexCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slug,name,hexCode);

@override
String toString() {
  return 'SnapshotColor(slug: $slug, name: $name, hexCode: $hexCode)';
}


}

/// @nodoc
abstract mixin class $SnapshotColorCopyWith<$Res>  {
  factory $SnapshotColorCopyWith(SnapshotColor value, $Res Function(SnapshotColor) _then) = _$SnapshotColorCopyWithImpl;
@useResult
$Res call({
 String slug, String name, String hexCode
});




}
/// @nodoc
class _$SnapshotColorCopyWithImpl<$Res>
    implements $SnapshotColorCopyWith<$Res> {
  _$SnapshotColorCopyWithImpl(this._self, this._then);

  final SnapshotColor _self;
  final $Res Function(SnapshotColor) _then;

/// Create a copy of SnapshotColor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slug = null,Object? name = null,Object? hexCode = null,}) {
  return _then(SnapshotColor(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hexCode: null == hexCode ? _self.hexCode : hexCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SnapshotColor].
extension SnapshotColorPatterns on SnapshotColor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SnapshotColor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SnapshotColor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SnapshotColor value)  $default,){
final _that = this;
switch (_that) {
case _SnapshotColor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SnapshotColor value)?  $default,){
final _that = this;
switch (_that) {
case _SnapshotColor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String slug,  String name,  String hexCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SnapshotColor() when $default != null:
return $default(_that.slug,_that.name,_that.hexCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String slug,  String name,  String hexCode)  $default,) {final _that = this;
switch (_that) {
case _SnapshotColor():
return $default(_that.slug,_that.name,_that.hexCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String slug,  String name,  String hexCode)?  $default,) {final _that = this;
switch (_that) {
case _SnapshotColor() when $default != null:
return $default(_that.slug,_that.name,_that.hexCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SnapshotColor implements SnapshotColor {
  const _SnapshotColor({required this.slug, required this.name, required this.hexCode});
  factory _SnapshotColor.fromJson(Map<String, dynamic> json) => _$SnapshotColorFromJson(json);

@override final  String slug;
@override final  String name;
@override final  String hexCode;

/// Create a copy of SnapshotColor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SnapshotColorCopyWith<_SnapshotColor> get copyWith => __$SnapshotColorCopyWithImpl<_SnapshotColor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SnapshotColorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SnapshotColor&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.hexCode, hexCode) || other.hexCode == hexCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slug,name,hexCode);

@override
String toString() {
  return 'SnapshotColor(slug: $slug, name: $name, hexCode: $hexCode)';
}


}

/// @nodoc
abstract mixin class _$SnapshotColorCopyWith<$Res> implements $SnapshotColorCopyWith<$Res> {
  factory _$SnapshotColorCopyWith(_SnapshotColor value, $Res Function(_SnapshotColor) _then) = __$SnapshotColorCopyWithImpl;
@override @useResult
$Res call({
 String slug, String name, String hexCode
});




}
/// @nodoc
class __$SnapshotColorCopyWithImpl<$Res>
    implements _$SnapshotColorCopyWith<$Res> {
  __$SnapshotColorCopyWithImpl(this._self, this._then);

  final _SnapshotColor _self;
  final $Res Function(_SnapshotColor) _then;

/// Create a copy of SnapshotColor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slug = null,Object? name = null,Object? hexCode = null,}) {
  return _then(_SnapshotColor(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hexCode: null == hexCode ? _self.hexCode : hexCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SnapshotItem {

 SnapshotRef get clothingType; SnapshotColor get color; PieceRole get role; bool get isRequired;
/// Create a copy of SnapshotItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SnapshotItemCopyWith<SnapshotItem> get copyWith => _$SnapshotItemCopyWithImpl<SnapshotItem>(this as SnapshotItem, _$identity);

  /// Serializes this SnapshotItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SnapshotItem&&(identical(other.clothingType, clothingType) || other.clothingType == clothingType)&&(identical(other.color, color) || other.color == color)&&(identical(other.role, role) || other.role == role)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clothingType,color,role,isRequired);

@override
String toString() {
  return 'SnapshotItem(clothingType: $clothingType, color: $color, role: $role, isRequired: $isRequired)';
}


}

/// @nodoc
abstract mixin class $SnapshotItemCopyWith<$Res>  {
  factory $SnapshotItemCopyWith(SnapshotItem value, $Res Function(SnapshotItem) _then) = _$SnapshotItemCopyWithImpl;
@useResult
$Res call({
 SnapshotRef clothingType, SnapshotColor color, PieceRole role, bool isRequired
});


$SnapshotRefCopyWith<$Res> get clothingType;$SnapshotColorCopyWith<$Res> get color;

}
/// @nodoc
class _$SnapshotItemCopyWithImpl<$Res>
    implements $SnapshotItemCopyWith<$Res> {
  _$SnapshotItemCopyWithImpl(this._self, this._then);

  final SnapshotItem _self;
  final $Res Function(SnapshotItem) _then;

/// Create a copy of SnapshotItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clothingType = null,Object? color = null,Object? role = null,Object? isRequired = null,}) {
  return _then(SnapshotItem(
clothingType: null == clothingType ? _self.clothingType : clothingType // ignore: cast_nullable_to_non_nullable
as SnapshotRef,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as SnapshotColor,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as PieceRole,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of SnapshotItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnapshotRefCopyWith<$Res> get clothingType {
  
  return $SnapshotRefCopyWith<$Res>(_self.clothingType, (value) {
    return _then(_self.copyWith(clothingType: value));
  });
}/// Create a copy of SnapshotItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnapshotColorCopyWith<$Res> get color {
  
  return $SnapshotColorCopyWith<$Res>(_self.color, (value) {
    return _then(_self.copyWith(color: value));
  });
}
}


/// Adds pattern-matching-related methods to [SnapshotItem].
extension SnapshotItemPatterns on SnapshotItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SnapshotItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SnapshotItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SnapshotItem value)  $default,){
final _that = this;
switch (_that) {
case _SnapshotItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SnapshotItem value)?  $default,){
final _that = this;
switch (_that) {
case _SnapshotItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SnapshotRef clothingType,  SnapshotColor color,  PieceRole role,  bool isRequired)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SnapshotItem() when $default != null:
return $default(_that.clothingType,_that.color,_that.role,_that.isRequired);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SnapshotRef clothingType,  SnapshotColor color,  PieceRole role,  bool isRequired)  $default,) {final _that = this;
switch (_that) {
case _SnapshotItem():
return $default(_that.clothingType,_that.color,_that.role,_that.isRequired);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SnapshotRef clothingType,  SnapshotColor color,  PieceRole role,  bool isRequired)?  $default,) {final _that = this;
switch (_that) {
case _SnapshotItem() when $default != null:
return $default(_that.clothingType,_that.color,_that.role,_that.isRequired);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SnapshotItem implements SnapshotItem {
  const _SnapshotItem({required this.clothingType, required this.color, required this.role, this.isRequired = true});
  factory _SnapshotItem.fromJson(Map<String, dynamic> json) => _$SnapshotItemFromJson(json);

@override final  SnapshotRef clothingType;
@override final  SnapshotColor color;
@override final  PieceRole role;
@override@JsonKey() final  bool isRequired;

/// Create a copy of SnapshotItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SnapshotItemCopyWith<_SnapshotItem> get copyWith => __$SnapshotItemCopyWithImpl<_SnapshotItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SnapshotItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SnapshotItem&&(identical(other.clothingType, clothingType) || other.clothingType == clothingType)&&(identical(other.color, color) || other.color == color)&&(identical(other.role, role) || other.role == role)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clothingType,color,role,isRequired);

@override
String toString() {
  return 'SnapshotItem(clothingType: $clothingType, color: $color, role: $role, isRequired: $isRequired)';
}


}

/// @nodoc
abstract mixin class _$SnapshotItemCopyWith<$Res> implements $SnapshotItemCopyWith<$Res> {
  factory _$SnapshotItemCopyWith(_SnapshotItem value, $Res Function(_SnapshotItem) _then) = __$SnapshotItemCopyWithImpl;
@override @useResult
$Res call({
 SnapshotRef clothingType, SnapshotColor color, PieceRole role, bool isRequired
});


@override $SnapshotRefCopyWith<$Res> get clothingType;@override $SnapshotColorCopyWith<$Res> get color;

}
/// @nodoc
class __$SnapshotItemCopyWithImpl<$Res>
    implements _$SnapshotItemCopyWith<$Res> {
  __$SnapshotItemCopyWithImpl(this._self, this._then);

  final _SnapshotItem _self;
  final $Res Function(_SnapshotItem) _then;

/// Create a copy of SnapshotItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clothingType = null,Object? color = null,Object? role = null,Object? isRequired = null,}) {
  return _then(_SnapshotItem(
clothingType: null == clothingType ? _self.clothingType : clothingType // ignore: cast_nullable_to_non_nullable
as SnapshotRef,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as SnapshotColor,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as PieceRole,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of SnapshotItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnapshotRefCopyWith<$Res> get clothingType {
  
  return $SnapshotRefCopyWith<$Res>(_self.clothingType, (value) {
    return _then(_self.copyWith(clothingType: value));
  });
}/// Create a copy of SnapshotItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnapshotColorCopyWith<$Res> get color {
  
  return $SnapshotColorCopyWith<$Res>(_self.color, (value) {
    return _then(_self.copyWith(color: value));
  });
}
}


/// @nodoc
mixin _$SnapshotImage {

 String get url; String? get thumbnailUrl; String get altText; String? get credit; String get licenseType;
/// Create a copy of SnapshotImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SnapshotImageCopyWith<SnapshotImage> get copyWith => _$SnapshotImageCopyWithImpl<SnapshotImage>(this as SnapshotImage, _$identity);

  /// Serializes this SnapshotImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SnapshotImage&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.altText, altText) || other.altText == altText)&&(identical(other.credit, credit) || other.credit == credit)&&(identical(other.licenseType, licenseType) || other.licenseType == licenseType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,thumbnailUrl,altText,credit,licenseType);

@override
String toString() {
  return 'SnapshotImage(url: $url, thumbnailUrl: $thumbnailUrl, altText: $altText, credit: $credit, licenseType: $licenseType)';
}


}

/// @nodoc
abstract mixin class $SnapshotImageCopyWith<$Res>  {
  factory $SnapshotImageCopyWith(SnapshotImage value, $Res Function(SnapshotImage) _then) = _$SnapshotImageCopyWithImpl;
@useResult
$Res call({
 String url, String? thumbnailUrl, String altText, String? credit, String licenseType
});




}
/// @nodoc
class _$SnapshotImageCopyWithImpl<$Res>
    implements $SnapshotImageCopyWith<$Res> {
  _$SnapshotImageCopyWithImpl(this._self, this._then);

  final SnapshotImage _self;
  final $Res Function(SnapshotImage) _then;

/// Create a copy of SnapshotImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? thumbnailUrl = freezed,Object? altText = null,Object? credit = freezed,Object? licenseType = null,}) {
  return _then(SnapshotImage(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,altText: null == altText ? _self.altText : altText // ignore: cast_nullable_to_non_nullable
as String,credit: freezed == credit ? _self.credit : credit // ignore: cast_nullable_to_non_nullable
as String?,licenseType: null == licenseType ? _self.licenseType : licenseType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SnapshotImage].
extension SnapshotImagePatterns on SnapshotImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SnapshotImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SnapshotImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SnapshotImage value)  $default,){
final _that = this;
switch (_that) {
case _SnapshotImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SnapshotImage value)?  $default,){
final _that = this;
switch (_that) {
case _SnapshotImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url,  String? thumbnailUrl,  String altText,  String? credit,  String licenseType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SnapshotImage() when $default != null:
return $default(_that.url,_that.thumbnailUrl,_that.altText,_that.credit,_that.licenseType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url,  String? thumbnailUrl,  String altText,  String? credit,  String licenseType)  $default,) {final _that = this;
switch (_that) {
case _SnapshotImage():
return $default(_that.url,_that.thumbnailUrl,_that.altText,_that.credit,_that.licenseType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url,  String? thumbnailUrl,  String altText,  String? credit,  String licenseType)?  $default,) {final _that = this;
switch (_that) {
case _SnapshotImage() when $default != null:
return $default(_that.url,_that.thumbnailUrl,_that.altText,_that.credit,_that.licenseType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SnapshotImage implements SnapshotImage {
  const _SnapshotImage({required this.url, this.thumbnailUrl, required this.altText, this.credit, required this.licenseType});
  factory _SnapshotImage.fromJson(Map<String, dynamic> json) => _$SnapshotImageFromJson(json);

@override final  String url;
@override final  String? thumbnailUrl;
@override final  String altText;
@override final  String? credit;
@override final  String licenseType;

/// Create a copy of SnapshotImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SnapshotImageCopyWith<_SnapshotImage> get copyWith => __$SnapshotImageCopyWithImpl<_SnapshotImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SnapshotImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SnapshotImage&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.altText, altText) || other.altText == altText)&&(identical(other.credit, credit) || other.credit == credit)&&(identical(other.licenseType, licenseType) || other.licenseType == licenseType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,thumbnailUrl,altText,credit,licenseType);

@override
String toString() {
  return 'SnapshotImage(url: $url, thumbnailUrl: $thumbnailUrl, altText: $altText, credit: $credit, licenseType: $licenseType)';
}


}

/// @nodoc
abstract mixin class _$SnapshotImageCopyWith<$Res> implements $SnapshotImageCopyWith<$Res> {
  factory _$SnapshotImageCopyWith(_SnapshotImage value, $Res Function(_SnapshotImage) _then) = __$SnapshotImageCopyWithImpl;
@override @useResult
$Res call({
 String url, String? thumbnailUrl, String altText, String? credit, String licenseType
});




}
/// @nodoc
class __$SnapshotImageCopyWithImpl<$Res>
    implements _$SnapshotImageCopyWith<$Res> {
  __$SnapshotImageCopyWithImpl(this._self, this._then);

  final _SnapshotImage _self;
  final $Res Function(_SnapshotImage) _then;

/// Create a copy of SnapshotImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? thumbnailUrl = freezed,Object? altText = null,Object? credit = freezed,Object? licenseType = null,}) {
  return _then(_SnapshotImage(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,altText: null == altText ? _self.altText : altText // ignore: cast_nullable_to_non_nullable
as String,credit: freezed == credit ? _self.credit : credit // ignore: cast_nullable_to_non_nullable
as String?,licenseType: null == licenseType ? _self.licenseType : licenseType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LookSnapshot {

 int get schemaVersion; String get title; int get catalogVersion;@JsonKey(includeIfNull: false) SnapshotRef? get style;@JsonKey(includeIfNull: false) SnapshotRef? get occasion;@JsonKey(includeIfNull: false) SnapshotImage? get image; List<SnapshotItem> get items;
/// Create a copy of LookSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LookSnapshotCopyWith<LookSnapshot> get copyWith => _$LookSnapshotCopyWithImpl<LookSnapshot>(this as LookSnapshot, _$identity);

  /// Serializes this LookSnapshot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LookSnapshot&&(identical(other.schemaVersion, schemaVersion) || other.schemaVersion == schemaVersion)&&(identical(other.title, title) || other.title == title)&&(identical(other.catalogVersion, catalogVersion) || other.catalogVersion == catalogVersion)&&(identical(other.style, style) || other.style == style)&&(identical(other.occasion, occasion) || other.occasion == occasion)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schemaVersion,title,catalogVersion,style,occasion,image,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'LookSnapshot(schemaVersion: $schemaVersion, title: $title, catalogVersion: $catalogVersion, style: $style, occasion: $occasion, image: $image, items: $items)';
}


}

/// @nodoc
abstract mixin class $LookSnapshotCopyWith<$Res>  {
  factory $LookSnapshotCopyWith(LookSnapshot value, $Res Function(LookSnapshot) _then) = _$LookSnapshotCopyWithImpl;
@useResult
$Res call({
 int schemaVersion, String title, int catalogVersion,@JsonKey(includeIfNull: false) SnapshotRef? style,@JsonKey(includeIfNull: false) SnapshotRef? occasion,@JsonKey(includeIfNull: false) SnapshotImage? image, List<SnapshotItem> items
});


$SnapshotRefCopyWith<$Res>? get style;$SnapshotRefCopyWith<$Res>? get occasion;$SnapshotImageCopyWith<$Res>? get image;

}
/// @nodoc
class _$LookSnapshotCopyWithImpl<$Res>
    implements $LookSnapshotCopyWith<$Res> {
  _$LookSnapshotCopyWithImpl(this._self, this._then);

  final LookSnapshot _self;
  final $Res Function(LookSnapshot) _then;

/// Create a copy of LookSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schemaVersion = null,Object? title = null,Object? catalogVersion = null,Object? style = freezed,Object? occasion = freezed,Object? image = freezed,Object? items = null,}) {
  return _then(LookSnapshot(
schemaVersion: null == schemaVersion ? _self.schemaVersion : schemaVersion // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,catalogVersion: null == catalogVersion ? _self.catalogVersion : catalogVersion // ignore: cast_nullable_to_non_nullable
as int,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as SnapshotRef?,occasion: freezed == occasion ? _self.occasion : occasion // ignore: cast_nullable_to_non_nullable
as SnapshotRef?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as SnapshotImage?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SnapshotItem>,
  ));
}
/// Create a copy of LookSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnapshotRefCopyWith<$Res>? get style {
    if (_self.style == null) {
    return null;
  }

  return $SnapshotRefCopyWith<$Res>(_self.style!, (value) {
    return _then(_self.copyWith(style: value));
  });
}/// Create a copy of LookSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnapshotRefCopyWith<$Res>? get occasion {
    if (_self.occasion == null) {
    return null;
  }

  return $SnapshotRefCopyWith<$Res>(_self.occasion!, (value) {
    return _then(_self.copyWith(occasion: value));
  });
}/// Create a copy of LookSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnapshotImageCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $SnapshotImageCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int schemaVersion,  String title,  int catalogVersion, @JsonKey(includeIfNull: false)  SnapshotRef? style, @JsonKey(includeIfNull: false)  SnapshotRef? occasion, @JsonKey(includeIfNull: false)  SnapshotImage? image,  List<SnapshotItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LookSnapshot() when $default != null:
return $default(_that.schemaVersion,_that.title,_that.catalogVersion,_that.style,_that.occasion,_that.image,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int schemaVersion,  String title,  int catalogVersion, @JsonKey(includeIfNull: false)  SnapshotRef? style, @JsonKey(includeIfNull: false)  SnapshotRef? occasion, @JsonKey(includeIfNull: false)  SnapshotImage? image,  List<SnapshotItem> items)  $default,) {final _that = this;
switch (_that) {
case _LookSnapshot():
return $default(_that.schemaVersion,_that.title,_that.catalogVersion,_that.style,_that.occasion,_that.image,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int schemaVersion,  String title,  int catalogVersion, @JsonKey(includeIfNull: false)  SnapshotRef? style, @JsonKey(includeIfNull: false)  SnapshotRef? occasion, @JsonKey(includeIfNull: false)  SnapshotImage? image,  List<SnapshotItem> items)?  $default,) {final _that = this;
switch (_that) {
case _LookSnapshot() when $default != null:
return $default(_that.schemaVersion,_that.title,_that.catalogVersion,_that.style,_that.occasion,_that.image,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LookSnapshot implements LookSnapshot {
  const _LookSnapshot({this.schemaVersion = 1, required this.title, this.catalogVersion = 1, @JsonKey(includeIfNull: false) this.style, @JsonKey(includeIfNull: false) this.occasion, @JsonKey(includeIfNull: false) this.image, required  List<SnapshotItem> items}): _items = items;
  factory _LookSnapshot.fromJson(Map<String, dynamic> json) => _$LookSnapshotFromJson(json);

@override@JsonKey() final  int schemaVersion;
@override final  String title;
@override@JsonKey() final  int catalogVersion;
@override@JsonKey(includeIfNull: false) final  SnapshotRef? style;
@override@JsonKey(includeIfNull: false) final  SnapshotRef? occasion;
@override@JsonKey(includeIfNull: false) final  SnapshotImage? image;
 final  List<SnapshotItem> _items;
@override List<SnapshotItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LookSnapshot&&(identical(other.schemaVersion, schemaVersion) || other.schemaVersion == schemaVersion)&&(identical(other.title, title) || other.title == title)&&(identical(other.catalogVersion, catalogVersion) || other.catalogVersion == catalogVersion)&&(identical(other.style, style) || other.style == style)&&(identical(other.occasion, occasion) || other.occasion == occasion)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schemaVersion,title,catalogVersion,style,occasion,image,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'LookSnapshot(schemaVersion: $schemaVersion, title: $title, catalogVersion: $catalogVersion, style: $style, occasion: $occasion, image: $image, items: $items)';
}


}

/// @nodoc
abstract mixin class _$LookSnapshotCopyWith<$Res> implements $LookSnapshotCopyWith<$Res> {
  factory _$LookSnapshotCopyWith(_LookSnapshot value, $Res Function(_LookSnapshot) _then) = __$LookSnapshotCopyWithImpl;
@override @useResult
$Res call({
 int schemaVersion, String title, int catalogVersion,@JsonKey(includeIfNull: false) SnapshotRef? style,@JsonKey(includeIfNull: false) SnapshotRef? occasion,@JsonKey(includeIfNull: false) SnapshotImage? image, List<SnapshotItem> items
});


@override $SnapshotRefCopyWith<$Res>? get style;@override $SnapshotRefCopyWith<$Res>? get occasion;@override $SnapshotImageCopyWith<$Res>? get image;

}
/// @nodoc
class __$LookSnapshotCopyWithImpl<$Res>
    implements _$LookSnapshotCopyWith<$Res> {
  __$LookSnapshotCopyWithImpl(this._self, this._then);

  final _LookSnapshot _self;
  final $Res Function(_LookSnapshot) _then;

/// Create a copy of LookSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schemaVersion = null,Object? title = null,Object? catalogVersion = null,Object? style = freezed,Object? occasion = freezed,Object? image = freezed,Object? items = null,}) {
  return _then(_LookSnapshot(
schemaVersion: null == schemaVersion ? _self.schemaVersion : schemaVersion // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,catalogVersion: null == catalogVersion ? _self.catalogVersion : catalogVersion // ignore: cast_nullable_to_non_nullable
as int,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as SnapshotRef?,occasion: freezed == occasion ? _self.occasion : occasion // ignore: cast_nullable_to_non_nullable
as SnapshotRef?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as SnapshotImage?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SnapshotItem>,
  ));
}

/// Create a copy of LookSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnapshotRefCopyWith<$Res>? get style {
    if (_self.style == null) {
    return null;
  }

  return $SnapshotRefCopyWith<$Res>(_self.style!, (value) {
    return _then(_self.copyWith(style: value));
  });
}/// Create a copy of LookSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnapshotRefCopyWith<$Res>? get occasion {
    if (_self.occasion == null) {
    return null;
  }

  return $SnapshotRefCopyWith<$Res>(_self.occasion!, (value) {
    return _then(_self.copyWith(occasion: value));
  });
}/// Create a copy of LookSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnapshotImageCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $SnapshotImageCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}


/// @nodoc
mixin _$Favorite {

@IdConverter() String get id;@NullableIdConverter() String? get outfitId; LookSnapshot get snapshot;@UtcDateTimeConverter() DateTime get createdAt;@UtcDateTimeConverter() DateTime get updatedAt;
/// Create a copy of Favorite
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteCopyWith<Favorite> get copyWith => _$FavoriteCopyWithImpl<Favorite>(this as Favorite, _$identity);

  /// Serializes this Favorite to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Favorite&&(identical(other.id, id) || other.id == id)&&(identical(other.outfitId, outfitId) || other.outfitId == outfitId)&&(identical(other.snapshot, snapshot) || other.snapshot == snapshot)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,outfitId,snapshot,createdAt,updatedAt);

@override
String toString() {
  return 'Favorite(id: $id, outfitId: $outfitId, snapshot: $snapshot, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $FavoriteCopyWith<$Res>  {
  factory $FavoriteCopyWith(Favorite value, $Res Function(Favorite) _then) = _$FavoriteCopyWithImpl;
@useResult
$Res call({
@IdConverter() String id,@NullableIdConverter() String? outfitId, LookSnapshot snapshot,@UtcDateTimeConverter() DateTime createdAt,@UtcDateTimeConverter() DateTime updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? outfitId = freezed,Object? snapshot = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(Favorite(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String id, @NullableIdConverter()  String? outfitId,  LookSnapshot snapshot, @UtcDateTimeConverter()  DateTime createdAt, @UtcDateTimeConverter()  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Favorite() when $default != null:
return $default(_that.id,_that.outfitId,_that.snapshot,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String id, @NullableIdConverter()  String? outfitId,  LookSnapshot snapshot, @UtcDateTimeConverter()  DateTime createdAt, @UtcDateTimeConverter()  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Favorite():
return $default(_that.id,_that.outfitId,_that.snapshot,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String id, @NullableIdConverter()  String? outfitId,  LookSnapshot snapshot, @UtcDateTimeConverter()  DateTime createdAt, @UtcDateTimeConverter()  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Favorite() when $default != null:
return $default(_that.id,_that.outfitId,_that.snapshot,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Favorite implements Favorite {
  const _Favorite({@IdConverter() required this.id, @NullableIdConverter() this.outfitId, required this.snapshot, @UtcDateTimeConverter() required this.createdAt, @UtcDateTimeConverter() required this.updatedAt});
  factory _Favorite.fromJson(Map<String, dynamic> json) => _$FavoriteFromJson(json);

@override@IdConverter() final  String id;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Favorite&&(identical(other.id, id) || other.id == id)&&(identical(other.outfitId, outfitId) || other.outfitId == outfitId)&&(identical(other.snapshot, snapshot) || other.snapshot == snapshot)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,outfitId,snapshot,createdAt,updatedAt);

@override
String toString() {
  return 'Favorite(id: $id, outfitId: $outfitId, snapshot: $snapshot, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$FavoriteCopyWith<$Res> implements $FavoriteCopyWith<$Res> {
  factory _$FavoriteCopyWith(_Favorite value, $Res Function(_Favorite) _then) = __$FavoriteCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String id,@NullableIdConverter() String? outfitId, LookSnapshot snapshot,@UtcDateTimeConverter() DateTime createdAt,@UtcDateTimeConverter() DateTime updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? outfitId = freezed,Object? snapshot = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Favorite(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
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

 String get clientUuid;@JsonKey(includeIfNull: false)@NullableIdConverter() String? get outfitId; LookSnapshot get snapshot;
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
 String clientUuid,@JsonKey(includeIfNull: false)@NullableIdConverter() String? outfitId, LookSnapshot snapshot
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String clientUuid, @JsonKey(includeIfNull: false)@NullableIdConverter()  String? outfitId,  LookSnapshot snapshot)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String clientUuid, @JsonKey(includeIfNull: false)@NullableIdConverter()  String? outfitId,  LookSnapshot snapshot)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String clientUuid, @JsonKey(includeIfNull: false)@NullableIdConverter()  String? outfitId,  LookSnapshot snapshot)?  $default,) {final _that = this;
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
  const _FavoriteInput({required this.clientUuid, @JsonKey(includeIfNull: false)@NullableIdConverter() this.outfitId, required this.snapshot});
  factory _FavoriteInput.fromJson(Map<String, dynamic> json) => _$FavoriteInputFromJson(json);

@override final  String clientUuid;
@override@JsonKey(includeIfNull: false)@NullableIdConverter() final  String? outfitId;
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
 String clientUuid,@JsonKey(includeIfNull: false)@NullableIdConverter() String? outfitId, LookSnapshot snapshot
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

@IdConverter() String get id; String? get title; CompositionPayload get composition; int? get score; int get ruleVersion;@UtcDateTimeConverter() DateTime get createdAt;@UtcDateTimeConverter() DateTime get updatedAt;
/// Create a copy of SavedOutfit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedOutfitCopyWith<SavedOutfit> get copyWith => _$SavedOutfitCopyWithImpl<SavedOutfit>(this as SavedOutfit, _$identity);

  /// Serializes this SavedOutfit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedOutfit&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.composition, composition) || other.composition == composition)&&(identical(other.score, score) || other.score == score)&&(identical(other.ruleVersion, ruleVersion) || other.ruleVersion == ruleVersion)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,composition,score,ruleVersion,createdAt,updatedAt);

@override
String toString() {
  return 'SavedOutfit(id: $id, title: $title, composition: $composition, score: $score, ruleVersion: $ruleVersion, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SavedOutfitCopyWith<$Res>  {
  factory $SavedOutfitCopyWith(SavedOutfit value, $Res Function(SavedOutfit) _then) = _$SavedOutfitCopyWithImpl;
@useResult
$Res call({
@IdConverter() String id, String? title, CompositionPayload composition, int? score, int ruleVersion,@UtcDateTimeConverter() DateTime createdAt,@UtcDateTimeConverter() DateTime updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = freezed,Object? composition = null,Object? score = freezed,Object? ruleVersion = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(SavedOutfit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,composition: null == composition ? _self.composition : composition // ignore: cast_nullable_to_non_nullable
as CompositionPayload,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,ruleVersion: null == ruleVersion ? _self.ruleVersion : ruleVersion // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String? title,  CompositionPayload composition,  int? score,  int ruleVersion, @UtcDateTimeConverter()  DateTime createdAt, @UtcDateTimeConverter()  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedOutfit() when $default != null:
return $default(_that.id,_that.title,_that.composition,_that.score,_that.ruleVersion,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String? title,  CompositionPayload composition,  int? score,  int ruleVersion, @UtcDateTimeConverter()  DateTime createdAt, @UtcDateTimeConverter()  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SavedOutfit():
return $default(_that.id,_that.title,_that.composition,_that.score,_that.ruleVersion,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String id,  String? title,  CompositionPayload composition,  int? score,  int ruleVersion, @UtcDateTimeConverter()  DateTime createdAt, @UtcDateTimeConverter()  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SavedOutfit() when $default != null:
return $default(_that.id,_that.title,_that.composition,_that.score,_that.ruleVersion,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedOutfit implements SavedOutfit {
  const _SavedOutfit({@IdConverter() required this.id, this.title, required this.composition, this.score, this.ruleVersion = 1, @UtcDateTimeConverter() required this.createdAt, @UtcDateTimeConverter() required this.updatedAt});
  factory _SavedOutfit.fromJson(Map<String, dynamic> json) => _$SavedOutfitFromJson(json);

@override@IdConverter() final  String id;
@override final  String? title;
@override final  CompositionPayload composition;
@override final  int? score;
@override@JsonKey() final  int ruleVersion;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedOutfit&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.composition, composition) || other.composition == composition)&&(identical(other.score, score) || other.score == score)&&(identical(other.ruleVersion, ruleVersion) || other.ruleVersion == ruleVersion)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,composition,score,ruleVersion,createdAt,updatedAt);

@override
String toString() {
  return 'SavedOutfit(id: $id, title: $title, composition: $composition, score: $score, ruleVersion: $ruleVersion, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SavedOutfitCopyWith<$Res> implements $SavedOutfitCopyWith<$Res> {
  factory _$SavedOutfitCopyWith(_SavedOutfit value, $Res Function(_SavedOutfit) _then) = __$SavedOutfitCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String id, String? title, CompositionPayload composition, int? score, int ruleVersion,@UtcDateTimeConverter() DateTime createdAt,@UtcDateTimeConverter() DateTime updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = freezed,Object? composition = null,Object? score = freezed,Object? ruleVersion = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_SavedOutfit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,composition: null == composition ? _self.composition : composition // ignore: cast_nullable_to_non_nullable
as CompositionPayload,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,ruleVersion: null == ruleVersion ? _self.ruleVersion : ruleVersion // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
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

 String? get title; CompositionPayload get composition; int? get score; int get ruleVersion;
/// Create a copy of SavedOutfitInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedOutfitInputCopyWith<SavedOutfitInput> get copyWith => _$SavedOutfitInputCopyWithImpl<SavedOutfitInput>(this as SavedOutfitInput, _$identity);

  /// Serializes this SavedOutfitInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedOutfitInput&&(identical(other.title, title) || other.title == title)&&(identical(other.composition, composition) || other.composition == composition)&&(identical(other.score, score) || other.score == score)&&(identical(other.ruleVersion, ruleVersion) || other.ruleVersion == ruleVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,composition,score,ruleVersion);

@override
String toString() {
  return 'SavedOutfitInput(title: $title, composition: $composition, score: $score, ruleVersion: $ruleVersion)';
}


}

/// @nodoc
abstract mixin class $SavedOutfitInputCopyWith<$Res>  {
  factory $SavedOutfitInputCopyWith(SavedOutfitInput value, $Res Function(SavedOutfitInput) _then) = _$SavedOutfitInputCopyWithImpl;
@useResult
$Res call({
 String? title, CompositionPayload composition, int? score, int ruleVersion
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
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? composition = null,Object? score = freezed,Object? ruleVersion = null,}) {
  return _then(SavedOutfitInput(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,composition: null == composition ? _self.composition : composition // ignore: cast_nullable_to_non_nullable
as CompositionPayload,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,ruleVersion: null == ruleVersion ? _self.ruleVersion : ruleVersion // ignore: cast_nullable_to_non_nullable
as int,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title,  CompositionPayload composition,  int? score,  int ruleVersion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedOutfitInput() when $default != null:
return $default(_that.title,_that.composition,_that.score,_that.ruleVersion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title,  CompositionPayload composition,  int? score,  int ruleVersion)  $default,) {final _that = this;
switch (_that) {
case _SavedOutfitInput():
return $default(_that.title,_that.composition,_that.score,_that.ruleVersion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title,  CompositionPayload composition,  int? score,  int ruleVersion)?  $default,) {final _that = this;
switch (_that) {
case _SavedOutfitInput() when $default != null:
return $default(_that.title,_that.composition,_that.score,_that.ruleVersion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedOutfitInput implements SavedOutfitInput {
  const _SavedOutfitInput({this.title, required this.composition, this.score, this.ruleVersion = 1});
  factory _SavedOutfitInput.fromJson(Map<String, dynamic> json) => _$SavedOutfitInputFromJson(json);

@override final  String? title;
@override final  CompositionPayload composition;
@override final  int? score;
@override@JsonKey() final  int ruleVersion;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedOutfitInput&&(identical(other.title, title) || other.title == title)&&(identical(other.composition, composition) || other.composition == composition)&&(identical(other.score, score) || other.score == score)&&(identical(other.ruleVersion, ruleVersion) || other.ruleVersion == ruleVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,composition,score,ruleVersion);

@override
String toString() {
  return 'SavedOutfitInput(title: $title, composition: $composition, score: $score, ruleVersion: $ruleVersion)';
}


}

/// @nodoc
abstract mixin class _$SavedOutfitInputCopyWith<$Res> implements $SavedOutfitInputCopyWith<$Res> {
  factory _$SavedOutfitInputCopyWith(_SavedOutfitInput value, $Res Function(_SavedOutfitInput) _then) = __$SavedOutfitInputCopyWithImpl;
@override @useResult
$Res call({
 String? title, CompositionPayload composition, int? score, int ruleVersion
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
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? composition = null,Object? score = freezed,Object? ruleVersion = null,}) {
  return _then(_SavedOutfitInput(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,composition: null == composition ? _self.composition : composition // ignore: cast_nullable_to_non_nullable
as CompositionPayload,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,ruleVersion: null == ruleVersion ? _self.ruleVersion : ruleVersion // ignore: cast_nullable_to_non_nullable
as int,
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


/// @nodoc
mixin _$SyncChange {

 SyncResource get resource; SyncOp get op;@IdConverter() String get id;@UtcDateTimeConverter() DateTime get updatedAt;@NullableUtcDateTimeConverter() DateTime? get deletedAt; Map<String, dynamic>? get data;
/// Create a copy of SyncChange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncChangeCopyWith<SyncChange> get copyWith => _$SyncChangeCopyWithImpl<SyncChange>(this as SyncChange, _$identity);

  /// Serializes this SyncChange to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncChange&&(identical(other.resource, resource) || other.resource == resource)&&(identical(other.op, op) || other.op == op)&&(identical(other.id, id) || other.id == id)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resource,op,id,updatedAt,deletedAt,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'SyncChange(resource: $resource, op: $op, id: $id, updatedAt: $updatedAt, deletedAt: $deletedAt, data: $data)';
}


}

/// @nodoc
abstract mixin class $SyncChangeCopyWith<$Res>  {
  factory $SyncChangeCopyWith(SyncChange value, $Res Function(SyncChange) _then) = _$SyncChangeCopyWithImpl;
@useResult
$Res call({
 SyncResource resource, SyncOp op,@IdConverter() String id,@UtcDateTimeConverter() DateTime updatedAt,@NullableUtcDateTimeConverter() DateTime? deletedAt, Map<String, dynamic>? data
});




}
/// @nodoc
class _$SyncChangeCopyWithImpl<$Res>
    implements $SyncChangeCopyWith<$Res> {
  _$SyncChangeCopyWithImpl(this._self, this._then);

  final SyncChange _self;
  final $Res Function(SyncChange) _then;

/// Create a copy of SyncChange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resource = null,Object? op = null,Object? id = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? data = freezed,}) {
  return _then(SyncChange(
resource: null == resource ? _self.resource : resource // ignore: cast_nullable_to_non_nullable
as SyncResource,op: null == op ? _self.op : op // ignore: cast_nullable_to_non_nullable
as SyncOp,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncChange].
extension SyncChangePatterns on SyncChange {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SyncChange value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SyncChange() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SyncChange value)  $default,){
final _that = this;
switch (_that) {
case _SyncChange():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SyncChange value)?  $default,){
final _that = this;
switch (_that) {
case _SyncChange() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SyncResource resource,  SyncOp op, @IdConverter()  String id, @UtcDateTimeConverter()  DateTime updatedAt, @NullableUtcDateTimeConverter()  DateTime? deletedAt,  Map<String, dynamic>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SyncChange() when $default != null:
return $default(_that.resource,_that.op,_that.id,_that.updatedAt,_that.deletedAt,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SyncResource resource,  SyncOp op, @IdConverter()  String id, @UtcDateTimeConverter()  DateTime updatedAt, @NullableUtcDateTimeConverter()  DateTime? deletedAt,  Map<String, dynamic>? data)  $default,) {final _that = this;
switch (_that) {
case _SyncChange():
return $default(_that.resource,_that.op,_that.id,_that.updatedAt,_that.deletedAt,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SyncResource resource,  SyncOp op, @IdConverter()  String id, @UtcDateTimeConverter()  DateTime updatedAt, @NullableUtcDateTimeConverter()  DateTime? deletedAt,  Map<String, dynamic>? data)?  $default,) {final _that = this;
switch (_that) {
case _SyncChange() when $default != null:
return $default(_that.resource,_that.op,_that.id,_that.updatedAt,_that.deletedAt,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SyncChange implements SyncChange {
  const _SyncChange({required this.resource, required this.op, @IdConverter() required this.id, @UtcDateTimeConverter() required this.updatedAt, @NullableUtcDateTimeConverter() this.deletedAt,  Map<String, dynamic>? data}): _data = data;
  factory _SyncChange.fromJson(Map<String, dynamic> json) => _$SyncChangeFromJson(json);

@override final  SyncResource resource;
@override final  SyncOp op;
@override@IdConverter() final  String id;
@override@UtcDateTimeConverter() final  DateTime updatedAt;
@override@NullableUtcDateTimeConverter() final  DateTime? deletedAt;
 final  Map<String, dynamic>? _data;
@override Map<String, dynamic>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of SyncChange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncChangeCopyWith<_SyncChange> get copyWith => __$SyncChangeCopyWithImpl<_SyncChange>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SyncChangeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncChange&&(identical(other.resource, resource) || other.resource == resource)&&(identical(other.op, op) || other.op == op)&&(identical(other.id, id) || other.id == id)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resource,op,id,updatedAt,deletedAt,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'SyncChange(resource: $resource, op: $op, id: $id, updatedAt: $updatedAt, deletedAt: $deletedAt, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SyncChangeCopyWith<$Res> implements $SyncChangeCopyWith<$Res> {
  factory _$SyncChangeCopyWith(_SyncChange value, $Res Function(_SyncChange) _then) = __$SyncChangeCopyWithImpl;
@override @useResult
$Res call({
 SyncResource resource, SyncOp op,@IdConverter() String id,@UtcDateTimeConverter() DateTime updatedAt,@NullableUtcDateTimeConverter() DateTime? deletedAt, Map<String, dynamic>? data
});




}
/// @nodoc
class __$SyncChangeCopyWithImpl<$Res>
    implements _$SyncChangeCopyWith<$Res> {
  __$SyncChangeCopyWithImpl(this._self, this._then);

  final _SyncChange _self;
  final $Res Function(_SyncChange) _then;

/// Create a copy of SyncChange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resource = null,Object? op = null,Object? id = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? data = freezed,}) {
  return _then(_SyncChange(
resource: null == resource ? _self.resource : resource // ignore: cast_nullable_to_non_nullable
as SyncResource,op: null == op ? _self.op : op // ignore: cast_nullable_to_non_nullable
as SyncOp,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$SyncPage {

 List<SyncChange> get changes; String get cursor; bool get hasMore;
/// Create a copy of SyncPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncPageCopyWith<SyncPage> get copyWith => _$SyncPageCopyWithImpl<SyncPage>(this as SyncPage, _$identity);

  /// Serializes this SyncPage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncPage&&const DeepCollectionEquality().equals(other.changes, changes)&&(identical(other.cursor, cursor) || other.cursor == cursor)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(changes),cursor,hasMore);

@override
String toString() {
  return 'SyncPage(changes: $changes, cursor: $cursor, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $SyncPageCopyWith<$Res>  {
  factory $SyncPageCopyWith(SyncPage value, $Res Function(SyncPage) _then) = _$SyncPageCopyWithImpl;
@useResult
$Res call({
 List<SyncChange> changes, String cursor, bool hasMore
});




}
/// @nodoc
class _$SyncPageCopyWithImpl<$Res>
    implements $SyncPageCopyWith<$Res> {
  _$SyncPageCopyWithImpl(this._self, this._then);

  final SyncPage _self;
  final $Res Function(SyncPage) _then;

/// Create a copy of SyncPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? changes = null,Object? cursor = null,Object? hasMore = null,}) {
  return _then(SyncPage(
changes: null == changes ? _self.changes : changes // ignore: cast_nullable_to_non_nullable
as List<SyncChange>,cursor: null == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as String,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncPage].
extension SyncPagePatterns on SyncPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SyncPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SyncPage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SyncPage value)  $default,){
final _that = this;
switch (_that) {
case _SyncPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SyncPage value)?  $default,){
final _that = this;
switch (_that) {
case _SyncPage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SyncChange> changes,  String cursor,  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SyncPage() when $default != null:
return $default(_that.changes,_that.cursor,_that.hasMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SyncChange> changes,  String cursor,  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _SyncPage():
return $default(_that.changes,_that.cursor,_that.hasMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SyncChange> changes,  String cursor,  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _SyncPage() when $default != null:
return $default(_that.changes,_that.cursor,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SyncPage implements SyncPage {
  const _SyncPage({required  List<SyncChange> changes, required this.cursor, this.hasMore = false}): _changes = changes;
  factory _SyncPage.fromJson(Map<String, dynamic> json) => _$SyncPageFromJson(json);

 final  List<SyncChange> _changes;
@override List<SyncChange> get changes {
  if (_changes is EqualUnmodifiableListView) return _changes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_changes);
}

@override final  String cursor;
@override@JsonKey() final  bool hasMore;

/// Create a copy of SyncPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncPageCopyWith<_SyncPage> get copyWith => __$SyncPageCopyWithImpl<_SyncPage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SyncPageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncPage&&const DeepCollectionEquality().equals(other._changes, _changes)&&(identical(other.cursor, cursor) || other.cursor == cursor)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_changes),cursor,hasMore);

@override
String toString() {
  return 'SyncPage(changes: $changes, cursor: $cursor, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$SyncPageCopyWith<$Res> implements $SyncPageCopyWith<$Res> {
  factory _$SyncPageCopyWith(_SyncPage value, $Res Function(_SyncPage) _then) = __$SyncPageCopyWithImpl;
@override @useResult
$Res call({
 List<SyncChange> changes, String cursor, bool hasMore
});




}
/// @nodoc
class __$SyncPageCopyWithImpl<$Res>
    implements _$SyncPageCopyWith<$Res> {
  __$SyncPageCopyWithImpl(this._self, this._then);

  final _SyncPage _self;
  final $Res Function(_SyncPage) _then;

/// Create a copy of SyncPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? changes = null,Object? cursor = null,Object? hasMore = null,}) {
  return _then(_SyncPage(
changes: null == changes ? _self._changes : changes // ignore: cast_nullable_to_non_nullable
as List<SyncChange>,cursor: null == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as String,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
