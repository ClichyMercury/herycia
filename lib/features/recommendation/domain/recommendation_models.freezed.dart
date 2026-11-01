// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommendation_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequestItem {

@IdConverter() String get clothingTypeId;@IdConverter() String get colorId; PieceRole get role;
/// Create a copy of RequestItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestItemCopyWith<RequestItem> get copyWith => _$RequestItemCopyWithImpl<RequestItem>(this as RequestItem, _$identity);

  /// Serializes this RequestItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestItem&&(identical(other.clothingTypeId, clothingTypeId) || other.clothingTypeId == clothingTypeId)&&(identical(other.colorId, colorId) || other.colorId == colorId)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clothingTypeId,colorId,role);

@override
String toString() {
  return 'RequestItem(clothingTypeId: $clothingTypeId, colorId: $colorId, role: $role)';
}


}

/// @nodoc
abstract mixin class $RequestItemCopyWith<$Res>  {
  factory $RequestItemCopyWith(RequestItem value, $Res Function(RequestItem) _then) = _$RequestItemCopyWithImpl;
@useResult
$Res call({
@IdConverter() String clothingTypeId,@IdConverter() String colorId, PieceRole role
});




}
/// @nodoc
class _$RequestItemCopyWithImpl<$Res>
    implements $RequestItemCopyWith<$Res> {
  _$RequestItemCopyWithImpl(this._self, this._then);

  final RequestItem _self;
  final $Res Function(RequestItem) _then;

/// Create a copy of RequestItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clothingTypeId = null,Object? colorId = null,Object? role = null,}) {
  return _then(RequestItem(
clothingTypeId: null == clothingTypeId ? _self.clothingTypeId : clothingTypeId // ignore: cast_nullable_to_non_nullable
as String,colorId: null == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as PieceRole,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestItem].
extension RequestItemPatterns on RequestItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestItem value)  $default,){
final _that = this;
switch (_that) {
case _RequestItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestItem value)?  $default,){
final _that = this;
switch (_that) {
case _RequestItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String clothingTypeId, @IdConverter()  String colorId,  PieceRole role)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestItem() when $default != null:
return $default(_that.clothingTypeId,_that.colorId,_that.role);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String clothingTypeId, @IdConverter()  String colorId,  PieceRole role)  $default,) {final _that = this;
switch (_that) {
case _RequestItem():
return $default(_that.clothingTypeId,_that.colorId,_that.role);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String clothingTypeId, @IdConverter()  String colorId,  PieceRole role)?  $default,) {final _that = this;
switch (_that) {
case _RequestItem() when $default != null:
return $default(_that.clothingTypeId,_that.colorId,_that.role);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestItem implements RequestItem {
  const _RequestItem({@IdConverter() required this.clothingTypeId, @IdConverter() required this.colorId, required this.role});
  factory _RequestItem.fromJson(Map<String, dynamic> json) => _$RequestItemFromJson(json);

@override@IdConverter() final  String clothingTypeId;
@override@IdConverter() final  String colorId;
@override final  PieceRole role;

/// Create a copy of RequestItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestItemCopyWith<_RequestItem> get copyWith => __$RequestItemCopyWithImpl<_RequestItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestItem&&(identical(other.clothingTypeId, clothingTypeId) || other.clothingTypeId == clothingTypeId)&&(identical(other.colorId, colorId) || other.colorId == colorId)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clothingTypeId,colorId,role);

@override
String toString() {
  return 'RequestItem(clothingTypeId: $clothingTypeId, colorId: $colorId, role: $role)';
}


}

/// @nodoc
abstract mixin class _$RequestItemCopyWith<$Res> implements $RequestItemCopyWith<$Res> {
  factory _$RequestItemCopyWith(_RequestItem value, $Res Function(_RequestItem) _then) = __$RequestItemCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String clothingTypeId,@IdConverter() String colorId, PieceRole role
});




}
/// @nodoc
class __$RequestItemCopyWithImpl<$Res>
    implements _$RequestItemCopyWith<$Res> {
  __$RequestItemCopyWithImpl(this._self, this._then);

  final _RequestItem _self;
  final $Res Function(_RequestItem) _then;

/// Create a copy of RequestItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clothingTypeId = null,Object? colorId = null,Object? role = null,}) {
  return _then(_RequestItem(
clothingTypeId: null == clothingTypeId ? _self.clothingTypeId : clothingTypeId // ignore: cast_nullable_to_non_nullable
as String,colorId: null == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as PieceRole,
  ));
}


}


/// @nodoc
mixin _$FromItemRequest {

@IdConverter() String get clothingTypeId;@IdConverter() String get colorId; String? get occasionSlug; String? get styleSlug; int get limit;
/// Create a copy of FromItemRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FromItemRequestCopyWith<FromItemRequest> get copyWith => _$FromItemRequestCopyWithImpl<FromItemRequest>(this as FromItemRequest, _$identity);

  /// Serializes this FromItemRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FromItemRequest&&(identical(other.clothingTypeId, clothingTypeId) || other.clothingTypeId == clothingTypeId)&&(identical(other.colorId, colorId) || other.colorId == colorId)&&(identical(other.occasionSlug, occasionSlug) || other.occasionSlug == occasionSlug)&&(identical(other.styleSlug, styleSlug) || other.styleSlug == styleSlug)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clothingTypeId,colorId,occasionSlug,styleSlug,limit);

@override
String toString() {
  return 'FromItemRequest(clothingTypeId: $clothingTypeId, colorId: $colorId, occasionSlug: $occasionSlug, styleSlug: $styleSlug, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $FromItemRequestCopyWith<$Res>  {
  factory $FromItemRequestCopyWith(FromItemRequest value, $Res Function(FromItemRequest) _then) = _$FromItemRequestCopyWithImpl;
@useResult
$Res call({
@IdConverter() String clothingTypeId,@IdConverter() String colorId, String? occasionSlug, String? styleSlug, int limit
});




}
/// @nodoc
class _$FromItemRequestCopyWithImpl<$Res>
    implements $FromItemRequestCopyWith<$Res> {
  _$FromItemRequestCopyWithImpl(this._self, this._then);

  final FromItemRequest _self;
  final $Res Function(FromItemRequest) _then;

/// Create a copy of FromItemRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clothingTypeId = null,Object? colorId = null,Object? occasionSlug = freezed,Object? styleSlug = freezed,Object? limit = null,}) {
  return _then(FromItemRequest(
clothingTypeId: null == clothingTypeId ? _self.clothingTypeId : clothingTypeId // ignore: cast_nullable_to_non_nullable
as String,colorId: null == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as String,occasionSlug: freezed == occasionSlug ? _self.occasionSlug : occasionSlug // ignore: cast_nullable_to_non_nullable
as String?,styleSlug: freezed == styleSlug ? _self.styleSlug : styleSlug // ignore: cast_nullable_to_non_nullable
as String?,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FromItemRequest].
extension FromItemRequestPatterns on FromItemRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FromItemRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FromItemRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FromItemRequest value)  $default,){
final _that = this;
switch (_that) {
case _FromItemRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FromItemRequest value)?  $default,){
final _that = this;
switch (_that) {
case _FromItemRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String clothingTypeId, @IdConverter()  String colorId,  String? occasionSlug,  String? styleSlug,  int limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FromItemRequest() when $default != null:
return $default(_that.clothingTypeId,_that.colorId,_that.occasionSlug,_that.styleSlug,_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String clothingTypeId, @IdConverter()  String colorId,  String? occasionSlug,  String? styleSlug,  int limit)  $default,) {final _that = this;
switch (_that) {
case _FromItemRequest():
return $default(_that.clothingTypeId,_that.colorId,_that.occasionSlug,_that.styleSlug,_that.limit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String clothingTypeId, @IdConverter()  String colorId,  String? occasionSlug,  String? styleSlug,  int limit)?  $default,) {final _that = this;
switch (_that) {
case _FromItemRequest() when $default != null:
return $default(_that.clothingTypeId,_that.colorId,_that.occasionSlug,_that.styleSlug,_that.limit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FromItemRequest implements FromItemRequest {
  const _FromItemRequest({@IdConverter() required this.clothingTypeId, @IdConverter() required this.colorId, this.occasionSlug, this.styleSlug, this.limit = 5});
  factory _FromItemRequest.fromJson(Map<String, dynamic> json) => _$FromItemRequestFromJson(json);

@override@IdConverter() final  String clothingTypeId;
@override@IdConverter() final  String colorId;
@override final  String? occasionSlug;
@override final  String? styleSlug;
@override@JsonKey() final  int limit;

/// Create a copy of FromItemRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FromItemRequestCopyWith<_FromItemRequest> get copyWith => __$FromItemRequestCopyWithImpl<_FromItemRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FromItemRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FromItemRequest&&(identical(other.clothingTypeId, clothingTypeId) || other.clothingTypeId == clothingTypeId)&&(identical(other.colorId, colorId) || other.colorId == colorId)&&(identical(other.occasionSlug, occasionSlug) || other.occasionSlug == occasionSlug)&&(identical(other.styleSlug, styleSlug) || other.styleSlug == styleSlug)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clothingTypeId,colorId,occasionSlug,styleSlug,limit);

@override
String toString() {
  return 'FromItemRequest(clothingTypeId: $clothingTypeId, colorId: $colorId, occasionSlug: $occasionSlug, styleSlug: $styleSlug, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$FromItemRequestCopyWith<$Res> implements $FromItemRequestCopyWith<$Res> {
  factory _$FromItemRequestCopyWith(_FromItemRequest value, $Res Function(_FromItemRequest) _then) = __$FromItemRequestCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String clothingTypeId,@IdConverter() String colorId, String? occasionSlug, String? styleSlug, int limit
});




}
/// @nodoc
class __$FromItemRequestCopyWithImpl<$Res>
    implements _$FromItemRequestCopyWith<$Res> {
  __$FromItemRequestCopyWithImpl(this._self, this._then);

  final _FromItemRequest _self;
  final $Res Function(_FromItemRequest) _then;

/// Create a copy of FromItemRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clothingTypeId = null,Object? colorId = null,Object? occasionSlug = freezed,Object? styleSlug = freezed,Object? limit = null,}) {
  return _then(_FromItemRequest(
clothingTypeId: null == clothingTypeId ? _self.clothingTypeId : clothingTypeId // ignore: cast_nullable_to_non_nullable
as String,colorId: null == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as String,occasionSlug: freezed == occasionSlug ? _self.occasionSlug : occasionSlug // ignore: cast_nullable_to_non_nullable
as String?,styleSlug: freezed == styleSlug ? _self.styleSlug : styleSlug // ignore: cast_nullable_to_non_nullable
as String?,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$OutfitRequest {

 List<RequestItem> get items; String? get occasionSlug; String? get styleSlug;
/// Create a copy of OutfitRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutfitRequestCopyWith<OutfitRequest> get copyWith => _$OutfitRequestCopyWithImpl<OutfitRequest>(this as OutfitRequest, _$identity);

  /// Serializes this OutfitRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutfitRequest&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.occasionSlug, occasionSlug) || other.occasionSlug == occasionSlug)&&(identical(other.styleSlug, styleSlug) || other.styleSlug == styleSlug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),occasionSlug,styleSlug);

@override
String toString() {
  return 'OutfitRequest(items: $items, occasionSlug: $occasionSlug, styleSlug: $styleSlug)';
}


}

/// @nodoc
abstract mixin class $OutfitRequestCopyWith<$Res>  {
  factory $OutfitRequestCopyWith(OutfitRequest value, $Res Function(OutfitRequest) _then) = _$OutfitRequestCopyWithImpl;
@useResult
$Res call({
 List<RequestItem> items, String? occasionSlug, String? styleSlug
});




}
/// @nodoc
class _$OutfitRequestCopyWithImpl<$Res>
    implements $OutfitRequestCopyWith<$Res> {
  _$OutfitRequestCopyWithImpl(this._self, this._then);

  final OutfitRequest _self;
  final $Res Function(OutfitRequest) _then;

/// Create a copy of OutfitRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? occasionSlug = freezed,Object? styleSlug = freezed,}) {
  return _then(OutfitRequest(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<RequestItem>,occasionSlug: freezed == occasionSlug ? _self.occasionSlug : occasionSlug // ignore: cast_nullable_to_non_nullable
as String?,styleSlug: freezed == styleSlug ? _self.styleSlug : styleSlug // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OutfitRequest].
extension OutfitRequestPatterns on OutfitRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OutfitRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OutfitRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OutfitRequest value)  $default,){
final _that = this;
switch (_that) {
case _OutfitRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OutfitRequest value)?  $default,){
final _that = this;
switch (_that) {
case _OutfitRequest() when $default != null:
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
case _OutfitRequest() when $default != null:
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
case _OutfitRequest():
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
case _OutfitRequest() when $default != null:
return $default(_that.items,_that.occasionSlug,_that.styleSlug);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OutfitRequest implements OutfitRequest {
  const _OutfitRequest({required  List<RequestItem> items, this.occasionSlug, this.styleSlug}): _items = items;
  factory _OutfitRequest.fromJson(Map<String, dynamic> json) => _$OutfitRequestFromJson(json);

 final  List<RequestItem> _items;
@override List<RequestItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? occasionSlug;
@override final  String? styleSlug;

/// Create a copy of OutfitRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutfitRequestCopyWith<_OutfitRequest> get copyWith => __$OutfitRequestCopyWithImpl<_OutfitRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OutfitRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutfitRequest&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.occasionSlug, occasionSlug) || other.occasionSlug == occasionSlug)&&(identical(other.styleSlug, styleSlug) || other.styleSlug == styleSlug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),occasionSlug,styleSlug);

@override
String toString() {
  return 'OutfitRequest(items: $items, occasionSlug: $occasionSlug, styleSlug: $styleSlug)';
}


}

/// @nodoc
abstract mixin class _$OutfitRequestCopyWith<$Res> implements $OutfitRequestCopyWith<$Res> {
  factory _$OutfitRequestCopyWith(_OutfitRequest value, $Res Function(_OutfitRequest) _then) = __$OutfitRequestCopyWithImpl;
@override @useResult
$Res call({
 List<RequestItem> items, String? occasionSlug, String? styleSlug
});




}
/// @nodoc
class __$OutfitRequestCopyWithImpl<$Res>
    implements _$OutfitRequestCopyWith<$Res> {
  __$OutfitRequestCopyWithImpl(this._self, this._then);

  final _OutfitRequest _self;
  final $Res Function(_OutfitRequest) _then;

/// Create a copy of OutfitRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? occasionSlug = freezed,Object? styleSlug = freezed,}) {
  return _then(_OutfitRequest(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<RequestItem>,occasionSlug: freezed == occasionSlug ? _self.occasionSlug : occasionSlug // ignore: cast_nullable_to_non_nullable
as String?,styleSlug: freezed == styleSlug ? _self.styleSlug : styleSlug // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ScorePart {

 int get points; int get max;
/// Create a copy of ScorePart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScorePartCopyWith<ScorePart> get copyWith => _$ScorePartCopyWithImpl<ScorePart>(this as ScorePart, _$identity);

  /// Serializes this ScorePart to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScorePart&&(identical(other.points, points) || other.points == points)&&(identical(other.max, max) || other.max == max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,points,max);

@override
String toString() {
  return 'ScorePart(points: $points, max: $max)';
}


}

/// @nodoc
abstract mixin class $ScorePartCopyWith<$Res>  {
  factory $ScorePartCopyWith(ScorePart value, $Res Function(ScorePart) _then) = _$ScorePartCopyWithImpl;
@useResult
$Res call({
 int points, int max
});




}
/// @nodoc
class _$ScorePartCopyWithImpl<$Res>
    implements $ScorePartCopyWith<$Res> {
  _$ScorePartCopyWithImpl(this._self, this._then);

  final ScorePart _self;
  final $Res Function(ScorePart) _then;

/// Create a copy of ScorePart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? points = null,Object? max = null,}) {
  return _then(ScorePart(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ScorePart].
extension ScorePartPatterns on ScorePart {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScorePart value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScorePart() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScorePart value)  $default,){
final _that = this;
switch (_that) {
case _ScorePart():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScorePart value)?  $default,){
final _that = this;
switch (_that) {
case _ScorePart() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int points,  int max)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScorePart() when $default != null:
return $default(_that.points,_that.max);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int points,  int max)  $default,) {final _that = this;
switch (_that) {
case _ScorePart():
return $default(_that.points,_that.max);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int points,  int max)?  $default,) {final _that = this;
switch (_that) {
case _ScorePart() when $default != null:
return $default(_that.points,_that.max);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScorePart implements ScorePart {
  const _ScorePart({required this.points, required this.max});
  factory _ScorePart.fromJson(Map<String, dynamic> json) => _$ScorePartFromJson(json);

@override final  int points;
@override final  int max;

/// Create a copy of ScorePart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScorePartCopyWith<_ScorePart> get copyWith => __$ScorePartCopyWithImpl<_ScorePart>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScorePartToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScorePart&&(identical(other.points, points) || other.points == points)&&(identical(other.max, max) || other.max == max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,points,max);

@override
String toString() {
  return 'ScorePart(points: $points, max: $max)';
}


}

/// @nodoc
abstract mixin class _$ScorePartCopyWith<$Res> implements $ScorePartCopyWith<$Res> {
  factory _$ScorePartCopyWith(_ScorePart value, $Res Function(_ScorePart) _then) = __$ScorePartCopyWithImpl;
@override @useResult
$Res call({
 int points, int max
});




}
/// @nodoc
class __$ScorePartCopyWithImpl<$Res>
    implements _$ScorePartCopyWith<$Res> {
  __$ScorePartCopyWithImpl(this._self, this._then);

  final _ScorePart _self;
  final $Res Function(_ScorePart) _then;

/// Create a copy of ScorePart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? points = null,Object? max = null,}) {
  return _then(_ScorePart(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ScoreBreakdown {

 ScorePart get color; ScorePart get structure; ScorePart get occasion; ScorePart get style; ScorePart get completeness;
/// Create a copy of ScoreBreakdown
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoreBreakdownCopyWith<ScoreBreakdown> get copyWith => _$ScoreBreakdownCopyWithImpl<ScoreBreakdown>(this as ScoreBreakdown, _$identity);

  /// Serializes this ScoreBreakdown to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoreBreakdown&&(identical(other.color, color) || other.color == color)&&(identical(other.structure, structure) || other.structure == structure)&&(identical(other.occasion, occasion) || other.occasion == occasion)&&(identical(other.style, style) || other.style == style)&&(identical(other.completeness, completeness) || other.completeness == completeness));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,structure,occasion,style,completeness);

@override
String toString() {
  return 'ScoreBreakdown(color: $color, structure: $structure, occasion: $occasion, style: $style, completeness: $completeness)';
}


}

/// @nodoc
abstract mixin class $ScoreBreakdownCopyWith<$Res>  {
  factory $ScoreBreakdownCopyWith(ScoreBreakdown value, $Res Function(ScoreBreakdown) _then) = _$ScoreBreakdownCopyWithImpl;
@useResult
$Res call({
 ScorePart color, ScorePart structure, ScorePart occasion, ScorePart style, ScorePart completeness
});


$ScorePartCopyWith<$Res> get color;$ScorePartCopyWith<$Res> get structure;$ScorePartCopyWith<$Res> get occasion;$ScorePartCopyWith<$Res> get style;$ScorePartCopyWith<$Res> get completeness;

}
/// @nodoc
class _$ScoreBreakdownCopyWithImpl<$Res>
    implements $ScoreBreakdownCopyWith<$Res> {
  _$ScoreBreakdownCopyWithImpl(this._self, this._then);

  final ScoreBreakdown _self;
  final $Res Function(ScoreBreakdown) _then;

/// Create a copy of ScoreBreakdown
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? color = null,Object? structure = null,Object? occasion = null,Object? style = null,Object? completeness = null,}) {
  return _then(ScoreBreakdown(
color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as ScorePart,structure: null == structure ? _self.structure : structure // ignore: cast_nullable_to_non_nullable
as ScorePart,occasion: null == occasion ? _self.occasion : occasion // ignore: cast_nullable_to_non_nullable
as ScorePart,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as ScorePart,completeness: null == completeness ? _self.completeness : completeness // ignore: cast_nullable_to_non_nullable
as ScorePart,
  ));
}
/// Create a copy of ScoreBreakdown
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScorePartCopyWith<$Res> get color {
  
  return $ScorePartCopyWith<$Res>(_self.color, (value) {
    return _then(_self.copyWith(color: value));
  });
}/// Create a copy of ScoreBreakdown
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScorePartCopyWith<$Res> get structure {
  
  return $ScorePartCopyWith<$Res>(_self.structure, (value) {
    return _then(_self.copyWith(structure: value));
  });
}/// Create a copy of ScoreBreakdown
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScorePartCopyWith<$Res> get occasion {
  
  return $ScorePartCopyWith<$Res>(_self.occasion, (value) {
    return _then(_self.copyWith(occasion: value));
  });
}/// Create a copy of ScoreBreakdown
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScorePartCopyWith<$Res> get style {
  
  return $ScorePartCopyWith<$Res>(_self.style, (value) {
    return _then(_self.copyWith(style: value));
  });
}/// Create a copy of ScoreBreakdown
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScorePartCopyWith<$Res> get completeness {
  
  return $ScorePartCopyWith<$Res>(_self.completeness, (value) {
    return _then(_self.copyWith(completeness: value));
  });
}
}


/// Adds pattern-matching-related methods to [ScoreBreakdown].
extension ScoreBreakdownPatterns on ScoreBreakdown {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScoreBreakdown value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScoreBreakdown() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScoreBreakdown value)  $default,){
final _that = this;
switch (_that) {
case _ScoreBreakdown():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScoreBreakdown value)?  $default,){
final _that = this;
switch (_that) {
case _ScoreBreakdown() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ScorePart color,  ScorePart structure,  ScorePart occasion,  ScorePart style,  ScorePart completeness)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScoreBreakdown() when $default != null:
return $default(_that.color,_that.structure,_that.occasion,_that.style,_that.completeness);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ScorePart color,  ScorePart structure,  ScorePart occasion,  ScorePart style,  ScorePart completeness)  $default,) {final _that = this;
switch (_that) {
case _ScoreBreakdown():
return $default(_that.color,_that.structure,_that.occasion,_that.style,_that.completeness);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ScorePart color,  ScorePart structure,  ScorePart occasion,  ScorePart style,  ScorePart completeness)?  $default,) {final _that = this;
switch (_that) {
case _ScoreBreakdown() when $default != null:
return $default(_that.color,_that.structure,_that.occasion,_that.style,_that.completeness);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScoreBreakdown extends ScoreBreakdown {
  const _ScoreBreakdown({required this.color, required this.structure, required this.occasion, required this.style, required this.completeness}): super._();
  factory _ScoreBreakdown.fromJson(Map<String, dynamic> json) => _$ScoreBreakdownFromJson(json);

@override final  ScorePart color;
@override final  ScorePart structure;
@override final  ScorePart occasion;
@override final  ScorePart style;
@override final  ScorePart completeness;

/// Create a copy of ScoreBreakdown
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScoreBreakdownCopyWith<_ScoreBreakdown> get copyWith => __$ScoreBreakdownCopyWithImpl<_ScoreBreakdown>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScoreBreakdownToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScoreBreakdown&&(identical(other.color, color) || other.color == color)&&(identical(other.structure, structure) || other.structure == structure)&&(identical(other.occasion, occasion) || other.occasion == occasion)&&(identical(other.style, style) || other.style == style)&&(identical(other.completeness, completeness) || other.completeness == completeness));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,structure,occasion,style,completeness);

@override
String toString() {
  return 'ScoreBreakdown(color: $color, structure: $structure, occasion: $occasion, style: $style, completeness: $completeness)';
}


}

/// @nodoc
abstract mixin class _$ScoreBreakdownCopyWith<$Res> implements $ScoreBreakdownCopyWith<$Res> {
  factory _$ScoreBreakdownCopyWith(_ScoreBreakdown value, $Res Function(_ScoreBreakdown) _then) = __$ScoreBreakdownCopyWithImpl;
@override @useResult
$Res call({
 ScorePart color, ScorePart structure, ScorePart occasion, ScorePart style, ScorePart completeness
});


@override $ScorePartCopyWith<$Res> get color;@override $ScorePartCopyWith<$Res> get structure;@override $ScorePartCopyWith<$Res> get occasion;@override $ScorePartCopyWith<$Res> get style;@override $ScorePartCopyWith<$Res> get completeness;

}
/// @nodoc
class __$ScoreBreakdownCopyWithImpl<$Res>
    implements _$ScoreBreakdownCopyWith<$Res> {
  __$ScoreBreakdownCopyWithImpl(this._self, this._then);

  final _ScoreBreakdown _self;
  final $Res Function(_ScoreBreakdown) _then;

/// Create a copy of ScoreBreakdown
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? color = null,Object? structure = null,Object? occasion = null,Object? style = null,Object? completeness = null,}) {
  return _then(_ScoreBreakdown(
color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as ScorePart,structure: null == structure ? _self.structure : structure // ignore: cast_nullable_to_non_nullable
as ScorePart,occasion: null == occasion ? _self.occasion : occasion // ignore: cast_nullable_to_non_nullable
as ScorePart,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as ScorePart,completeness: null == completeness ? _self.completeness : completeness // ignore: cast_nullable_to_non_nullable
as ScorePart,
  ));
}

/// Create a copy of ScoreBreakdown
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScorePartCopyWith<$Res> get color {
  
  return $ScorePartCopyWith<$Res>(_self.color, (value) {
    return _then(_self.copyWith(color: value));
  });
}/// Create a copy of ScoreBreakdown
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScorePartCopyWith<$Res> get structure {
  
  return $ScorePartCopyWith<$Res>(_self.structure, (value) {
    return _then(_self.copyWith(structure: value));
  });
}/// Create a copy of ScoreBreakdown
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScorePartCopyWith<$Res> get occasion {
  
  return $ScorePartCopyWith<$Res>(_self.occasion, (value) {
    return _then(_self.copyWith(occasion: value));
  });
}/// Create a copy of ScoreBreakdown
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScorePartCopyWith<$Res> get style {
  
  return $ScorePartCopyWith<$Res>(_self.style, (value) {
    return _then(_self.copyWith(style: value));
  });
}/// Create a copy of ScoreBreakdown
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScorePartCopyWith<$Res> get completeness {
  
  return $ScorePartCopyWith<$Res>(_self.completeness, (value) {
    return _then(_self.copyWith(completeness: value));
  });
}
}


/// @nodoc
mixin _$StartingItem {

 CatalogRef get clothingType; ColorRef get color; PieceRole get role;
/// Create a copy of StartingItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StartingItemCopyWith<StartingItem> get copyWith => _$StartingItemCopyWithImpl<StartingItem>(this as StartingItem, _$identity);

  /// Serializes this StartingItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartingItem&&(identical(other.clothingType, clothingType) || other.clothingType == clothingType)&&(identical(other.color, color) || other.color == color)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clothingType,color,role);

@override
String toString() {
  return 'StartingItem(clothingType: $clothingType, color: $color, role: $role)';
}


}

/// @nodoc
abstract mixin class $StartingItemCopyWith<$Res>  {
  factory $StartingItemCopyWith(StartingItem value, $Res Function(StartingItem) _then) = _$StartingItemCopyWithImpl;
@useResult
$Res call({
 CatalogRef clothingType, ColorRef color, PieceRole role
});


$CatalogRefCopyWith<$Res> get clothingType;$ColorRefCopyWith<$Res> get color;

}
/// @nodoc
class _$StartingItemCopyWithImpl<$Res>
    implements $StartingItemCopyWith<$Res> {
  _$StartingItemCopyWithImpl(this._self, this._then);

  final StartingItem _self;
  final $Res Function(StartingItem) _then;

/// Create a copy of StartingItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clothingType = null,Object? color = null,Object? role = null,}) {
  return _then(StartingItem(
clothingType: null == clothingType ? _self.clothingType : clothingType // ignore: cast_nullable_to_non_nullable
as CatalogRef,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as ColorRef,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as PieceRole,
  ));
}
/// Create a copy of StartingItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogRefCopyWith<$Res> get clothingType {
  
  return $CatalogRefCopyWith<$Res>(_self.clothingType, (value) {
    return _then(_self.copyWith(clothingType: value));
  });
}/// Create a copy of StartingItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ColorRefCopyWith<$Res> get color {
  
  return $ColorRefCopyWith<$Res>(_self.color, (value) {
    return _then(_self.copyWith(color: value));
  });
}
}


/// Adds pattern-matching-related methods to [StartingItem].
extension StartingItemPatterns on StartingItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StartingItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StartingItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StartingItem value)  $default,){
final _that = this;
switch (_that) {
case _StartingItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StartingItem value)?  $default,){
final _that = this;
switch (_that) {
case _StartingItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CatalogRef clothingType,  ColorRef color,  PieceRole role)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StartingItem() when $default != null:
return $default(_that.clothingType,_that.color,_that.role);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CatalogRef clothingType,  ColorRef color,  PieceRole role)  $default,) {final _that = this;
switch (_that) {
case _StartingItem():
return $default(_that.clothingType,_that.color,_that.role);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CatalogRef clothingType,  ColorRef color,  PieceRole role)?  $default,) {final _that = this;
switch (_that) {
case _StartingItem() when $default != null:
return $default(_that.clothingType,_that.color,_that.role);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StartingItem implements StartingItem {
  const _StartingItem({required this.clothingType, required this.color, required this.role});
  factory _StartingItem.fromJson(Map<String, dynamic> json) => _$StartingItemFromJson(json);

@override final  CatalogRef clothingType;
@override final  ColorRef color;
@override final  PieceRole role;

/// Create a copy of StartingItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartingItemCopyWith<_StartingItem> get copyWith => __$StartingItemCopyWithImpl<_StartingItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StartingItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartingItem&&(identical(other.clothingType, clothingType) || other.clothingType == clothingType)&&(identical(other.color, color) || other.color == color)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clothingType,color,role);

@override
String toString() {
  return 'StartingItem(clothingType: $clothingType, color: $color, role: $role)';
}


}

/// @nodoc
abstract mixin class _$StartingItemCopyWith<$Res> implements $StartingItemCopyWith<$Res> {
  factory _$StartingItemCopyWith(_StartingItem value, $Res Function(_StartingItem) _then) = __$StartingItemCopyWithImpl;
@override @useResult
$Res call({
 CatalogRef clothingType, ColorRef color, PieceRole role
});


@override $CatalogRefCopyWith<$Res> get clothingType;@override $ColorRefCopyWith<$Res> get color;

}
/// @nodoc
class __$StartingItemCopyWithImpl<$Res>
    implements _$StartingItemCopyWith<$Res> {
  __$StartingItemCopyWithImpl(this._self, this._then);

  final _StartingItem _self;
  final $Res Function(_StartingItem) _then;

/// Create a copy of StartingItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clothingType = null,Object? color = null,Object? role = null,}) {
  return _then(_StartingItem(
clothingType: null == clothingType ? _self.clothingType : clothingType // ignore: cast_nullable_to_non_nullable
as CatalogRef,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as ColorRef,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as PieceRole,
  ));
}

/// Create a copy of StartingItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogRefCopyWith<$Res> get clothingType {
  
  return $CatalogRefCopyWith<$Res>(_self.clothingType, (value) {
    return _then(_self.copyWith(clothingType: value));
  });
}/// Create a copy of StartingItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ColorRefCopyWith<$Res> get color {
  
  return $ColorRefCopyWith<$Res>(_self.color, (value) {
    return _then(_self.copyWith(color: value));
  });
}
}


/// @nodoc
mixin _$AppliedFilters {

 String? get occasionSlug; String? get styleSlug;
/// Create a copy of AppliedFilters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppliedFiltersCopyWith<AppliedFilters> get copyWith => _$AppliedFiltersCopyWithImpl<AppliedFilters>(this as AppliedFilters, _$identity);

  /// Serializes this AppliedFilters to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppliedFilters&&(identical(other.occasionSlug, occasionSlug) || other.occasionSlug == occasionSlug)&&(identical(other.styleSlug, styleSlug) || other.styleSlug == styleSlug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,occasionSlug,styleSlug);

@override
String toString() {
  return 'AppliedFilters(occasionSlug: $occasionSlug, styleSlug: $styleSlug)';
}


}

/// @nodoc
abstract mixin class $AppliedFiltersCopyWith<$Res>  {
  factory $AppliedFiltersCopyWith(AppliedFilters value, $Res Function(AppliedFilters) _then) = _$AppliedFiltersCopyWithImpl;
@useResult
$Res call({
 String? occasionSlug, String? styleSlug
});




}
/// @nodoc
class _$AppliedFiltersCopyWithImpl<$Res>
    implements $AppliedFiltersCopyWith<$Res> {
  _$AppliedFiltersCopyWithImpl(this._self, this._then);

  final AppliedFilters _self;
  final $Res Function(AppliedFilters) _then;

/// Create a copy of AppliedFilters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? occasionSlug = freezed,Object? styleSlug = freezed,}) {
  return _then(AppliedFilters(
occasionSlug: freezed == occasionSlug ? _self.occasionSlug : occasionSlug // ignore: cast_nullable_to_non_nullable
as String?,styleSlug: freezed == styleSlug ? _self.styleSlug : styleSlug // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppliedFilters].
extension AppliedFiltersPatterns on AppliedFilters {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppliedFilters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppliedFilters() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppliedFilters value)  $default,){
final _that = this;
switch (_that) {
case _AppliedFilters():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppliedFilters value)?  $default,){
final _that = this;
switch (_that) {
case _AppliedFilters() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? occasionSlug,  String? styleSlug)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppliedFilters() when $default != null:
return $default(_that.occasionSlug,_that.styleSlug);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? occasionSlug,  String? styleSlug)  $default,) {final _that = this;
switch (_that) {
case _AppliedFilters():
return $default(_that.occasionSlug,_that.styleSlug);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? occasionSlug,  String? styleSlug)?  $default,) {final _that = this;
switch (_that) {
case _AppliedFilters() when $default != null:
return $default(_that.occasionSlug,_that.styleSlug);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppliedFilters implements AppliedFilters {
  const _AppliedFilters({this.occasionSlug, this.styleSlug});
  factory _AppliedFilters.fromJson(Map<String, dynamic> json) => _$AppliedFiltersFromJson(json);

@override final  String? occasionSlug;
@override final  String? styleSlug;

/// Create a copy of AppliedFilters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppliedFiltersCopyWith<_AppliedFilters> get copyWith => __$AppliedFiltersCopyWithImpl<_AppliedFilters>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppliedFiltersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppliedFilters&&(identical(other.occasionSlug, occasionSlug) || other.occasionSlug == occasionSlug)&&(identical(other.styleSlug, styleSlug) || other.styleSlug == styleSlug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,occasionSlug,styleSlug);

@override
String toString() {
  return 'AppliedFilters(occasionSlug: $occasionSlug, styleSlug: $styleSlug)';
}


}

/// @nodoc
abstract mixin class _$AppliedFiltersCopyWith<$Res> implements $AppliedFiltersCopyWith<$Res> {
  factory _$AppliedFiltersCopyWith(_AppliedFilters value, $Res Function(_AppliedFilters) _then) = __$AppliedFiltersCopyWithImpl;
@override @useResult
$Res call({
 String? occasionSlug, String? styleSlug
});




}
/// @nodoc
class __$AppliedFiltersCopyWithImpl<$Res>
    implements _$AppliedFiltersCopyWith<$Res> {
  __$AppliedFiltersCopyWithImpl(this._self, this._then);

  final _AppliedFilters _self;
  final $Res Function(_AppliedFilters) _then;

/// Create a copy of AppliedFilters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? occasionSlug = freezed,Object? styleSlug = freezed,}) {
  return _then(_AppliedFilters(
occasionSlug: freezed == occasionSlug ? _self.occasionSlug : occasionSlug // ignore: cast_nullable_to_non_nullable
as String?,styleSlug: freezed == styleSlug ? _self.styleSlug : styleSlug // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Broadening {

 bool get applied; List<BroadeningCriterion> get steps;
/// Create a copy of Broadening
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BroadeningCopyWith<Broadening> get copyWith => _$BroadeningCopyWithImpl<Broadening>(this as Broadening, _$identity);

  /// Serializes this Broadening to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Broadening&&(identical(other.applied, applied) || other.applied == applied)&&const DeepCollectionEquality().equals(other.steps, steps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applied,const DeepCollectionEquality().hash(steps));

@override
String toString() {
  return 'Broadening(applied: $applied, steps: $steps)';
}


}

/// @nodoc
abstract mixin class $BroadeningCopyWith<$Res>  {
  factory $BroadeningCopyWith(Broadening value, $Res Function(Broadening) _then) = _$BroadeningCopyWithImpl;
@useResult
$Res call({
 bool applied, List<BroadeningCriterion> steps
});




}
/// @nodoc
class _$BroadeningCopyWithImpl<$Res>
    implements $BroadeningCopyWith<$Res> {
  _$BroadeningCopyWithImpl(this._self, this._then);

  final Broadening _self;
  final $Res Function(Broadening) _then;

/// Create a copy of Broadening
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applied = null,Object? steps = null,}) {
  return _then(Broadening(
applied: null == applied ? _self.applied : applied // ignore: cast_nullable_to_non_nullable
as bool,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<BroadeningCriterion>,
  ));
}

}


/// Adds pattern-matching-related methods to [Broadening].
extension BroadeningPatterns on Broadening {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Broadening value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Broadening() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Broadening value)  $default,){
final _that = this;
switch (_that) {
case _Broadening():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Broadening value)?  $default,){
final _that = this;
switch (_that) {
case _Broadening() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool applied,  List<BroadeningCriterion> steps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Broadening() when $default != null:
return $default(_that.applied,_that.steps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool applied,  List<BroadeningCriterion> steps)  $default,) {final _that = this;
switch (_that) {
case _Broadening():
return $default(_that.applied,_that.steps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool applied,  List<BroadeningCriterion> steps)?  $default,) {final _that = this;
switch (_that) {
case _Broadening() when $default != null:
return $default(_that.applied,_that.steps);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Broadening implements Broadening {
  const _Broadening({this.applied = false,  List<BroadeningCriterion> steps = const []}): _steps = steps;
  factory _Broadening.fromJson(Map<String, dynamic> json) => _$BroadeningFromJson(json);

@override@JsonKey() final  bool applied;
 final  List<BroadeningCriterion> _steps;
@override@JsonKey() List<BroadeningCriterion> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}


/// Create a copy of Broadening
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BroadeningCopyWith<_Broadening> get copyWith => __$BroadeningCopyWithImpl<_Broadening>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BroadeningToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Broadening&&(identical(other.applied, applied) || other.applied == applied)&&const DeepCollectionEquality().equals(other._steps, _steps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applied,const DeepCollectionEquality().hash(_steps));

@override
String toString() {
  return 'Broadening(applied: $applied, steps: $steps)';
}


}

/// @nodoc
abstract mixin class _$BroadeningCopyWith<$Res> implements $BroadeningCopyWith<$Res> {
  factory _$BroadeningCopyWith(_Broadening value, $Res Function(_Broadening) _then) = __$BroadeningCopyWithImpl;
@override @useResult
$Res call({
 bool applied, List<BroadeningCriterion> steps
});




}
/// @nodoc
class __$BroadeningCopyWithImpl<$Res>
    implements _$BroadeningCopyWith<$Res> {
  __$BroadeningCopyWithImpl(this._self, this._then);

  final _Broadening _self;
  final $Res Function(_Broadening) _then;

/// Create a copy of Broadening
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applied = null,Object? steps = null,}) {
  return _then(_Broadening(
applied: null == applied ? _self.applied : applied // ignore: cast_nullable_to_non_nullable
as bool,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<BroadeningCriterion>,
  ));
}


}


/// @nodoc
mixin _$RecommendedItem {

 CatalogRef get clothingType; ColorRef get color; PieceRole get role; bool get isRequired; bool get isStartingItem;
/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendedItemCopyWith<RecommendedItem> get copyWith => _$RecommendedItemCopyWithImpl<RecommendedItem>(this as RecommendedItem, _$identity);

  /// Serializes this RecommendedItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendedItem&&(identical(other.clothingType, clothingType) || other.clothingType == clothingType)&&(identical(other.color, color) || other.color == color)&&(identical(other.role, role) || other.role == role)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.isStartingItem, isStartingItem) || other.isStartingItem == isStartingItem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clothingType,color,role,isRequired,isStartingItem);

@override
String toString() {
  return 'RecommendedItem(clothingType: $clothingType, color: $color, role: $role, isRequired: $isRequired, isStartingItem: $isStartingItem)';
}


}

/// @nodoc
abstract mixin class $RecommendedItemCopyWith<$Res>  {
  factory $RecommendedItemCopyWith(RecommendedItem value, $Res Function(RecommendedItem) _then) = _$RecommendedItemCopyWithImpl;
@useResult
$Res call({
 CatalogRef clothingType, ColorRef color, PieceRole role, bool isRequired, bool isStartingItem
});


$CatalogRefCopyWith<$Res> get clothingType;$ColorRefCopyWith<$Res> get color;

}
/// @nodoc
class _$RecommendedItemCopyWithImpl<$Res>
    implements $RecommendedItemCopyWith<$Res> {
  _$RecommendedItemCopyWithImpl(this._self, this._then);

  final RecommendedItem _self;
  final $Res Function(RecommendedItem) _then;

/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clothingType = null,Object? color = null,Object? role = null,Object? isRequired = null,Object? isStartingItem = null,}) {
  return _then(RecommendedItem(
clothingType: null == clothingType ? _self.clothingType : clothingType // ignore: cast_nullable_to_non_nullable
as CatalogRef,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as ColorRef,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as PieceRole,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,isStartingItem: null == isStartingItem ? _self.isStartingItem : isStartingItem // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogRefCopyWith<$Res> get clothingType {
  
  return $CatalogRefCopyWith<$Res>(_self.clothingType, (value) {
    return _then(_self.copyWith(clothingType: value));
  });
}/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ColorRefCopyWith<$Res> get color {
  
  return $ColorRefCopyWith<$Res>(_self.color, (value) {
    return _then(_self.copyWith(color: value));
  });
}
}


/// Adds pattern-matching-related methods to [RecommendedItem].
extension RecommendedItemPatterns on RecommendedItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendedItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendedItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendedItem value)  $default,){
final _that = this;
switch (_that) {
case _RecommendedItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendedItem value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendedItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CatalogRef clothingType,  ColorRef color,  PieceRole role,  bool isRequired,  bool isStartingItem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendedItem() when $default != null:
return $default(_that.clothingType,_that.color,_that.role,_that.isRequired,_that.isStartingItem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CatalogRef clothingType,  ColorRef color,  PieceRole role,  bool isRequired,  bool isStartingItem)  $default,) {final _that = this;
switch (_that) {
case _RecommendedItem():
return $default(_that.clothingType,_that.color,_that.role,_that.isRequired,_that.isStartingItem);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CatalogRef clothingType,  ColorRef color,  PieceRole role,  bool isRequired,  bool isStartingItem)?  $default,) {final _that = this;
switch (_that) {
case _RecommendedItem() when $default != null:
return $default(_that.clothingType,_that.color,_that.role,_that.isRequired,_that.isStartingItem);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendedItem implements RecommendedItem {
  const _RecommendedItem({required this.clothingType, required this.color, required this.role, this.isRequired = true, this.isStartingItem = false});
  factory _RecommendedItem.fromJson(Map<String, dynamic> json) => _$RecommendedItemFromJson(json);

@override final  CatalogRef clothingType;
@override final  ColorRef color;
@override final  PieceRole role;
@override@JsonKey() final  bool isRequired;
@override@JsonKey() final  bool isStartingItem;

/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendedItemCopyWith<_RecommendedItem> get copyWith => __$RecommendedItemCopyWithImpl<_RecommendedItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendedItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendedItem&&(identical(other.clothingType, clothingType) || other.clothingType == clothingType)&&(identical(other.color, color) || other.color == color)&&(identical(other.role, role) || other.role == role)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.isStartingItem, isStartingItem) || other.isStartingItem == isStartingItem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clothingType,color,role,isRequired,isStartingItem);

@override
String toString() {
  return 'RecommendedItem(clothingType: $clothingType, color: $color, role: $role, isRequired: $isRequired, isStartingItem: $isStartingItem)';
}


}

/// @nodoc
abstract mixin class _$RecommendedItemCopyWith<$Res> implements $RecommendedItemCopyWith<$Res> {
  factory _$RecommendedItemCopyWith(_RecommendedItem value, $Res Function(_RecommendedItem) _then) = __$RecommendedItemCopyWithImpl;
@override @useResult
$Res call({
 CatalogRef clothingType, ColorRef color, PieceRole role, bool isRequired, bool isStartingItem
});


@override $CatalogRefCopyWith<$Res> get clothingType;@override $ColorRefCopyWith<$Res> get color;

}
/// @nodoc
class __$RecommendedItemCopyWithImpl<$Res>
    implements _$RecommendedItemCopyWith<$Res> {
  __$RecommendedItemCopyWithImpl(this._self, this._then);

  final _RecommendedItem _self;
  final $Res Function(_RecommendedItem) _then;

/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clothingType = null,Object? color = null,Object? role = null,Object? isRequired = null,Object? isStartingItem = null,}) {
  return _then(_RecommendedItem(
clothingType: null == clothingType ? _self.clothingType : clothingType // ignore: cast_nullable_to_non_nullable
as CatalogRef,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as ColorRef,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as PieceRole,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,isStartingItem: null == isStartingItem ? _self.isStartingItem : isStartingItem // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogRefCopyWith<$Res> get clothingType {
  
  return $CatalogRefCopyWith<$Res>(_self.clothingType, (value) {
    return _then(_self.copyWith(clothingType: value));
  });
}/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ColorRefCopyWith<$Res> get color {
  
  return $ColorRefCopyWith<$Res>(_self.color, (value) {
    return _then(_self.copyWith(color: value));
  });
}
}


/// @nodoc
mixin _$RecommendedLook {

@IdConverter() String get outfitId; String get title; int get score; ScoreBreakdown get scoreBreakdown; String get explanation; List<RecommendedItem> get items; LookImage? get image;
/// Create a copy of RecommendedLook
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendedLookCopyWith<RecommendedLook> get copyWith => _$RecommendedLookCopyWithImpl<RecommendedLook>(this as RecommendedLook, _$identity);

  /// Serializes this RecommendedLook to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendedLook&&(identical(other.outfitId, outfitId) || other.outfitId == outfitId)&&(identical(other.title, title) || other.title == title)&&(identical(other.score, score) || other.score == score)&&(identical(other.scoreBreakdown, scoreBreakdown) || other.scoreBreakdown == scoreBreakdown)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,outfitId,title,score,scoreBreakdown,explanation,const DeepCollectionEquality().hash(items),image);

@override
String toString() {
  return 'RecommendedLook(outfitId: $outfitId, title: $title, score: $score, scoreBreakdown: $scoreBreakdown, explanation: $explanation, items: $items, image: $image)';
}


}

/// @nodoc
abstract mixin class $RecommendedLookCopyWith<$Res>  {
  factory $RecommendedLookCopyWith(RecommendedLook value, $Res Function(RecommendedLook) _then) = _$RecommendedLookCopyWithImpl;
@useResult
$Res call({
@IdConverter() String outfitId, String title, int score, ScoreBreakdown scoreBreakdown, String explanation, List<RecommendedItem> items, LookImage? image
});


$ScoreBreakdownCopyWith<$Res> get scoreBreakdown;$LookImageCopyWith<$Res>? get image;

}
/// @nodoc
class _$RecommendedLookCopyWithImpl<$Res>
    implements $RecommendedLookCopyWith<$Res> {
  _$RecommendedLookCopyWithImpl(this._self, this._then);

  final RecommendedLook _self;
  final $Res Function(RecommendedLook) _then;

/// Create a copy of RecommendedLook
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? outfitId = null,Object? title = null,Object? score = null,Object? scoreBreakdown = null,Object? explanation = null,Object? items = null,Object? image = freezed,}) {
  return _then(RecommendedLook(
outfitId: null == outfitId ? _self.outfitId : outfitId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,scoreBreakdown: null == scoreBreakdown ? _self.scoreBreakdown : scoreBreakdown // ignore: cast_nullable_to_non_nullable
as ScoreBreakdown,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<RecommendedItem>,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as LookImage?,
  ));
}
/// Create a copy of RecommendedLook
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScoreBreakdownCopyWith<$Res> get scoreBreakdown {
  
  return $ScoreBreakdownCopyWith<$Res>(_self.scoreBreakdown, (value) {
    return _then(_self.copyWith(scoreBreakdown: value));
  });
}/// Create a copy of RecommendedLook
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LookImageCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $LookImageCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}


/// Adds pattern-matching-related methods to [RecommendedLook].
extension RecommendedLookPatterns on RecommendedLook {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendedLook value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendedLook() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendedLook value)  $default,){
final _that = this;
switch (_that) {
case _RecommendedLook():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendedLook value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendedLook() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String outfitId,  String title,  int score,  ScoreBreakdown scoreBreakdown,  String explanation,  List<RecommendedItem> items,  LookImage? image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendedLook() when $default != null:
return $default(_that.outfitId,_that.title,_that.score,_that.scoreBreakdown,_that.explanation,_that.items,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String outfitId,  String title,  int score,  ScoreBreakdown scoreBreakdown,  String explanation,  List<RecommendedItem> items,  LookImage? image)  $default,) {final _that = this;
switch (_that) {
case _RecommendedLook():
return $default(_that.outfitId,_that.title,_that.score,_that.scoreBreakdown,_that.explanation,_that.items,_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String outfitId,  String title,  int score,  ScoreBreakdown scoreBreakdown,  String explanation,  List<RecommendedItem> items,  LookImage? image)?  $default,) {final _that = this;
switch (_that) {
case _RecommendedLook() when $default != null:
return $default(_that.outfitId,_that.title,_that.score,_that.scoreBreakdown,_that.explanation,_that.items,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendedLook implements RecommendedLook {
  const _RecommendedLook({@IdConverter() required this.outfitId, required this.title, required this.score, required this.scoreBreakdown, required this.explanation, required  List<RecommendedItem> items, this.image}): _items = items;
  factory _RecommendedLook.fromJson(Map<String, dynamic> json) => _$RecommendedLookFromJson(json);

@override@IdConverter() final  String outfitId;
@override final  String title;
@override final  int score;
@override final  ScoreBreakdown scoreBreakdown;
@override final  String explanation;
 final  List<RecommendedItem> _items;
@override List<RecommendedItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  LookImage? image;

/// Create a copy of RecommendedLook
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendedLookCopyWith<_RecommendedLook> get copyWith => __$RecommendedLookCopyWithImpl<_RecommendedLook>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendedLookToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendedLook&&(identical(other.outfitId, outfitId) || other.outfitId == outfitId)&&(identical(other.title, title) || other.title == title)&&(identical(other.score, score) || other.score == score)&&(identical(other.scoreBreakdown, scoreBreakdown) || other.scoreBreakdown == scoreBreakdown)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,outfitId,title,score,scoreBreakdown,explanation,const DeepCollectionEquality().hash(_items),image);

@override
String toString() {
  return 'RecommendedLook(outfitId: $outfitId, title: $title, score: $score, scoreBreakdown: $scoreBreakdown, explanation: $explanation, items: $items, image: $image)';
}


}

/// @nodoc
abstract mixin class _$RecommendedLookCopyWith<$Res> implements $RecommendedLookCopyWith<$Res> {
  factory _$RecommendedLookCopyWith(_RecommendedLook value, $Res Function(_RecommendedLook) _then) = __$RecommendedLookCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String outfitId, String title, int score, ScoreBreakdown scoreBreakdown, String explanation, List<RecommendedItem> items, LookImage? image
});


@override $ScoreBreakdownCopyWith<$Res> get scoreBreakdown;@override $LookImageCopyWith<$Res>? get image;

}
/// @nodoc
class __$RecommendedLookCopyWithImpl<$Res>
    implements _$RecommendedLookCopyWith<$Res> {
  __$RecommendedLookCopyWithImpl(this._self, this._then);

  final _RecommendedLook _self;
  final $Res Function(_RecommendedLook) _then;

/// Create a copy of RecommendedLook
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? outfitId = null,Object? title = null,Object? score = null,Object? scoreBreakdown = null,Object? explanation = null,Object? items = null,Object? image = freezed,}) {
  return _then(_RecommendedLook(
outfitId: null == outfitId ? _self.outfitId : outfitId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,scoreBreakdown: null == scoreBreakdown ? _self.scoreBreakdown : scoreBreakdown // ignore: cast_nullable_to_non_nullable
as ScoreBreakdown,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<RecommendedItem>,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as LookImage?,
  ));
}

/// Create a copy of RecommendedLook
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScoreBreakdownCopyWith<$Res> get scoreBreakdown {
  
  return $ScoreBreakdownCopyWith<$Res>(_self.scoreBreakdown, (value) {
    return _then(_self.copyWith(scoreBreakdown: value));
  });
}/// Create a copy of RecommendedLook
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LookImageCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $LookImageCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}


/// @nodoc
mixin _$ColorAdvice {

 String get text;@IdListConverter() List<String> get colorIds;
/// Create a copy of ColorAdvice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ColorAdviceCopyWith<ColorAdvice> get copyWith => _$ColorAdviceCopyWithImpl<ColorAdvice>(this as ColorAdvice, _$identity);

  /// Serializes this ColorAdvice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColorAdvice&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.colorIds, colorIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,const DeepCollectionEquality().hash(colorIds));

@override
String toString() {
  return 'ColorAdvice(text: $text, colorIds: $colorIds)';
}


}

/// @nodoc
abstract mixin class $ColorAdviceCopyWith<$Res>  {
  factory $ColorAdviceCopyWith(ColorAdvice value, $Res Function(ColorAdvice) _then) = _$ColorAdviceCopyWithImpl;
@useResult
$Res call({
 String text,@IdListConverter() List<String> colorIds
});




}
/// @nodoc
class _$ColorAdviceCopyWithImpl<$Res>
    implements $ColorAdviceCopyWith<$Res> {
  _$ColorAdviceCopyWithImpl(this._self, this._then);

  final ColorAdvice _self;
  final $Res Function(ColorAdvice) _then;

/// Create a copy of ColorAdvice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? colorIds = null,}) {
  return _then(ColorAdvice(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,colorIds: null == colorIds ? _self.colorIds : colorIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ColorAdvice].
extension ColorAdvicePatterns on ColorAdvice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ColorAdvice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ColorAdvice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ColorAdvice value)  $default,){
final _that = this;
switch (_that) {
case _ColorAdvice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ColorAdvice value)?  $default,){
final _that = this;
switch (_that) {
case _ColorAdvice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text, @IdListConverter()  List<String> colorIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ColorAdvice() when $default != null:
return $default(_that.text,_that.colorIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text, @IdListConverter()  List<String> colorIds)  $default,) {final _that = this;
switch (_that) {
case _ColorAdvice():
return $default(_that.text,_that.colorIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text, @IdListConverter()  List<String> colorIds)?  $default,) {final _that = this;
switch (_that) {
case _ColorAdvice() when $default != null:
return $default(_that.text,_that.colorIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ColorAdvice implements ColorAdvice {
  const _ColorAdvice({required this.text, @IdListConverter()  List<String> colorIds = const []}): _colorIds = colorIds;
  factory _ColorAdvice.fromJson(Map<String, dynamic> json) => _$ColorAdviceFromJson(json);

@override final  String text;
 final  List<String> _colorIds;
@override@JsonKey()@IdListConverter() List<String> get colorIds {
  if (_colorIds is EqualUnmodifiableListView) return _colorIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_colorIds);
}


/// Create a copy of ColorAdvice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ColorAdviceCopyWith<_ColorAdvice> get copyWith => __$ColorAdviceCopyWithImpl<_ColorAdvice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ColorAdviceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ColorAdvice&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other._colorIds, _colorIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,const DeepCollectionEquality().hash(_colorIds));

@override
String toString() {
  return 'ColorAdvice(text: $text, colorIds: $colorIds)';
}


}

/// @nodoc
abstract mixin class _$ColorAdviceCopyWith<$Res> implements $ColorAdviceCopyWith<$Res> {
  factory _$ColorAdviceCopyWith(_ColorAdvice value, $Res Function(_ColorAdvice) _then) = __$ColorAdviceCopyWithImpl;
@override @useResult
$Res call({
 String text,@IdListConverter() List<String> colorIds
});




}
/// @nodoc
class __$ColorAdviceCopyWithImpl<$Res>
    implements _$ColorAdviceCopyWith<$Res> {
  __$ColorAdviceCopyWithImpl(this._self, this._then);

  final _ColorAdvice _self;
  final $Res Function(_ColorAdvice) _then;

/// Create a copy of ColorAdvice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? colorIds = null,}) {
  return _then(_ColorAdvice(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,colorIds: null == colorIds ? _self._colorIds : colorIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$FromItemResponse {

 String get requestId; int get catalogVersion; int get rulesVersion; StartingItem get startingItem; AppliedFilters get filters; Broadening get broadened; List<RecommendedLook> get results; List<ColorAdvice> get advice;@JsonKey(includeFromJson: false, includeToJson: false) DateTime? get cachedAt;
/// Create a copy of FromItemResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FromItemResponseCopyWith<FromItemResponse> get copyWith => _$FromItemResponseCopyWithImpl<FromItemResponse>(this as FromItemResponse, _$identity);

  /// Serializes this FromItemResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FromItemResponse&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.catalogVersion, catalogVersion) || other.catalogVersion == catalogVersion)&&(identical(other.rulesVersion, rulesVersion) || other.rulesVersion == rulesVersion)&&(identical(other.startingItem, startingItem) || other.startingItem == startingItem)&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.broadened, broadened) || other.broadened == broadened)&&const DeepCollectionEquality().equals(other.results, results)&&const DeepCollectionEquality().equals(other.advice, advice)&&(identical(other.cachedAt, cachedAt) || other.cachedAt == cachedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,catalogVersion,rulesVersion,startingItem,filters,broadened,const DeepCollectionEquality().hash(results),const DeepCollectionEquality().hash(advice),cachedAt);

@override
String toString() {
  return 'FromItemResponse(requestId: $requestId, catalogVersion: $catalogVersion, rulesVersion: $rulesVersion, startingItem: $startingItem, filters: $filters, broadened: $broadened, results: $results, advice: $advice, cachedAt: $cachedAt)';
}


}

/// @nodoc
abstract mixin class $FromItemResponseCopyWith<$Res>  {
  factory $FromItemResponseCopyWith(FromItemResponse value, $Res Function(FromItemResponse) _then) = _$FromItemResponseCopyWithImpl;
@useResult
$Res call({
 String requestId, int catalogVersion, int rulesVersion, StartingItem startingItem, AppliedFilters filters, Broadening broadened, List<RecommendedLook> results, List<ColorAdvice> advice,@JsonKey(includeFromJson: false, includeToJson: false) DateTime? cachedAt
});


$StartingItemCopyWith<$Res> get startingItem;$AppliedFiltersCopyWith<$Res> get filters;$BroadeningCopyWith<$Res> get broadened;

}
/// @nodoc
class _$FromItemResponseCopyWithImpl<$Res>
    implements $FromItemResponseCopyWith<$Res> {
  _$FromItemResponseCopyWithImpl(this._self, this._then);

  final FromItemResponse _self;
  final $Res Function(FromItemResponse) _then;

/// Create a copy of FromItemResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? catalogVersion = null,Object? rulesVersion = null,Object? startingItem = null,Object? filters = null,Object? broadened = null,Object? results = null,Object? advice = null,Object? cachedAt = freezed,}) {
  return _then(FromItemResponse(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,catalogVersion: null == catalogVersion ? _self.catalogVersion : catalogVersion // ignore: cast_nullable_to_non_nullable
as int,rulesVersion: null == rulesVersion ? _self.rulesVersion : rulesVersion // ignore: cast_nullable_to_non_nullable
as int,startingItem: null == startingItem ? _self.startingItem : startingItem // ignore: cast_nullable_to_non_nullable
as StartingItem,filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as AppliedFilters,broadened: null == broadened ? _self.broadened : broadened // ignore: cast_nullable_to_non_nullable
as Broadening,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<RecommendedLook>,advice: null == advice ? _self.advice : advice // ignore: cast_nullable_to_non_nullable
as List<ColorAdvice>,cachedAt: freezed == cachedAt ? _self.cachedAt : cachedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of FromItemResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StartingItemCopyWith<$Res> get startingItem {
  
  return $StartingItemCopyWith<$Res>(_self.startingItem, (value) {
    return _then(_self.copyWith(startingItem: value));
  });
}/// Create a copy of FromItemResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppliedFiltersCopyWith<$Res> get filters {
  
  return $AppliedFiltersCopyWith<$Res>(_self.filters, (value) {
    return _then(_self.copyWith(filters: value));
  });
}/// Create a copy of FromItemResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BroadeningCopyWith<$Res> get broadened {
  
  return $BroadeningCopyWith<$Res>(_self.broadened, (value) {
    return _then(_self.copyWith(broadened: value));
  });
}
}


/// Adds pattern-matching-related methods to [FromItemResponse].
extension FromItemResponsePatterns on FromItemResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FromItemResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FromItemResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FromItemResponse value)  $default,){
final _that = this;
switch (_that) {
case _FromItemResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FromItemResponse value)?  $default,){
final _that = this;
switch (_that) {
case _FromItemResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String requestId,  int catalogVersion,  int rulesVersion,  StartingItem startingItem,  AppliedFilters filters,  Broadening broadened,  List<RecommendedLook> results,  List<ColorAdvice> advice, @JsonKey(includeFromJson: false, includeToJson: false)  DateTime? cachedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FromItemResponse() when $default != null:
return $default(_that.requestId,_that.catalogVersion,_that.rulesVersion,_that.startingItem,_that.filters,_that.broadened,_that.results,_that.advice,_that.cachedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String requestId,  int catalogVersion,  int rulesVersion,  StartingItem startingItem,  AppliedFilters filters,  Broadening broadened,  List<RecommendedLook> results,  List<ColorAdvice> advice, @JsonKey(includeFromJson: false, includeToJson: false)  DateTime? cachedAt)  $default,) {final _that = this;
switch (_that) {
case _FromItemResponse():
return $default(_that.requestId,_that.catalogVersion,_that.rulesVersion,_that.startingItem,_that.filters,_that.broadened,_that.results,_that.advice,_that.cachedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String requestId,  int catalogVersion,  int rulesVersion,  StartingItem startingItem,  AppliedFilters filters,  Broadening broadened,  List<RecommendedLook> results,  List<ColorAdvice> advice, @JsonKey(includeFromJson: false, includeToJson: false)  DateTime? cachedAt)?  $default,) {final _that = this;
switch (_that) {
case _FromItemResponse() when $default != null:
return $default(_that.requestId,_that.catalogVersion,_that.rulesVersion,_that.startingItem,_that.filters,_that.broadened,_that.results,_that.advice,_that.cachedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FromItemResponse implements FromItemResponse {
  const _FromItemResponse({required this.requestId, required this.catalogVersion, required this.rulesVersion, required this.startingItem, this.filters = const AppliedFilters(), this.broadened = const Broadening(), required  List<RecommendedLook> results,  List<ColorAdvice> advice = const [], @JsonKey(includeFromJson: false, includeToJson: false) this.cachedAt}): _results = results,_advice = advice;
  factory _FromItemResponse.fromJson(Map<String, dynamic> json) => _$FromItemResponseFromJson(json);

@override final  String requestId;
@override final  int catalogVersion;
@override final  int rulesVersion;
@override final  StartingItem startingItem;
@override@JsonKey() final  AppliedFilters filters;
@override@JsonKey() final  Broadening broadened;
 final  List<RecommendedLook> _results;
@override List<RecommendedLook> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

 final  List<ColorAdvice> _advice;
@override@JsonKey() List<ColorAdvice> get advice {
  if (_advice is EqualUnmodifiableListView) return _advice;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_advice);
}

@override@JsonKey(includeFromJson: false, includeToJson: false) final  DateTime? cachedAt;

/// Create a copy of FromItemResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FromItemResponseCopyWith<_FromItemResponse> get copyWith => __$FromItemResponseCopyWithImpl<_FromItemResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FromItemResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FromItemResponse&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.catalogVersion, catalogVersion) || other.catalogVersion == catalogVersion)&&(identical(other.rulesVersion, rulesVersion) || other.rulesVersion == rulesVersion)&&(identical(other.startingItem, startingItem) || other.startingItem == startingItem)&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.broadened, broadened) || other.broadened == broadened)&&const DeepCollectionEquality().equals(other._results, _results)&&const DeepCollectionEquality().equals(other._advice, _advice)&&(identical(other.cachedAt, cachedAt) || other.cachedAt == cachedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,catalogVersion,rulesVersion,startingItem,filters,broadened,const DeepCollectionEquality().hash(_results),const DeepCollectionEquality().hash(_advice),cachedAt);

@override
String toString() {
  return 'FromItemResponse(requestId: $requestId, catalogVersion: $catalogVersion, rulesVersion: $rulesVersion, startingItem: $startingItem, filters: $filters, broadened: $broadened, results: $results, advice: $advice, cachedAt: $cachedAt)';
}


}

/// @nodoc
abstract mixin class _$FromItemResponseCopyWith<$Res> implements $FromItemResponseCopyWith<$Res> {
  factory _$FromItemResponseCopyWith(_FromItemResponse value, $Res Function(_FromItemResponse) _then) = __$FromItemResponseCopyWithImpl;
@override @useResult
$Res call({
 String requestId, int catalogVersion, int rulesVersion, StartingItem startingItem, AppliedFilters filters, Broadening broadened, List<RecommendedLook> results, List<ColorAdvice> advice,@JsonKey(includeFromJson: false, includeToJson: false) DateTime? cachedAt
});


@override $StartingItemCopyWith<$Res> get startingItem;@override $AppliedFiltersCopyWith<$Res> get filters;@override $BroadeningCopyWith<$Res> get broadened;

}
/// @nodoc
class __$FromItemResponseCopyWithImpl<$Res>
    implements _$FromItemResponseCopyWith<$Res> {
  __$FromItemResponseCopyWithImpl(this._self, this._then);

  final _FromItemResponse _self;
  final $Res Function(_FromItemResponse) _then;

/// Create a copy of FromItemResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? catalogVersion = null,Object? rulesVersion = null,Object? startingItem = null,Object? filters = null,Object? broadened = null,Object? results = null,Object? advice = null,Object? cachedAt = freezed,}) {
  return _then(_FromItemResponse(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,catalogVersion: null == catalogVersion ? _self.catalogVersion : catalogVersion // ignore: cast_nullable_to_non_nullable
as int,rulesVersion: null == rulesVersion ? _self.rulesVersion : rulesVersion // ignore: cast_nullable_to_non_nullable
as int,startingItem: null == startingItem ? _self.startingItem : startingItem // ignore: cast_nullable_to_non_nullable
as StartingItem,filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as AppliedFilters,broadened: null == broadened ? _self.broadened : broadened // ignore: cast_nullable_to_non_nullable
as Broadening,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<RecommendedLook>,advice: null == advice ? _self._advice : advice // ignore: cast_nullable_to_non_nullable
as List<ColorAdvice>,cachedAt: freezed == cachedAt ? _self.cachedAt : cachedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of FromItemResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StartingItemCopyWith<$Res> get startingItem {
  
  return $StartingItemCopyWith<$Res>(_self.startingItem, (value) {
    return _then(_self.copyWith(startingItem: value));
  });
}/// Create a copy of FromItemResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppliedFiltersCopyWith<$Res> get filters {
  
  return $AppliedFiltersCopyWith<$Res>(_self.filters, (value) {
    return _then(_self.copyWith(filters: value));
  });
}/// Create a copy of FromItemResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BroadeningCopyWith<$Res> get broadened {
  
  return $BroadeningCopyWith<$Res>(_self.broadened, (value) {
    return _then(_self.copyWith(broadened: value));
  });
}
}


/// @nodoc
mixin _$TextNote {

 String get text;
/// Create a copy of TextNote
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextNoteCopyWith<TextNote> get copyWith => _$TextNoteCopyWithImpl<TextNote>(this as TextNote, _$identity);

  /// Serializes this TextNote to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextNote&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'TextNote(text: $text)';
}


}

/// @nodoc
abstract mixin class $TextNoteCopyWith<$Res>  {
  factory $TextNoteCopyWith(TextNote value, $Res Function(TextNote) _then) = _$TextNoteCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$TextNoteCopyWithImpl<$Res>
    implements $TextNoteCopyWith<$Res> {
  _$TextNoteCopyWithImpl(this._self, this._then);

  final TextNote _self;
  final $Res Function(TextNote) _then;

/// Create a copy of TextNote
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,}) {
  return _then(TextNote(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TextNote].
extension TextNotePatterns on TextNote {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TextNote value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TextNote() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TextNote value)  $default,){
final _that = this;
switch (_that) {
case _TextNote():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TextNote value)?  $default,){
final _that = this;
switch (_that) {
case _TextNote() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TextNote() when $default != null:
return $default(_that.text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text)  $default,) {final _that = this;
switch (_that) {
case _TextNote():
return $default(_that.text);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text)?  $default,) {final _that = this;
switch (_that) {
case _TextNote() when $default != null:
return $default(_that.text);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TextNote implements TextNote {
  const _TextNote({required this.text});
  factory _TextNote.fromJson(Map<String, dynamic> json) => _$TextNoteFromJson(json);

@override final  String text;

/// Create a copy of TextNote
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TextNoteCopyWith<_TextNote> get copyWith => __$TextNoteCopyWithImpl<_TextNote>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TextNoteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TextNote&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'TextNote(text: $text)';
}


}

/// @nodoc
abstract mixin class _$TextNoteCopyWith<$Res> implements $TextNoteCopyWith<$Res> {
  factory _$TextNoteCopyWith(_TextNote value, $Res Function(_TextNote) _then) = __$TextNoteCopyWithImpl;
@override @useResult
$Res call({
 String text
});




}
/// @nodoc
class __$TextNoteCopyWithImpl<$Res>
    implements _$TextNoteCopyWith<$Res> {
  __$TextNoteCopyWithImpl(this._self, this._then);

  final _TextNote _self;
  final $Res Function(_TextNote) _then;

/// Create a copy of TextNote
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(_TextNote(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$OutfitWarning {

 WarningType get type; String get text; List<int> get itemIndexes;
/// Create a copy of OutfitWarning
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutfitWarningCopyWith<OutfitWarning> get copyWith => _$OutfitWarningCopyWithImpl<OutfitWarning>(this as OutfitWarning, _$identity);

  /// Serializes this OutfitWarning to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutfitWarning&&(identical(other.type, type) || other.type == type)&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.itemIndexes, itemIndexes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,text,const DeepCollectionEquality().hash(itemIndexes));

@override
String toString() {
  return 'OutfitWarning(type: $type, text: $text, itemIndexes: $itemIndexes)';
}


}

/// @nodoc
abstract mixin class $OutfitWarningCopyWith<$Res>  {
  factory $OutfitWarningCopyWith(OutfitWarning value, $Res Function(OutfitWarning) _then) = _$OutfitWarningCopyWithImpl;
@useResult
$Res call({
 WarningType type, String text, List<int> itemIndexes
});




}
/// @nodoc
class _$OutfitWarningCopyWithImpl<$Res>
    implements $OutfitWarningCopyWith<$Res> {
  _$OutfitWarningCopyWithImpl(this._self, this._then);

  final OutfitWarning _self;
  final $Res Function(OutfitWarning) _then;

/// Create a copy of OutfitWarning
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? text = null,Object? itemIndexes = null,}) {
  return _then(OutfitWarning(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as WarningType,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,itemIndexes: null == itemIndexes ? _self.itemIndexes : itemIndexes // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [OutfitWarning].
extension OutfitWarningPatterns on OutfitWarning {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OutfitWarning value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OutfitWarning() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OutfitWarning value)  $default,){
final _that = this;
switch (_that) {
case _OutfitWarning():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OutfitWarning value)?  $default,){
final _that = this;
switch (_that) {
case _OutfitWarning() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WarningType type,  String text,  List<int> itemIndexes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OutfitWarning() when $default != null:
return $default(_that.type,_that.text,_that.itemIndexes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WarningType type,  String text,  List<int> itemIndexes)  $default,) {final _that = this;
switch (_that) {
case _OutfitWarning():
return $default(_that.type,_that.text,_that.itemIndexes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WarningType type,  String text,  List<int> itemIndexes)?  $default,) {final _that = this;
switch (_that) {
case _OutfitWarning() when $default != null:
return $default(_that.type,_that.text,_that.itemIndexes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OutfitWarning implements OutfitWarning {
  const _OutfitWarning({required this.type, required this.text,  List<int> itemIndexes = const []}): _itemIndexes = itemIndexes;
  factory _OutfitWarning.fromJson(Map<String, dynamic> json) => _$OutfitWarningFromJson(json);

@override final  WarningType type;
@override final  String text;
 final  List<int> _itemIndexes;
@override@JsonKey() List<int> get itemIndexes {
  if (_itemIndexes is EqualUnmodifiableListView) return _itemIndexes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_itemIndexes);
}


/// Create a copy of OutfitWarning
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutfitWarningCopyWith<_OutfitWarning> get copyWith => __$OutfitWarningCopyWithImpl<_OutfitWarning>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OutfitWarningToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutfitWarning&&(identical(other.type, type) || other.type == type)&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other._itemIndexes, _itemIndexes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,text,const DeepCollectionEquality().hash(_itemIndexes));

@override
String toString() {
  return 'OutfitWarning(type: $type, text: $text, itemIndexes: $itemIndexes)';
}


}

/// @nodoc
abstract mixin class _$OutfitWarningCopyWith<$Res> implements $OutfitWarningCopyWith<$Res> {
  factory _$OutfitWarningCopyWith(_OutfitWarning value, $Res Function(_OutfitWarning) _then) = __$OutfitWarningCopyWithImpl;
@override @useResult
$Res call({
 WarningType type, String text, List<int> itemIndexes
});




}
/// @nodoc
class __$OutfitWarningCopyWithImpl<$Res>
    implements _$OutfitWarningCopyWith<$Res> {
  __$OutfitWarningCopyWithImpl(this._self, this._then);

  final _OutfitWarning _self;
  final $Res Function(_OutfitWarning) _then;

/// Create a copy of OutfitWarning
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? text = null,Object? itemIndexes = null,}) {
  return _then(_OutfitWarning(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as WarningType,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,itemIndexes: null == itemIndexes ? _self._itemIndexes : itemIndexes // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}


/// @nodoc
mixin _$EvaluationResponse {

 String get requestId; int get catalogVersion; int get rulesVersion; int get score; ScoreBreakdown get scoreBreakdown; bool get isComplete; List<TextNote> get strengths; List<OutfitWarning> get warnings; List<TextNote> get suggestions;@JsonKey(includeFromJson: false, includeToJson: false) DateTime? get cachedAt;
/// Create a copy of EvaluationResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EvaluationResponseCopyWith<EvaluationResponse> get copyWith => _$EvaluationResponseCopyWithImpl<EvaluationResponse>(this as EvaluationResponse, _$identity);

  /// Serializes this EvaluationResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EvaluationResponse&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.catalogVersion, catalogVersion) || other.catalogVersion == catalogVersion)&&(identical(other.rulesVersion, rulesVersion) || other.rulesVersion == rulesVersion)&&(identical(other.score, score) || other.score == score)&&(identical(other.scoreBreakdown, scoreBreakdown) || other.scoreBreakdown == scoreBreakdown)&&(identical(other.isComplete, isComplete) || other.isComplete == isComplete)&&const DeepCollectionEquality().equals(other.strengths, strengths)&&const DeepCollectionEquality().equals(other.warnings, warnings)&&const DeepCollectionEquality().equals(other.suggestions, suggestions)&&(identical(other.cachedAt, cachedAt) || other.cachedAt == cachedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,catalogVersion,rulesVersion,score,scoreBreakdown,isComplete,const DeepCollectionEquality().hash(strengths),const DeepCollectionEquality().hash(warnings),const DeepCollectionEquality().hash(suggestions),cachedAt);

@override
String toString() {
  return 'EvaluationResponse(requestId: $requestId, catalogVersion: $catalogVersion, rulesVersion: $rulesVersion, score: $score, scoreBreakdown: $scoreBreakdown, isComplete: $isComplete, strengths: $strengths, warnings: $warnings, suggestions: $suggestions, cachedAt: $cachedAt)';
}


}

/// @nodoc
abstract mixin class $EvaluationResponseCopyWith<$Res>  {
  factory $EvaluationResponseCopyWith(EvaluationResponse value, $Res Function(EvaluationResponse) _then) = _$EvaluationResponseCopyWithImpl;
@useResult
$Res call({
 String requestId, int catalogVersion, int rulesVersion, int score, ScoreBreakdown scoreBreakdown, bool isComplete, List<TextNote> strengths, List<OutfitWarning> warnings, List<TextNote> suggestions,@JsonKey(includeFromJson: false, includeToJson: false) DateTime? cachedAt
});


$ScoreBreakdownCopyWith<$Res> get scoreBreakdown;

}
/// @nodoc
class _$EvaluationResponseCopyWithImpl<$Res>
    implements $EvaluationResponseCopyWith<$Res> {
  _$EvaluationResponseCopyWithImpl(this._self, this._then);

  final EvaluationResponse _self;
  final $Res Function(EvaluationResponse) _then;

/// Create a copy of EvaluationResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? catalogVersion = null,Object? rulesVersion = null,Object? score = null,Object? scoreBreakdown = null,Object? isComplete = null,Object? strengths = null,Object? warnings = null,Object? suggestions = null,Object? cachedAt = freezed,}) {
  return _then(EvaluationResponse(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,catalogVersion: null == catalogVersion ? _self.catalogVersion : catalogVersion // ignore: cast_nullable_to_non_nullable
as int,rulesVersion: null == rulesVersion ? _self.rulesVersion : rulesVersion // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,scoreBreakdown: null == scoreBreakdown ? _self.scoreBreakdown : scoreBreakdown // ignore: cast_nullable_to_non_nullable
as ScoreBreakdown,isComplete: null == isComplete ? _self.isComplete : isComplete // ignore: cast_nullable_to_non_nullable
as bool,strengths: null == strengths ? _self.strengths : strengths // ignore: cast_nullable_to_non_nullable
as List<TextNote>,warnings: null == warnings ? _self.warnings : warnings // ignore: cast_nullable_to_non_nullable
as List<OutfitWarning>,suggestions: null == suggestions ? _self.suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<TextNote>,cachedAt: freezed == cachedAt ? _self.cachedAt : cachedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of EvaluationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScoreBreakdownCopyWith<$Res> get scoreBreakdown {
  
  return $ScoreBreakdownCopyWith<$Res>(_self.scoreBreakdown, (value) {
    return _then(_self.copyWith(scoreBreakdown: value));
  });
}
}


/// Adds pattern-matching-related methods to [EvaluationResponse].
extension EvaluationResponsePatterns on EvaluationResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EvaluationResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EvaluationResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EvaluationResponse value)  $default,){
final _that = this;
switch (_that) {
case _EvaluationResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EvaluationResponse value)?  $default,){
final _that = this;
switch (_that) {
case _EvaluationResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String requestId,  int catalogVersion,  int rulesVersion,  int score,  ScoreBreakdown scoreBreakdown,  bool isComplete,  List<TextNote> strengths,  List<OutfitWarning> warnings,  List<TextNote> suggestions, @JsonKey(includeFromJson: false, includeToJson: false)  DateTime? cachedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EvaluationResponse() when $default != null:
return $default(_that.requestId,_that.catalogVersion,_that.rulesVersion,_that.score,_that.scoreBreakdown,_that.isComplete,_that.strengths,_that.warnings,_that.suggestions,_that.cachedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String requestId,  int catalogVersion,  int rulesVersion,  int score,  ScoreBreakdown scoreBreakdown,  bool isComplete,  List<TextNote> strengths,  List<OutfitWarning> warnings,  List<TextNote> suggestions, @JsonKey(includeFromJson: false, includeToJson: false)  DateTime? cachedAt)  $default,) {final _that = this;
switch (_that) {
case _EvaluationResponse():
return $default(_that.requestId,_that.catalogVersion,_that.rulesVersion,_that.score,_that.scoreBreakdown,_that.isComplete,_that.strengths,_that.warnings,_that.suggestions,_that.cachedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String requestId,  int catalogVersion,  int rulesVersion,  int score,  ScoreBreakdown scoreBreakdown,  bool isComplete,  List<TextNote> strengths,  List<OutfitWarning> warnings,  List<TextNote> suggestions, @JsonKey(includeFromJson: false, includeToJson: false)  DateTime? cachedAt)?  $default,) {final _that = this;
switch (_that) {
case _EvaluationResponse() when $default != null:
return $default(_that.requestId,_that.catalogVersion,_that.rulesVersion,_that.score,_that.scoreBreakdown,_that.isComplete,_that.strengths,_that.warnings,_that.suggestions,_that.cachedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EvaluationResponse implements EvaluationResponse {
  const _EvaluationResponse({required this.requestId, required this.catalogVersion, required this.rulesVersion, required this.score, required this.scoreBreakdown, this.isComplete = false,  List<TextNote> strengths = const [],  List<OutfitWarning> warnings = const [],  List<TextNote> suggestions = const [], @JsonKey(includeFromJson: false, includeToJson: false) this.cachedAt}): _strengths = strengths,_warnings = warnings,_suggestions = suggestions;
  factory _EvaluationResponse.fromJson(Map<String, dynamic> json) => _$EvaluationResponseFromJson(json);

@override final  String requestId;
@override final  int catalogVersion;
@override final  int rulesVersion;
@override final  int score;
@override final  ScoreBreakdown scoreBreakdown;
@override@JsonKey() final  bool isComplete;
 final  List<TextNote> _strengths;
@override@JsonKey() List<TextNote> get strengths {
  if (_strengths is EqualUnmodifiableListView) return _strengths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_strengths);
}

 final  List<OutfitWarning> _warnings;
@override@JsonKey() List<OutfitWarning> get warnings {
  if (_warnings is EqualUnmodifiableListView) return _warnings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_warnings);
}

 final  List<TextNote> _suggestions;
@override@JsonKey() List<TextNote> get suggestions {
  if (_suggestions is EqualUnmodifiableListView) return _suggestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestions);
}

@override@JsonKey(includeFromJson: false, includeToJson: false) final  DateTime? cachedAt;

/// Create a copy of EvaluationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EvaluationResponseCopyWith<_EvaluationResponse> get copyWith => __$EvaluationResponseCopyWithImpl<_EvaluationResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EvaluationResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EvaluationResponse&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.catalogVersion, catalogVersion) || other.catalogVersion == catalogVersion)&&(identical(other.rulesVersion, rulesVersion) || other.rulesVersion == rulesVersion)&&(identical(other.score, score) || other.score == score)&&(identical(other.scoreBreakdown, scoreBreakdown) || other.scoreBreakdown == scoreBreakdown)&&(identical(other.isComplete, isComplete) || other.isComplete == isComplete)&&const DeepCollectionEquality().equals(other._strengths, _strengths)&&const DeepCollectionEquality().equals(other._warnings, _warnings)&&const DeepCollectionEquality().equals(other._suggestions, _suggestions)&&(identical(other.cachedAt, cachedAt) || other.cachedAt == cachedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,catalogVersion,rulesVersion,score,scoreBreakdown,isComplete,const DeepCollectionEquality().hash(_strengths),const DeepCollectionEquality().hash(_warnings),const DeepCollectionEquality().hash(_suggestions),cachedAt);

@override
String toString() {
  return 'EvaluationResponse(requestId: $requestId, catalogVersion: $catalogVersion, rulesVersion: $rulesVersion, score: $score, scoreBreakdown: $scoreBreakdown, isComplete: $isComplete, strengths: $strengths, warnings: $warnings, suggestions: $suggestions, cachedAt: $cachedAt)';
}


}

/// @nodoc
abstract mixin class _$EvaluationResponseCopyWith<$Res> implements $EvaluationResponseCopyWith<$Res> {
  factory _$EvaluationResponseCopyWith(_EvaluationResponse value, $Res Function(_EvaluationResponse) _then) = __$EvaluationResponseCopyWithImpl;
@override @useResult
$Res call({
 String requestId, int catalogVersion, int rulesVersion, int score, ScoreBreakdown scoreBreakdown, bool isComplete, List<TextNote> strengths, List<OutfitWarning> warnings, List<TextNote> suggestions,@JsonKey(includeFromJson: false, includeToJson: false) DateTime? cachedAt
});


@override $ScoreBreakdownCopyWith<$Res> get scoreBreakdown;

}
/// @nodoc
class __$EvaluationResponseCopyWithImpl<$Res>
    implements _$EvaluationResponseCopyWith<$Res> {
  __$EvaluationResponseCopyWithImpl(this._self, this._then);

  final _EvaluationResponse _self;
  final $Res Function(_EvaluationResponse) _then;

/// Create a copy of EvaluationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? catalogVersion = null,Object? rulesVersion = null,Object? score = null,Object? scoreBreakdown = null,Object? isComplete = null,Object? strengths = null,Object? warnings = null,Object? suggestions = null,Object? cachedAt = freezed,}) {
  return _then(_EvaluationResponse(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,catalogVersion: null == catalogVersion ? _self.catalogVersion : catalogVersion // ignore: cast_nullable_to_non_nullable
as int,rulesVersion: null == rulesVersion ? _self.rulesVersion : rulesVersion // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,scoreBreakdown: null == scoreBreakdown ? _self.scoreBreakdown : scoreBreakdown // ignore: cast_nullable_to_non_nullable
as ScoreBreakdown,isComplete: null == isComplete ? _self.isComplete : isComplete // ignore: cast_nullable_to_non_nullable
as bool,strengths: null == strengths ? _self._strengths : strengths // ignore: cast_nullable_to_non_nullable
as List<TextNote>,warnings: null == warnings ? _self._warnings : warnings // ignore: cast_nullable_to_non_nullable
as List<OutfitWarning>,suggestions: null == suggestions ? _self._suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<TextNote>,cachedAt: freezed == cachedAt ? _self.cachedAt : cachedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of EvaluationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScoreBreakdownCopyWith<$Res> get scoreBreakdown {
  
  return $ScoreBreakdownCopyWith<$Res>(_self.scoreBreakdown, (value) {
    return _then(_self.copyWith(scoreBreakdown: value));
  });
}
}


/// @nodoc
mixin _$OutfitChange {

 ChangeAction get action; int? get itemIndex; RequestItem? get item;
/// Create a copy of OutfitChange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutfitChangeCopyWith<OutfitChange> get copyWith => _$OutfitChangeCopyWithImpl<OutfitChange>(this as OutfitChange, _$identity);

  /// Serializes this OutfitChange to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutfitChange&&(identical(other.action, action) || other.action == action)&&(identical(other.itemIndex, itemIndex) || other.itemIndex == itemIndex)&&(identical(other.item, item) || other.item == item));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,action,itemIndex,item);

@override
String toString() {
  return 'OutfitChange(action: $action, itemIndex: $itemIndex, item: $item)';
}


}

/// @nodoc
abstract mixin class $OutfitChangeCopyWith<$Res>  {
  factory $OutfitChangeCopyWith(OutfitChange value, $Res Function(OutfitChange) _then) = _$OutfitChangeCopyWithImpl;
@useResult
$Res call({
 ChangeAction action, int? itemIndex, RequestItem? item
});


$RequestItemCopyWith<$Res>? get item;

}
/// @nodoc
class _$OutfitChangeCopyWithImpl<$Res>
    implements $OutfitChangeCopyWith<$Res> {
  _$OutfitChangeCopyWithImpl(this._self, this._then);

  final OutfitChange _self;
  final $Res Function(OutfitChange) _then;

/// Create a copy of OutfitChange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? action = null,Object? itemIndex = freezed,Object? item = freezed,}) {
  return _then(OutfitChange(
action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as ChangeAction,itemIndex: freezed == itemIndex ? _self.itemIndex : itemIndex // ignore: cast_nullable_to_non_nullable
as int?,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as RequestItem?,
  ));
}
/// Create a copy of OutfitChange
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestItemCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $RequestItemCopyWith<$Res>(_self.item!, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// Adds pattern-matching-related methods to [OutfitChange].
extension OutfitChangePatterns on OutfitChange {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OutfitChange value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OutfitChange() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OutfitChange value)  $default,){
final _that = this;
switch (_that) {
case _OutfitChange():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OutfitChange value)?  $default,){
final _that = this;
switch (_that) {
case _OutfitChange() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChangeAction action,  int? itemIndex,  RequestItem? item)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OutfitChange() when $default != null:
return $default(_that.action,_that.itemIndex,_that.item);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChangeAction action,  int? itemIndex,  RequestItem? item)  $default,) {final _that = this;
switch (_that) {
case _OutfitChange():
return $default(_that.action,_that.itemIndex,_that.item);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChangeAction action,  int? itemIndex,  RequestItem? item)?  $default,) {final _that = this;
switch (_that) {
case _OutfitChange() when $default != null:
return $default(_that.action,_that.itemIndex,_that.item);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OutfitChange implements OutfitChange {
  const _OutfitChange({required this.action, this.itemIndex, this.item});
  factory _OutfitChange.fromJson(Map<String, dynamic> json) => _$OutfitChangeFromJson(json);

@override final  ChangeAction action;
@override final  int? itemIndex;
@override final  RequestItem? item;

/// Create a copy of OutfitChange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutfitChangeCopyWith<_OutfitChange> get copyWith => __$OutfitChangeCopyWithImpl<_OutfitChange>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OutfitChangeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutfitChange&&(identical(other.action, action) || other.action == action)&&(identical(other.itemIndex, itemIndex) || other.itemIndex == itemIndex)&&(identical(other.item, item) || other.item == item));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,action,itemIndex,item);

@override
String toString() {
  return 'OutfitChange(action: $action, itemIndex: $itemIndex, item: $item)';
}


}

/// @nodoc
abstract mixin class _$OutfitChangeCopyWith<$Res> implements $OutfitChangeCopyWith<$Res> {
  factory _$OutfitChangeCopyWith(_OutfitChange value, $Res Function(_OutfitChange) _then) = __$OutfitChangeCopyWithImpl;
@override @useResult
$Res call({
 ChangeAction action, int? itemIndex, RequestItem? item
});


@override $RequestItemCopyWith<$Res>? get item;

}
/// @nodoc
class __$OutfitChangeCopyWithImpl<$Res>
    implements _$OutfitChangeCopyWith<$Res> {
  __$OutfitChangeCopyWithImpl(this._self, this._then);

  final _OutfitChange _self;
  final $Res Function(_OutfitChange) _then;

/// Create a copy of OutfitChange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? action = null,Object? itemIndex = freezed,Object? item = freezed,}) {
  return _then(_OutfitChange(
action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as ChangeAction,itemIndex: freezed == itemIndex ? _self.itemIndex : itemIndex // ignore: cast_nullable_to_non_nullable
as int?,item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as RequestItem?,
  ));
}

/// Create a copy of OutfitChange
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestItemCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $RequestItemCopyWith<$Res>(_self.item!, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// @nodoc
mixin _$Improvement {

 String get text; OutfitChange get change; int get resultingScore;
/// Create a copy of Improvement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImprovementCopyWith<Improvement> get copyWith => _$ImprovementCopyWithImpl<Improvement>(this as Improvement, _$identity);

  /// Serializes this Improvement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Improvement&&(identical(other.text, text) || other.text == text)&&(identical(other.change, change) || other.change == change)&&(identical(other.resultingScore, resultingScore) || other.resultingScore == resultingScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,change,resultingScore);

@override
String toString() {
  return 'Improvement(text: $text, change: $change, resultingScore: $resultingScore)';
}


}

/// @nodoc
abstract mixin class $ImprovementCopyWith<$Res>  {
  factory $ImprovementCopyWith(Improvement value, $Res Function(Improvement) _then) = _$ImprovementCopyWithImpl;
@useResult
$Res call({
 String text, OutfitChange change, int resultingScore
});


$OutfitChangeCopyWith<$Res> get change;

}
/// @nodoc
class _$ImprovementCopyWithImpl<$Res>
    implements $ImprovementCopyWith<$Res> {
  _$ImprovementCopyWithImpl(this._self, this._then);

  final Improvement _self;
  final $Res Function(Improvement) _then;

/// Create a copy of Improvement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? change = null,Object? resultingScore = null,}) {
  return _then(Improvement(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,change: null == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as OutfitChange,resultingScore: null == resultingScore ? _self.resultingScore : resultingScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of Improvement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OutfitChangeCopyWith<$Res> get change {
  
  return $OutfitChangeCopyWith<$Res>(_self.change, (value) {
    return _then(_self.copyWith(change: value));
  });
}
}


/// Adds pattern-matching-related methods to [Improvement].
extension ImprovementPatterns on Improvement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Improvement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Improvement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Improvement value)  $default,){
final _that = this;
switch (_that) {
case _Improvement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Improvement value)?  $default,){
final _that = this;
switch (_that) {
case _Improvement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  OutfitChange change,  int resultingScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Improvement() when $default != null:
return $default(_that.text,_that.change,_that.resultingScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  OutfitChange change,  int resultingScore)  $default,) {final _that = this;
switch (_that) {
case _Improvement():
return $default(_that.text,_that.change,_that.resultingScore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  OutfitChange change,  int resultingScore)?  $default,) {final _that = this;
switch (_that) {
case _Improvement() when $default != null:
return $default(_that.text,_that.change,_that.resultingScore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Improvement implements Improvement {
  const _Improvement({required this.text, required this.change, required this.resultingScore});
  factory _Improvement.fromJson(Map<String, dynamic> json) => _$ImprovementFromJson(json);

@override final  String text;
@override final  OutfitChange change;
@override final  int resultingScore;

/// Create a copy of Improvement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImprovementCopyWith<_Improvement> get copyWith => __$ImprovementCopyWithImpl<_Improvement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImprovementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Improvement&&(identical(other.text, text) || other.text == text)&&(identical(other.change, change) || other.change == change)&&(identical(other.resultingScore, resultingScore) || other.resultingScore == resultingScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,change,resultingScore);

@override
String toString() {
  return 'Improvement(text: $text, change: $change, resultingScore: $resultingScore)';
}


}

/// @nodoc
abstract mixin class _$ImprovementCopyWith<$Res> implements $ImprovementCopyWith<$Res> {
  factory _$ImprovementCopyWith(_Improvement value, $Res Function(_Improvement) _then) = __$ImprovementCopyWithImpl;
@override @useResult
$Res call({
 String text, OutfitChange change, int resultingScore
});


@override $OutfitChangeCopyWith<$Res> get change;

}
/// @nodoc
class __$ImprovementCopyWithImpl<$Res>
    implements _$ImprovementCopyWith<$Res> {
  __$ImprovementCopyWithImpl(this._self, this._then);

  final _Improvement _self;
  final $Res Function(_Improvement) _then;

/// Create a copy of Improvement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? change = null,Object? resultingScore = null,}) {
  return _then(_Improvement(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,change: null == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as OutfitChange,resultingScore: null == resultingScore ? _self.resultingScore : resultingScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of Improvement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OutfitChangeCopyWith<$Res> get change {
  
  return $OutfitChangeCopyWith<$Res>(_self.change, (value) {
    return _then(_self.copyWith(change: value));
  });
}
}


/// @nodoc
mixin _$ImprovementResponse {

 String get requestId; int get catalogVersion; int get rulesVersion; int get currentScore; List<Improvement> get improvements;@JsonKey(includeFromJson: false, includeToJson: false) DateTime? get cachedAt;
/// Create a copy of ImprovementResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImprovementResponseCopyWith<ImprovementResponse> get copyWith => _$ImprovementResponseCopyWithImpl<ImprovementResponse>(this as ImprovementResponse, _$identity);

  /// Serializes this ImprovementResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImprovementResponse&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.catalogVersion, catalogVersion) || other.catalogVersion == catalogVersion)&&(identical(other.rulesVersion, rulesVersion) || other.rulesVersion == rulesVersion)&&(identical(other.currentScore, currentScore) || other.currentScore == currentScore)&&const DeepCollectionEquality().equals(other.improvements, improvements)&&(identical(other.cachedAt, cachedAt) || other.cachedAt == cachedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,catalogVersion,rulesVersion,currentScore,const DeepCollectionEquality().hash(improvements),cachedAt);

@override
String toString() {
  return 'ImprovementResponse(requestId: $requestId, catalogVersion: $catalogVersion, rulesVersion: $rulesVersion, currentScore: $currentScore, improvements: $improvements, cachedAt: $cachedAt)';
}


}

/// @nodoc
abstract mixin class $ImprovementResponseCopyWith<$Res>  {
  factory $ImprovementResponseCopyWith(ImprovementResponse value, $Res Function(ImprovementResponse) _then) = _$ImprovementResponseCopyWithImpl;
@useResult
$Res call({
 String requestId, int catalogVersion, int rulesVersion, int currentScore, List<Improvement> improvements,@JsonKey(includeFromJson: false, includeToJson: false) DateTime? cachedAt
});




}
/// @nodoc
class _$ImprovementResponseCopyWithImpl<$Res>
    implements $ImprovementResponseCopyWith<$Res> {
  _$ImprovementResponseCopyWithImpl(this._self, this._then);

  final ImprovementResponse _self;
  final $Res Function(ImprovementResponse) _then;

/// Create a copy of ImprovementResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? catalogVersion = null,Object? rulesVersion = null,Object? currentScore = null,Object? improvements = null,Object? cachedAt = freezed,}) {
  return _then(ImprovementResponse(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,catalogVersion: null == catalogVersion ? _self.catalogVersion : catalogVersion // ignore: cast_nullable_to_non_nullable
as int,rulesVersion: null == rulesVersion ? _self.rulesVersion : rulesVersion // ignore: cast_nullable_to_non_nullable
as int,currentScore: null == currentScore ? _self.currentScore : currentScore // ignore: cast_nullable_to_non_nullable
as int,improvements: null == improvements ? _self.improvements : improvements // ignore: cast_nullable_to_non_nullable
as List<Improvement>,cachedAt: freezed == cachedAt ? _self.cachedAt : cachedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ImprovementResponse].
extension ImprovementResponsePatterns on ImprovementResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImprovementResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImprovementResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImprovementResponse value)  $default,){
final _that = this;
switch (_that) {
case _ImprovementResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImprovementResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ImprovementResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String requestId,  int catalogVersion,  int rulesVersion,  int currentScore,  List<Improvement> improvements, @JsonKey(includeFromJson: false, includeToJson: false)  DateTime? cachedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImprovementResponse() when $default != null:
return $default(_that.requestId,_that.catalogVersion,_that.rulesVersion,_that.currentScore,_that.improvements,_that.cachedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String requestId,  int catalogVersion,  int rulesVersion,  int currentScore,  List<Improvement> improvements, @JsonKey(includeFromJson: false, includeToJson: false)  DateTime? cachedAt)  $default,) {final _that = this;
switch (_that) {
case _ImprovementResponse():
return $default(_that.requestId,_that.catalogVersion,_that.rulesVersion,_that.currentScore,_that.improvements,_that.cachedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String requestId,  int catalogVersion,  int rulesVersion,  int currentScore,  List<Improvement> improvements, @JsonKey(includeFromJson: false, includeToJson: false)  DateTime? cachedAt)?  $default,) {final _that = this;
switch (_that) {
case _ImprovementResponse() when $default != null:
return $default(_that.requestId,_that.catalogVersion,_that.rulesVersion,_that.currentScore,_that.improvements,_that.cachedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImprovementResponse implements ImprovementResponse {
  const _ImprovementResponse({required this.requestId, required this.catalogVersion, required this.rulesVersion, required this.currentScore,  List<Improvement> improvements = const [], @JsonKey(includeFromJson: false, includeToJson: false) this.cachedAt}): _improvements = improvements;
  factory _ImprovementResponse.fromJson(Map<String, dynamic> json) => _$ImprovementResponseFromJson(json);

@override final  String requestId;
@override final  int catalogVersion;
@override final  int rulesVersion;
@override final  int currentScore;
 final  List<Improvement> _improvements;
@override@JsonKey() List<Improvement> get improvements {
  if (_improvements is EqualUnmodifiableListView) return _improvements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_improvements);
}

@override@JsonKey(includeFromJson: false, includeToJson: false) final  DateTime? cachedAt;

/// Create a copy of ImprovementResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImprovementResponseCopyWith<_ImprovementResponse> get copyWith => __$ImprovementResponseCopyWithImpl<_ImprovementResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImprovementResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImprovementResponse&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.catalogVersion, catalogVersion) || other.catalogVersion == catalogVersion)&&(identical(other.rulesVersion, rulesVersion) || other.rulesVersion == rulesVersion)&&(identical(other.currentScore, currentScore) || other.currentScore == currentScore)&&const DeepCollectionEquality().equals(other._improvements, _improvements)&&(identical(other.cachedAt, cachedAt) || other.cachedAt == cachedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,catalogVersion,rulesVersion,currentScore,const DeepCollectionEquality().hash(_improvements),cachedAt);

@override
String toString() {
  return 'ImprovementResponse(requestId: $requestId, catalogVersion: $catalogVersion, rulesVersion: $rulesVersion, currentScore: $currentScore, improvements: $improvements, cachedAt: $cachedAt)';
}


}

/// @nodoc
abstract mixin class _$ImprovementResponseCopyWith<$Res> implements $ImprovementResponseCopyWith<$Res> {
  factory _$ImprovementResponseCopyWith(_ImprovementResponse value, $Res Function(_ImprovementResponse) _then) = __$ImprovementResponseCopyWithImpl;
@override @useResult
$Res call({
 String requestId, int catalogVersion, int rulesVersion, int currentScore, List<Improvement> improvements,@JsonKey(includeFromJson: false, includeToJson: false) DateTime? cachedAt
});




}
/// @nodoc
class __$ImprovementResponseCopyWithImpl<$Res>
    implements _$ImprovementResponseCopyWith<$Res> {
  __$ImprovementResponseCopyWithImpl(this._self, this._then);

  final _ImprovementResponse _self;
  final $Res Function(_ImprovementResponse) _then;

/// Create a copy of ImprovementResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? catalogVersion = null,Object? rulesVersion = null,Object? currentScore = null,Object? improvements = null,Object? cachedAt = freezed,}) {
  return _then(_ImprovementResponse(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,catalogVersion: null == catalogVersion ? _self.catalogVersion : catalogVersion // ignore: cast_nullable_to_non_nullable
as int,rulesVersion: null == rulesVersion ? _self.rulesVersion : rulesVersion // ignore: cast_nullable_to_non_nullable
as int,currentScore: null == currentScore ? _self.currentScore : currentScore // ignore: cast_nullable_to_non_nullable
as int,improvements: null == improvements ? _self._improvements : improvements // ignore: cast_nullable_to_non_nullable
as List<Improvement>,cachedAt: freezed == cachedAt ? _self.cachedAt : cachedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$FeedbackRequest {

@NullableIdConverter() String? get outfitId; int? get rating; bool? get isHelpful; String? get comment;
/// Create a copy of FeedbackRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedbackRequestCopyWith<FeedbackRequest> get copyWith => _$FeedbackRequestCopyWithImpl<FeedbackRequest>(this as FeedbackRequest, _$identity);

  /// Serializes this FeedbackRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbackRequest&&(identical(other.outfitId, outfitId) || other.outfitId == outfitId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.isHelpful, isHelpful) || other.isHelpful == isHelpful)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,outfitId,rating,isHelpful,comment);

@override
String toString() {
  return 'FeedbackRequest(outfitId: $outfitId, rating: $rating, isHelpful: $isHelpful, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $FeedbackRequestCopyWith<$Res>  {
  factory $FeedbackRequestCopyWith(FeedbackRequest value, $Res Function(FeedbackRequest) _then) = _$FeedbackRequestCopyWithImpl;
@useResult
$Res call({
@NullableIdConverter() String? outfitId, int? rating, bool? isHelpful, String? comment
});




}
/// @nodoc
class _$FeedbackRequestCopyWithImpl<$Res>
    implements $FeedbackRequestCopyWith<$Res> {
  _$FeedbackRequestCopyWithImpl(this._self, this._then);

  final FeedbackRequest _self;
  final $Res Function(FeedbackRequest) _then;

/// Create a copy of FeedbackRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? outfitId = freezed,Object? rating = freezed,Object? isHelpful = freezed,Object? comment = freezed,}) {
  return _then(FeedbackRequest(
outfitId: freezed == outfitId ? _self.outfitId : outfitId // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,isHelpful: freezed == isHelpful ? _self.isHelpful : isHelpful // ignore: cast_nullable_to_non_nullable
as bool?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FeedbackRequest].
extension FeedbackRequestPatterns on FeedbackRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedbackRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedbackRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedbackRequest value)  $default,){
final _that = this;
switch (_that) {
case _FeedbackRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedbackRequest value)?  $default,){
final _that = this;
switch (_that) {
case _FeedbackRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@NullableIdConverter()  String? outfitId,  int? rating,  bool? isHelpful,  String? comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedbackRequest() when $default != null:
return $default(_that.outfitId,_that.rating,_that.isHelpful,_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@NullableIdConverter()  String? outfitId,  int? rating,  bool? isHelpful,  String? comment)  $default,) {final _that = this;
switch (_that) {
case _FeedbackRequest():
return $default(_that.outfitId,_that.rating,_that.isHelpful,_that.comment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@NullableIdConverter()  String? outfitId,  int? rating,  bool? isHelpful,  String? comment)?  $default,) {final _that = this;
switch (_that) {
case _FeedbackRequest() when $default != null:
return $default(_that.outfitId,_that.rating,_that.isHelpful,_that.comment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeedbackRequest implements FeedbackRequest {
  const _FeedbackRequest({@NullableIdConverter() this.outfitId, this.rating, this.isHelpful, this.comment});
  factory _FeedbackRequest.fromJson(Map<String, dynamic> json) => _$FeedbackRequestFromJson(json);

@override@NullableIdConverter() final  String? outfitId;
@override final  int? rating;
@override final  bool? isHelpful;
@override final  String? comment;

/// Create a copy of FeedbackRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedbackRequestCopyWith<_FeedbackRequest> get copyWith => __$FeedbackRequestCopyWithImpl<_FeedbackRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedbackRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedbackRequest&&(identical(other.outfitId, outfitId) || other.outfitId == outfitId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.isHelpful, isHelpful) || other.isHelpful == isHelpful)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,outfitId,rating,isHelpful,comment);

@override
String toString() {
  return 'FeedbackRequest(outfitId: $outfitId, rating: $rating, isHelpful: $isHelpful, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$FeedbackRequestCopyWith<$Res> implements $FeedbackRequestCopyWith<$Res> {
  factory _$FeedbackRequestCopyWith(_FeedbackRequest value, $Res Function(_FeedbackRequest) _then) = __$FeedbackRequestCopyWithImpl;
@override @useResult
$Res call({
@NullableIdConverter() String? outfitId, int? rating, bool? isHelpful, String? comment
});




}
/// @nodoc
class __$FeedbackRequestCopyWithImpl<$Res>
    implements _$FeedbackRequestCopyWith<$Res> {
  __$FeedbackRequestCopyWithImpl(this._self, this._then);

  final _FeedbackRequest _self;
  final $Res Function(_FeedbackRequest) _then;

/// Create a copy of FeedbackRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? outfitId = freezed,Object? rating = freezed,Object? isHelpful = freezed,Object? comment = freezed,}) {
  return _then(_FeedbackRequest(
outfitId: freezed == outfitId ? _self.outfitId : outfitId // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,isHelpful: freezed == isHelpful ? _self.isHelpful : isHelpful // ignore: cast_nullable_to_non_nullable
as bool?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$FeedbackReceipt {

 String get requestId;@NullableIdConverter() String? get outfitId; int? get rating; bool? get isHelpful; String? get comment;@UtcDateTimeConverter() DateTime get createdAt;
/// Create a copy of FeedbackReceipt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedbackReceiptCopyWith<FeedbackReceipt> get copyWith => _$FeedbackReceiptCopyWithImpl<FeedbackReceipt>(this as FeedbackReceipt, _$identity);

  /// Serializes this FeedbackReceipt to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbackReceipt&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.outfitId, outfitId) || other.outfitId == outfitId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.isHelpful, isHelpful) || other.isHelpful == isHelpful)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,outfitId,rating,isHelpful,comment,createdAt);

@override
String toString() {
  return 'FeedbackReceipt(requestId: $requestId, outfitId: $outfitId, rating: $rating, isHelpful: $isHelpful, comment: $comment, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FeedbackReceiptCopyWith<$Res>  {
  factory $FeedbackReceiptCopyWith(FeedbackReceipt value, $Res Function(FeedbackReceipt) _then) = _$FeedbackReceiptCopyWithImpl;
@useResult
$Res call({
 String requestId,@NullableIdConverter() String? outfitId, int? rating, bool? isHelpful, String? comment,@UtcDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class _$FeedbackReceiptCopyWithImpl<$Res>
    implements $FeedbackReceiptCopyWith<$Res> {
  _$FeedbackReceiptCopyWithImpl(this._self, this._then);

  final FeedbackReceipt _self;
  final $Res Function(FeedbackReceipt) _then;

/// Create a copy of FeedbackReceipt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? outfitId = freezed,Object? rating = freezed,Object? isHelpful = freezed,Object? comment = freezed,Object? createdAt = null,}) {
  return _then(FeedbackReceipt(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,outfitId: freezed == outfitId ? _self.outfitId : outfitId // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,isHelpful: freezed == isHelpful ? _self.isHelpful : isHelpful // ignore: cast_nullable_to_non_nullable
as bool?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [FeedbackReceipt].
extension FeedbackReceiptPatterns on FeedbackReceipt {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedbackReceipt value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedbackReceipt() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedbackReceipt value)  $default,){
final _that = this;
switch (_that) {
case _FeedbackReceipt():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedbackReceipt value)?  $default,){
final _that = this;
switch (_that) {
case _FeedbackReceipt() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String requestId, @NullableIdConverter()  String? outfitId,  int? rating,  bool? isHelpful,  String? comment, @UtcDateTimeConverter()  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedbackReceipt() when $default != null:
return $default(_that.requestId,_that.outfitId,_that.rating,_that.isHelpful,_that.comment,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String requestId, @NullableIdConverter()  String? outfitId,  int? rating,  bool? isHelpful,  String? comment, @UtcDateTimeConverter()  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _FeedbackReceipt():
return $default(_that.requestId,_that.outfitId,_that.rating,_that.isHelpful,_that.comment,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String requestId, @NullableIdConverter()  String? outfitId,  int? rating,  bool? isHelpful,  String? comment, @UtcDateTimeConverter()  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FeedbackReceipt() when $default != null:
return $default(_that.requestId,_that.outfitId,_that.rating,_that.isHelpful,_that.comment,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeedbackReceipt implements FeedbackReceipt {
  const _FeedbackReceipt({required this.requestId, @NullableIdConverter() this.outfitId, this.rating, this.isHelpful, this.comment, @UtcDateTimeConverter() required this.createdAt});
  factory _FeedbackReceipt.fromJson(Map<String, dynamic> json) => _$FeedbackReceiptFromJson(json);

@override final  String requestId;
@override@NullableIdConverter() final  String? outfitId;
@override final  int? rating;
@override final  bool? isHelpful;
@override final  String? comment;
@override@UtcDateTimeConverter() final  DateTime createdAt;

/// Create a copy of FeedbackReceipt
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedbackReceiptCopyWith<_FeedbackReceipt> get copyWith => __$FeedbackReceiptCopyWithImpl<_FeedbackReceipt>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedbackReceiptToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedbackReceipt&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.outfitId, outfitId) || other.outfitId == outfitId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.isHelpful, isHelpful) || other.isHelpful == isHelpful)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,outfitId,rating,isHelpful,comment,createdAt);

@override
String toString() {
  return 'FeedbackReceipt(requestId: $requestId, outfitId: $outfitId, rating: $rating, isHelpful: $isHelpful, comment: $comment, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FeedbackReceiptCopyWith<$Res> implements $FeedbackReceiptCopyWith<$Res> {
  factory _$FeedbackReceiptCopyWith(_FeedbackReceipt value, $Res Function(_FeedbackReceipt) _then) = __$FeedbackReceiptCopyWithImpl;
@override @useResult
$Res call({
 String requestId,@NullableIdConverter() String? outfitId, int? rating, bool? isHelpful, String? comment,@UtcDateTimeConverter() DateTime createdAt
});




}
/// @nodoc
class __$FeedbackReceiptCopyWithImpl<$Res>
    implements _$FeedbackReceiptCopyWith<$Res> {
  __$FeedbackReceiptCopyWithImpl(this._self, this._then);

  final _FeedbackReceipt _self;
  final $Res Function(_FeedbackReceipt) _then;

/// Create a copy of FeedbackReceipt
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? outfitId = freezed,Object? rating = freezed,Object? isHelpful = freezed,Object? comment = freezed,Object? createdAt = null,}) {
  return _then(_FeedbackReceipt(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,outfitId: freezed == outfitId ? _self.outfitId : outfitId // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,isHelpful: freezed == isHelpful ? _self.isHelpful : isHelpful // ignore: cast_nullable_to_non_nullable
as bool?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
