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
mixin _$ScoreBreakdown {

 int get color; int get structure; int get occasion; int get style; int get completeness;
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
 int color, int structure, int occasion, int style, int completeness
});




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
as int,structure: null == structure ? _self.structure : structure // ignore: cast_nullable_to_non_nullable
as int,occasion: null == occasion ? _self.occasion : occasion // ignore: cast_nullable_to_non_nullable
as int,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as int,completeness: null == completeness ? _self.completeness : completeness // ignore: cast_nullable_to_non_nullable
as int,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int color,  int structure,  int occasion,  int style,  int completeness)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int color,  int structure,  int occasion,  int style,  int completeness)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int color,  int structure,  int occasion,  int style,  int completeness)?  $default,) {final _that = this;
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

@override final  int color;
@override final  int structure;
@override final  int occasion;
@override final  int style;
@override final  int completeness;

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
 int color, int structure, int occasion, int style, int completeness
});




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
as int,structure: null == structure ? _self.structure : structure // ignore: cast_nullable_to_non_nullable
as int,occasion: null == occasion ? _self.occasion : occasion // ignore: cast_nullable_to_non_nullable
as int,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as int,completeness: null == completeness ? _self.completeness : completeness // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Remark {

 RemarkKind get kind; String get code; String get message; List<PieceRole> get roles;
/// Create a copy of Remark
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemarkCopyWith<Remark> get copyWith => _$RemarkCopyWithImpl<Remark>(this as Remark, _$identity);

  /// Serializes this Remark to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Remark&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.roles, roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,code,message,const DeepCollectionEquality().hash(roles));

@override
String toString() {
  return 'Remark(kind: $kind, code: $code, message: $message, roles: $roles)';
}


}

/// @nodoc
abstract mixin class $RemarkCopyWith<$Res>  {
  factory $RemarkCopyWith(Remark value, $Res Function(Remark) _then) = _$RemarkCopyWithImpl;
@useResult
$Res call({
 RemarkKind kind, String code, String message, List<PieceRole> roles
});




}
/// @nodoc
class _$RemarkCopyWithImpl<$Res>
    implements $RemarkCopyWith<$Res> {
  _$RemarkCopyWithImpl(this._self, this._then);

  final Remark _self;
  final $Res Function(Remark) _then;

/// Create a copy of Remark
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? code = null,Object? message = null,Object? roles = null,}) {
  return _then(Remark(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as RemarkKind,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<PieceRole>,
  ));
}

}


/// Adds pattern-matching-related methods to [Remark].
extension RemarkPatterns on Remark {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Remark value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Remark() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Remark value)  $default,){
final _that = this;
switch (_that) {
case _Remark():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Remark value)?  $default,){
final _that = this;
switch (_that) {
case _Remark() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RemarkKind kind,  String code,  String message,  List<PieceRole> roles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Remark() when $default != null:
return $default(_that.kind,_that.code,_that.message,_that.roles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RemarkKind kind,  String code,  String message,  List<PieceRole> roles)  $default,) {final _that = this;
switch (_that) {
case _Remark():
return $default(_that.kind,_that.code,_that.message,_that.roles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RemarkKind kind,  String code,  String message,  List<PieceRole> roles)?  $default,) {final _that = this;
switch (_that) {
case _Remark() when $default != null:
return $default(_that.kind,_that.code,_that.message,_that.roles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Remark implements Remark {
  const _Remark({required this.kind, required this.code, required this.message,  List<PieceRole> roles = const []}): _roles = roles;
  factory _Remark.fromJson(Map<String, dynamic> json) => _$RemarkFromJson(json);

@override final  RemarkKind kind;
@override final  String code;
@override final  String message;
 final  List<PieceRole> _roles;
@override@JsonKey() List<PieceRole> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}


/// Create a copy of Remark
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemarkCopyWith<_Remark> get copyWith => __$RemarkCopyWithImpl<_Remark>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RemarkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Remark&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._roles, _roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,code,message,const DeepCollectionEquality().hash(_roles));

@override
String toString() {
  return 'Remark(kind: $kind, code: $code, message: $message, roles: $roles)';
}


}

/// @nodoc
abstract mixin class _$RemarkCopyWith<$Res> implements $RemarkCopyWith<$Res> {
  factory _$RemarkCopyWith(_Remark value, $Res Function(_Remark) _then) = __$RemarkCopyWithImpl;
@override @useResult
$Res call({
 RemarkKind kind, String code, String message, List<PieceRole> roles
});




}
/// @nodoc
class __$RemarkCopyWithImpl<$Res>
    implements _$RemarkCopyWith<$Res> {
  __$RemarkCopyWithImpl(this._self, this._then);

  final _Remark _self;
  final $Res Function(_Remark) _then;

/// Create a copy of Remark
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? code = null,Object? message = null,Object? roles = null,}) {
  return _then(_Remark(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as RemarkKind,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<PieceRole>,
  ));
}


}


/// @nodoc
mixin _$Improvement {

 PieceRole get role;@IdConverter() String get clothingTypeId;@IdConverter() String get fromColorId;@IdConverter() String get toColorId; int get newScore; int get gain; String get explanation;
/// Create a copy of Improvement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImprovementCopyWith<Improvement> get copyWith => _$ImprovementCopyWithImpl<Improvement>(this as Improvement, _$identity);

  /// Serializes this Improvement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Improvement&&(identical(other.role, role) || other.role == role)&&(identical(other.clothingTypeId, clothingTypeId) || other.clothingTypeId == clothingTypeId)&&(identical(other.fromColorId, fromColorId) || other.fromColorId == fromColorId)&&(identical(other.toColorId, toColorId) || other.toColorId == toColorId)&&(identical(other.newScore, newScore) || other.newScore == newScore)&&(identical(other.gain, gain) || other.gain == gain)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,clothingTypeId,fromColorId,toColorId,newScore,gain,explanation);

@override
String toString() {
  return 'Improvement(role: $role, clothingTypeId: $clothingTypeId, fromColorId: $fromColorId, toColorId: $toColorId, newScore: $newScore, gain: $gain, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class $ImprovementCopyWith<$Res>  {
  factory $ImprovementCopyWith(Improvement value, $Res Function(Improvement) _then) = _$ImprovementCopyWithImpl;
@useResult
$Res call({
 PieceRole role,@IdConverter() String clothingTypeId,@IdConverter() String fromColorId,@IdConverter() String toColorId, int newScore, int gain, String explanation
});




}
/// @nodoc
class _$ImprovementCopyWithImpl<$Res>
    implements $ImprovementCopyWith<$Res> {
  _$ImprovementCopyWithImpl(this._self, this._then);

  final Improvement _self;
  final $Res Function(Improvement) _then;

/// Create a copy of Improvement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? role = null,Object? clothingTypeId = null,Object? fromColorId = null,Object? toColorId = null,Object? newScore = null,Object? gain = null,Object? explanation = null,}) {
  return _then(Improvement(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as PieceRole,clothingTypeId: null == clothingTypeId ? _self.clothingTypeId : clothingTypeId // ignore: cast_nullable_to_non_nullable
as String,fromColorId: null == fromColorId ? _self.fromColorId : fromColorId // ignore: cast_nullable_to_non_nullable
as String,toColorId: null == toColorId ? _self.toColorId : toColorId // ignore: cast_nullable_to_non_nullable
as String,newScore: null == newScore ? _self.newScore : newScore // ignore: cast_nullable_to_non_nullable
as int,gain: null == gain ? _self.gain : gain // ignore: cast_nullable_to_non_nullable
as int,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PieceRole role, @IdConverter()  String clothingTypeId, @IdConverter()  String fromColorId, @IdConverter()  String toColorId,  int newScore,  int gain,  String explanation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Improvement() when $default != null:
return $default(_that.role,_that.clothingTypeId,_that.fromColorId,_that.toColorId,_that.newScore,_that.gain,_that.explanation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PieceRole role, @IdConverter()  String clothingTypeId, @IdConverter()  String fromColorId, @IdConverter()  String toColorId,  int newScore,  int gain,  String explanation)  $default,) {final _that = this;
switch (_that) {
case _Improvement():
return $default(_that.role,_that.clothingTypeId,_that.fromColorId,_that.toColorId,_that.newScore,_that.gain,_that.explanation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PieceRole role, @IdConverter()  String clothingTypeId, @IdConverter()  String fromColorId, @IdConverter()  String toColorId,  int newScore,  int gain,  String explanation)?  $default,) {final _that = this;
switch (_that) {
case _Improvement() when $default != null:
return $default(_that.role,_that.clothingTypeId,_that.fromColorId,_that.toColorId,_that.newScore,_that.gain,_that.explanation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Improvement implements Improvement {
  const _Improvement({required this.role, @IdConverter() required this.clothingTypeId, @IdConverter() required this.fromColorId, @IdConverter() required this.toColorId, required this.newScore, required this.gain, required this.explanation});
  factory _Improvement.fromJson(Map<String, dynamic> json) => _$ImprovementFromJson(json);

@override final  PieceRole role;
@override@IdConverter() final  String clothingTypeId;
@override@IdConverter() final  String fromColorId;
@override@IdConverter() final  String toColorId;
@override final  int newScore;
@override final  int gain;
@override final  String explanation;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Improvement&&(identical(other.role, role) || other.role == role)&&(identical(other.clothingTypeId, clothingTypeId) || other.clothingTypeId == clothingTypeId)&&(identical(other.fromColorId, fromColorId) || other.fromColorId == fromColorId)&&(identical(other.toColorId, toColorId) || other.toColorId == toColorId)&&(identical(other.newScore, newScore) || other.newScore == newScore)&&(identical(other.gain, gain) || other.gain == gain)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,clothingTypeId,fromColorId,toColorId,newScore,gain,explanation);

@override
String toString() {
  return 'Improvement(role: $role, clothingTypeId: $clothingTypeId, fromColorId: $fromColorId, toColorId: $toColorId, newScore: $newScore, gain: $gain, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class _$ImprovementCopyWith<$Res> implements $ImprovementCopyWith<$Res> {
  factory _$ImprovementCopyWith(_Improvement value, $Res Function(_Improvement) _then) = __$ImprovementCopyWithImpl;
@override @useResult
$Res call({
 PieceRole role,@IdConverter() String clothingTypeId,@IdConverter() String fromColorId,@IdConverter() String toColorId, int newScore, int gain, String explanation
});




}
/// @nodoc
class __$ImprovementCopyWithImpl<$Res>
    implements _$ImprovementCopyWith<$Res> {
  __$ImprovementCopyWithImpl(this._self, this._then);

  final _Improvement _self;
  final $Res Function(_Improvement) _then;

/// Create a copy of Improvement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? role = null,Object? clothingTypeId = null,Object? fromColorId = null,Object? toColorId = null,Object? newScore = null,Object? gain = null,Object? explanation = null,}) {
  return _then(_Improvement(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as PieceRole,clothingTypeId: null == clothingTypeId ? _self.clothingTypeId : clothingTypeId // ignore: cast_nullable_to_non_nullable
as String,fromColorId: null == fromColorId ? _self.fromColorId : fromColorId // ignore: cast_nullable_to_non_nullable
as String,toColorId: null == toColorId ? _self.toColorId : toColorId // ignore: cast_nullable_to_non_nullable
as String,newScore: null == newScore ? _self.newScore : newScore // ignore: cast_nullable_to_non_nullable
as int,gain: null == gain ? _self.gain : gain // ignore: cast_nullable_to_non_nullable
as int,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RecommendedItem {

@IdConverter() String get clothingTypeId;@IdConverter() String get colorId; PieceRole get role; bool get isAnchor;
/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendedItemCopyWith<RecommendedItem> get copyWith => _$RecommendedItemCopyWithImpl<RecommendedItem>(this as RecommendedItem, _$identity);

  /// Serializes this RecommendedItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendedItem&&(identical(other.clothingTypeId, clothingTypeId) || other.clothingTypeId == clothingTypeId)&&(identical(other.colorId, colorId) || other.colorId == colorId)&&(identical(other.role, role) || other.role == role)&&(identical(other.isAnchor, isAnchor) || other.isAnchor == isAnchor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clothingTypeId,colorId,role,isAnchor);

@override
String toString() {
  return 'RecommendedItem(clothingTypeId: $clothingTypeId, colorId: $colorId, role: $role, isAnchor: $isAnchor)';
}


}

/// @nodoc
abstract mixin class $RecommendedItemCopyWith<$Res>  {
  factory $RecommendedItemCopyWith(RecommendedItem value, $Res Function(RecommendedItem) _then) = _$RecommendedItemCopyWithImpl;
@useResult
$Res call({
@IdConverter() String clothingTypeId,@IdConverter() String colorId, PieceRole role, bool isAnchor
});




}
/// @nodoc
class _$RecommendedItemCopyWithImpl<$Res>
    implements $RecommendedItemCopyWith<$Res> {
  _$RecommendedItemCopyWithImpl(this._self, this._then);

  final RecommendedItem _self;
  final $Res Function(RecommendedItem) _then;

/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clothingTypeId = null,Object? colorId = null,Object? role = null,Object? isAnchor = null,}) {
  return _then(RecommendedItem(
clothingTypeId: null == clothingTypeId ? _self.clothingTypeId : clothingTypeId // ignore: cast_nullable_to_non_nullable
as String,colorId: null == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as PieceRole,isAnchor: null == isAnchor ? _self.isAnchor : isAnchor // ignore: cast_nullable_to_non_nullable
as bool,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String clothingTypeId, @IdConverter()  String colorId,  PieceRole role,  bool isAnchor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendedItem() when $default != null:
return $default(_that.clothingTypeId,_that.colorId,_that.role,_that.isAnchor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String clothingTypeId, @IdConverter()  String colorId,  PieceRole role,  bool isAnchor)  $default,) {final _that = this;
switch (_that) {
case _RecommendedItem():
return $default(_that.clothingTypeId,_that.colorId,_that.role,_that.isAnchor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String clothingTypeId, @IdConverter()  String colorId,  PieceRole role,  bool isAnchor)?  $default,) {final _that = this;
switch (_that) {
case _RecommendedItem() when $default != null:
return $default(_that.clothingTypeId,_that.colorId,_that.role,_that.isAnchor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendedItem implements RecommendedItem {
  const _RecommendedItem({@IdConverter() required this.clothingTypeId, @IdConverter() required this.colorId, required this.role, this.isAnchor = false});
  factory _RecommendedItem.fromJson(Map<String, dynamic> json) => _$RecommendedItemFromJson(json);

@override@IdConverter() final  String clothingTypeId;
@override@IdConverter() final  String colorId;
@override final  PieceRole role;
@override@JsonKey() final  bool isAnchor;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendedItem&&(identical(other.clothingTypeId, clothingTypeId) || other.clothingTypeId == clothingTypeId)&&(identical(other.colorId, colorId) || other.colorId == colorId)&&(identical(other.role, role) || other.role == role)&&(identical(other.isAnchor, isAnchor) || other.isAnchor == isAnchor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clothingTypeId,colorId,role,isAnchor);

@override
String toString() {
  return 'RecommendedItem(clothingTypeId: $clothingTypeId, colorId: $colorId, role: $role, isAnchor: $isAnchor)';
}


}

/// @nodoc
abstract mixin class _$RecommendedItemCopyWith<$Res> implements $RecommendedItemCopyWith<$Res> {
  factory _$RecommendedItemCopyWith(_RecommendedItem value, $Res Function(_RecommendedItem) _then) = __$RecommendedItemCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String clothingTypeId,@IdConverter() String colorId, PieceRole role, bool isAnchor
});




}
/// @nodoc
class __$RecommendedItemCopyWithImpl<$Res>
    implements _$RecommendedItemCopyWith<$Res> {
  __$RecommendedItemCopyWithImpl(this._self, this._then);

  final _RecommendedItem _self;
  final $Res Function(_RecommendedItem) _then;

/// Create a copy of RecommendedItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clothingTypeId = null,Object? colorId = null,Object? role = null,Object? isAnchor = null,}) {
  return _then(_RecommendedItem(
clothingTypeId: null == clothingTypeId ? _self.clothingTypeId : clothingTypeId // ignore: cast_nullable_to_non_nullable
as String,colorId: null == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as PieceRole,isAnchor: null == isAnchor ? _self.isAnchor : isAnchor // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$RecommendedLook {

@NullableIdConverter() String? get outfitId; String get title; int get score; ScoreBreakdown get breakdown; String get explanation; List<RecommendedItem> get items; LookImage? get image;
/// Create a copy of RecommendedLook
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendedLookCopyWith<RecommendedLook> get copyWith => _$RecommendedLookCopyWithImpl<RecommendedLook>(this as RecommendedLook, _$identity);

  /// Serializes this RecommendedLook to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendedLook&&(identical(other.outfitId, outfitId) || other.outfitId == outfitId)&&(identical(other.title, title) || other.title == title)&&(identical(other.score, score) || other.score == score)&&(identical(other.breakdown, breakdown) || other.breakdown == breakdown)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,outfitId,title,score,breakdown,explanation,const DeepCollectionEquality().hash(items),image);

@override
String toString() {
  return 'RecommendedLook(outfitId: $outfitId, title: $title, score: $score, breakdown: $breakdown, explanation: $explanation, items: $items, image: $image)';
}


}

/// @nodoc
abstract mixin class $RecommendedLookCopyWith<$Res>  {
  factory $RecommendedLookCopyWith(RecommendedLook value, $Res Function(RecommendedLook) _then) = _$RecommendedLookCopyWithImpl;
@useResult
$Res call({
@NullableIdConverter() String? outfitId, String title, int score, ScoreBreakdown breakdown, String explanation, List<RecommendedItem> items, LookImage? image
});


$ScoreBreakdownCopyWith<$Res> get breakdown;$LookImageCopyWith<$Res>? get image;

}
/// @nodoc
class _$RecommendedLookCopyWithImpl<$Res>
    implements $RecommendedLookCopyWith<$Res> {
  _$RecommendedLookCopyWithImpl(this._self, this._then);

  final RecommendedLook _self;
  final $Res Function(RecommendedLook) _then;

/// Create a copy of RecommendedLook
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? outfitId = freezed,Object? title = null,Object? score = null,Object? breakdown = null,Object? explanation = null,Object? items = null,Object? image = freezed,}) {
  return _then(RecommendedLook(
outfitId: freezed == outfitId ? _self.outfitId : outfitId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,breakdown: null == breakdown ? _self.breakdown : breakdown // ignore: cast_nullable_to_non_nullable
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
$ScoreBreakdownCopyWith<$Res> get breakdown {
  
  return $ScoreBreakdownCopyWith<$Res>(_self.breakdown, (value) {
    return _then(_self.copyWith(breakdown: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@NullableIdConverter()  String? outfitId,  String title,  int score,  ScoreBreakdown breakdown,  String explanation,  List<RecommendedItem> items,  LookImage? image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendedLook() when $default != null:
return $default(_that.outfitId,_that.title,_that.score,_that.breakdown,_that.explanation,_that.items,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@NullableIdConverter()  String? outfitId,  String title,  int score,  ScoreBreakdown breakdown,  String explanation,  List<RecommendedItem> items,  LookImage? image)  $default,) {final _that = this;
switch (_that) {
case _RecommendedLook():
return $default(_that.outfitId,_that.title,_that.score,_that.breakdown,_that.explanation,_that.items,_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@NullableIdConverter()  String? outfitId,  String title,  int score,  ScoreBreakdown breakdown,  String explanation,  List<RecommendedItem> items,  LookImage? image)?  $default,) {final _that = this;
switch (_that) {
case _RecommendedLook() when $default != null:
return $default(_that.outfitId,_that.title,_that.score,_that.breakdown,_that.explanation,_that.items,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendedLook implements RecommendedLook {
  const _RecommendedLook({@NullableIdConverter() this.outfitId, required this.title, required this.score, required this.breakdown, required this.explanation, required  List<RecommendedItem> items, this.image}): _items = items;
  factory _RecommendedLook.fromJson(Map<String, dynamic> json) => _$RecommendedLookFromJson(json);

@override@NullableIdConverter() final  String? outfitId;
@override final  String title;
@override final  int score;
@override final  ScoreBreakdown breakdown;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendedLook&&(identical(other.outfitId, outfitId) || other.outfitId == outfitId)&&(identical(other.title, title) || other.title == title)&&(identical(other.score, score) || other.score == score)&&(identical(other.breakdown, breakdown) || other.breakdown == breakdown)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,outfitId,title,score,breakdown,explanation,const DeepCollectionEquality().hash(_items),image);

@override
String toString() {
  return 'RecommendedLook(outfitId: $outfitId, title: $title, score: $score, breakdown: $breakdown, explanation: $explanation, items: $items, image: $image)';
}


}

/// @nodoc
abstract mixin class _$RecommendedLookCopyWith<$Res> implements $RecommendedLookCopyWith<$Res> {
  factory _$RecommendedLookCopyWith(_RecommendedLook value, $Res Function(_RecommendedLook) _then) = __$RecommendedLookCopyWithImpl;
@override @useResult
$Res call({
@NullableIdConverter() String? outfitId, String title, int score, ScoreBreakdown breakdown, String explanation, List<RecommendedItem> items, LookImage? image
});


@override $ScoreBreakdownCopyWith<$Res> get breakdown;@override $LookImageCopyWith<$Res>? get image;

}
/// @nodoc
class __$RecommendedLookCopyWithImpl<$Res>
    implements _$RecommendedLookCopyWith<$Res> {
  __$RecommendedLookCopyWithImpl(this._self, this._then);

  final _RecommendedLook _self;
  final $Res Function(_RecommendedLook) _then;

/// Create a copy of RecommendedLook
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? outfitId = freezed,Object? title = null,Object? score = null,Object? breakdown = null,Object? explanation = null,Object? items = null,Object? image = freezed,}) {
  return _then(_RecommendedLook(
outfitId: freezed == outfitId ? _self.outfitId : outfitId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,breakdown: null == breakdown ? _self.breakdown : breakdown // ignore: cast_nullable_to_non_nullable
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
$ScoreBreakdownCopyWith<$Res> get breakdown {
  
  return $ScoreBreakdownCopyWith<$Res>(_self.breakdown, (value) {
    return _then(_self.copyWith(breakdown: value));
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
mixin _$BroadeningStep {

 BroadeningCriterion get criterion; String get message;
/// Create a copy of BroadeningStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BroadeningStepCopyWith<BroadeningStep> get copyWith => _$BroadeningStepCopyWithImpl<BroadeningStep>(this as BroadeningStep, _$identity);

  /// Serializes this BroadeningStep to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BroadeningStep&&(identical(other.criterion, criterion) || other.criterion == criterion)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,criterion,message);

@override
String toString() {
  return 'BroadeningStep(criterion: $criterion, message: $message)';
}


}

/// @nodoc
abstract mixin class $BroadeningStepCopyWith<$Res>  {
  factory $BroadeningStepCopyWith(BroadeningStep value, $Res Function(BroadeningStep) _then) = _$BroadeningStepCopyWithImpl;
@useResult
$Res call({
 BroadeningCriterion criterion, String message
});




}
/// @nodoc
class _$BroadeningStepCopyWithImpl<$Res>
    implements $BroadeningStepCopyWith<$Res> {
  _$BroadeningStepCopyWithImpl(this._self, this._then);

  final BroadeningStep _self;
  final $Res Function(BroadeningStep) _then;

/// Create a copy of BroadeningStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? criterion = null,Object? message = null,}) {
  return _then(BroadeningStep(
criterion: null == criterion ? _self.criterion : criterion // ignore: cast_nullable_to_non_nullable
as BroadeningCriterion,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BroadeningStep].
extension BroadeningStepPatterns on BroadeningStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BroadeningStep value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BroadeningStep() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BroadeningStep value)  $default,){
final _that = this;
switch (_that) {
case _BroadeningStep():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BroadeningStep value)?  $default,){
final _that = this;
switch (_that) {
case _BroadeningStep() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BroadeningCriterion criterion,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BroadeningStep() when $default != null:
return $default(_that.criterion,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BroadeningCriterion criterion,  String message)  $default,) {final _that = this;
switch (_that) {
case _BroadeningStep():
return $default(_that.criterion,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BroadeningCriterion criterion,  String message)?  $default,) {final _that = this;
switch (_that) {
case _BroadeningStep() when $default != null:
return $default(_that.criterion,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BroadeningStep implements BroadeningStep {
  const _BroadeningStep({required this.criterion, required this.message});
  factory _BroadeningStep.fromJson(Map<String, dynamic> json) => _$BroadeningStepFromJson(json);

@override final  BroadeningCriterion criterion;
@override final  String message;

/// Create a copy of BroadeningStep
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BroadeningStepCopyWith<_BroadeningStep> get copyWith => __$BroadeningStepCopyWithImpl<_BroadeningStep>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BroadeningStepToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BroadeningStep&&(identical(other.criterion, criterion) || other.criterion == criterion)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,criterion,message);

@override
String toString() {
  return 'BroadeningStep(criterion: $criterion, message: $message)';
}


}

/// @nodoc
abstract mixin class _$BroadeningStepCopyWith<$Res> implements $BroadeningStepCopyWith<$Res> {
  factory _$BroadeningStepCopyWith(_BroadeningStep value, $Res Function(_BroadeningStep) _then) = __$BroadeningStepCopyWithImpl;
@override @useResult
$Res call({
 BroadeningCriterion criterion, String message
});




}
/// @nodoc
class __$BroadeningStepCopyWithImpl<$Res>
    implements _$BroadeningStepCopyWith<$Res> {
  __$BroadeningStepCopyWithImpl(this._self, this._then);

  final _BroadeningStep _self;
  final $Res Function(_BroadeningStep) _then;

/// Create a copy of BroadeningStep
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? criterion = null,Object? message = null,}) {
  return _then(_BroadeningStep(
criterion: null == criterion ? _self.criterion : criterion // ignore: cast_nullable_to_non_nullable
as BroadeningCriterion,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$FromItemResponse {

 String get requestId; String get catalogVersion; String get rulesVersion; bool get computedOffline; List<BroadeningStep> get broadened; List<RecommendedLook> get results;
/// Create a copy of FromItemResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FromItemResponseCopyWith<FromItemResponse> get copyWith => _$FromItemResponseCopyWithImpl<FromItemResponse>(this as FromItemResponse, _$identity);

  /// Serializes this FromItemResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FromItemResponse&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.catalogVersion, catalogVersion) || other.catalogVersion == catalogVersion)&&(identical(other.rulesVersion, rulesVersion) || other.rulesVersion == rulesVersion)&&(identical(other.computedOffline, computedOffline) || other.computedOffline == computedOffline)&&const DeepCollectionEquality().equals(other.broadened, broadened)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,catalogVersion,rulesVersion,computedOffline,const DeepCollectionEquality().hash(broadened),const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'FromItemResponse(requestId: $requestId, catalogVersion: $catalogVersion, rulesVersion: $rulesVersion, computedOffline: $computedOffline, broadened: $broadened, results: $results)';
}


}

/// @nodoc
abstract mixin class $FromItemResponseCopyWith<$Res>  {
  factory $FromItemResponseCopyWith(FromItemResponse value, $Res Function(FromItemResponse) _then) = _$FromItemResponseCopyWithImpl;
@useResult
$Res call({
 String requestId, String catalogVersion, String rulesVersion, bool computedOffline, List<BroadeningStep> broadened, List<RecommendedLook> results
});




}
/// @nodoc
class _$FromItemResponseCopyWithImpl<$Res>
    implements $FromItemResponseCopyWith<$Res> {
  _$FromItemResponseCopyWithImpl(this._self, this._then);

  final FromItemResponse _self;
  final $Res Function(FromItemResponse) _then;

/// Create a copy of FromItemResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? catalogVersion = null,Object? rulesVersion = null,Object? computedOffline = null,Object? broadened = null,Object? results = null,}) {
  return _then(FromItemResponse(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,catalogVersion: null == catalogVersion ? _self.catalogVersion : catalogVersion // ignore: cast_nullable_to_non_nullable
as String,rulesVersion: null == rulesVersion ? _self.rulesVersion : rulesVersion // ignore: cast_nullable_to_non_nullable
as String,computedOffline: null == computedOffline ? _self.computedOffline : computedOffline // ignore: cast_nullable_to_non_nullable
as bool,broadened: null == broadened ? _self.broadened : broadened // ignore: cast_nullable_to_non_nullable
as List<BroadeningStep>,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<RecommendedLook>,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String requestId,  String catalogVersion,  String rulesVersion,  bool computedOffline,  List<BroadeningStep> broadened,  List<RecommendedLook> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FromItemResponse() when $default != null:
return $default(_that.requestId,_that.catalogVersion,_that.rulesVersion,_that.computedOffline,_that.broadened,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String requestId,  String catalogVersion,  String rulesVersion,  bool computedOffline,  List<BroadeningStep> broadened,  List<RecommendedLook> results)  $default,) {final _that = this;
switch (_that) {
case _FromItemResponse():
return $default(_that.requestId,_that.catalogVersion,_that.rulesVersion,_that.computedOffline,_that.broadened,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String requestId,  String catalogVersion,  String rulesVersion,  bool computedOffline,  List<BroadeningStep> broadened,  List<RecommendedLook> results)?  $default,) {final _that = this;
switch (_that) {
case _FromItemResponse() when $default != null:
return $default(_that.requestId,_that.catalogVersion,_that.rulesVersion,_that.computedOffline,_that.broadened,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FromItemResponse implements FromItemResponse {
  const _FromItemResponse({required this.requestId, required this.catalogVersion, required this.rulesVersion, this.computedOffline = false,  List<BroadeningStep> broadened = const [], required  List<RecommendedLook> results}): _broadened = broadened,_results = results;
  factory _FromItemResponse.fromJson(Map<String, dynamic> json) => _$FromItemResponseFromJson(json);

@override final  String requestId;
@override final  String catalogVersion;
@override final  String rulesVersion;
@override@JsonKey() final  bool computedOffline;
 final  List<BroadeningStep> _broadened;
@override@JsonKey() List<BroadeningStep> get broadened {
  if (_broadened is EqualUnmodifiableListView) return _broadened;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_broadened);
}

 final  List<RecommendedLook> _results;
@override List<RecommendedLook> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FromItemResponse&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.catalogVersion, catalogVersion) || other.catalogVersion == catalogVersion)&&(identical(other.rulesVersion, rulesVersion) || other.rulesVersion == rulesVersion)&&(identical(other.computedOffline, computedOffline) || other.computedOffline == computedOffline)&&const DeepCollectionEquality().equals(other._broadened, _broadened)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,catalogVersion,rulesVersion,computedOffline,const DeepCollectionEquality().hash(_broadened),const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'FromItemResponse(requestId: $requestId, catalogVersion: $catalogVersion, rulesVersion: $rulesVersion, computedOffline: $computedOffline, broadened: $broadened, results: $results)';
}


}

/// @nodoc
abstract mixin class _$FromItemResponseCopyWith<$Res> implements $FromItemResponseCopyWith<$Res> {
  factory _$FromItemResponseCopyWith(_FromItemResponse value, $Res Function(_FromItemResponse) _then) = __$FromItemResponseCopyWithImpl;
@override @useResult
$Res call({
 String requestId, String catalogVersion, String rulesVersion, bool computedOffline, List<BroadeningStep> broadened, List<RecommendedLook> results
});




}
/// @nodoc
class __$FromItemResponseCopyWithImpl<$Res>
    implements _$FromItemResponseCopyWith<$Res> {
  __$FromItemResponseCopyWithImpl(this._self, this._then);

  final _FromItemResponse _self;
  final $Res Function(_FromItemResponse) _then;

/// Create a copy of FromItemResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? catalogVersion = null,Object? rulesVersion = null,Object? computedOffline = null,Object? broadened = null,Object? results = null,}) {
  return _then(_FromItemResponse(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,catalogVersion: null == catalogVersion ? _self.catalogVersion : catalogVersion // ignore: cast_nullable_to_non_nullable
as String,rulesVersion: null == rulesVersion ? _self.rulesVersion : rulesVersion // ignore: cast_nullable_to_non_nullable
as String,computedOffline: null == computedOffline ? _self.computedOffline : computedOffline // ignore: cast_nullable_to_non_nullable
as bool,broadened: null == broadened ? _self._broadened : broadened // ignore: cast_nullable_to_non_nullable
as List<BroadeningStep>,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<RecommendedLook>,
  ));
}


}


/// @nodoc
mixin _$EvaluationResponse {

 String get requestId; String get rulesVersion; bool get computedOffline; int get score; ScoreBreakdown get breakdown; String get explanation; List<String> get strengths; List<Remark> get warnings; List<Improvement> get suggestions;
/// Create a copy of EvaluationResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EvaluationResponseCopyWith<EvaluationResponse> get copyWith => _$EvaluationResponseCopyWithImpl<EvaluationResponse>(this as EvaluationResponse, _$identity);

  /// Serializes this EvaluationResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EvaluationResponse&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.rulesVersion, rulesVersion) || other.rulesVersion == rulesVersion)&&(identical(other.computedOffline, computedOffline) || other.computedOffline == computedOffline)&&(identical(other.score, score) || other.score == score)&&(identical(other.breakdown, breakdown) || other.breakdown == breakdown)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&const DeepCollectionEquality().equals(other.strengths, strengths)&&const DeepCollectionEquality().equals(other.warnings, warnings)&&const DeepCollectionEquality().equals(other.suggestions, suggestions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,rulesVersion,computedOffline,score,breakdown,explanation,const DeepCollectionEquality().hash(strengths),const DeepCollectionEquality().hash(warnings),const DeepCollectionEquality().hash(suggestions));

@override
String toString() {
  return 'EvaluationResponse(requestId: $requestId, rulesVersion: $rulesVersion, computedOffline: $computedOffline, score: $score, breakdown: $breakdown, explanation: $explanation, strengths: $strengths, warnings: $warnings, suggestions: $suggestions)';
}


}

/// @nodoc
abstract mixin class $EvaluationResponseCopyWith<$Res>  {
  factory $EvaluationResponseCopyWith(EvaluationResponse value, $Res Function(EvaluationResponse) _then) = _$EvaluationResponseCopyWithImpl;
@useResult
$Res call({
 String requestId, String rulesVersion, bool computedOffline, int score, ScoreBreakdown breakdown, String explanation, List<String> strengths, List<Remark> warnings, List<Improvement> suggestions
});


$ScoreBreakdownCopyWith<$Res> get breakdown;

}
/// @nodoc
class _$EvaluationResponseCopyWithImpl<$Res>
    implements $EvaluationResponseCopyWith<$Res> {
  _$EvaluationResponseCopyWithImpl(this._self, this._then);

  final EvaluationResponse _self;
  final $Res Function(EvaluationResponse) _then;

/// Create a copy of EvaluationResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? rulesVersion = null,Object? computedOffline = null,Object? score = null,Object? breakdown = null,Object? explanation = null,Object? strengths = null,Object? warnings = null,Object? suggestions = null,}) {
  return _then(EvaluationResponse(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,rulesVersion: null == rulesVersion ? _self.rulesVersion : rulesVersion // ignore: cast_nullable_to_non_nullable
as String,computedOffline: null == computedOffline ? _self.computedOffline : computedOffline // ignore: cast_nullable_to_non_nullable
as bool,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,breakdown: null == breakdown ? _self.breakdown : breakdown // ignore: cast_nullable_to_non_nullable
as ScoreBreakdown,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,strengths: null == strengths ? _self.strengths : strengths // ignore: cast_nullable_to_non_nullable
as List<String>,warnings: null == warnings ? _self.warnings : warnings // ignore: cast_nullable_to_non_nullable
as List<Remark>,suggestions: null == suggestions ? _self.suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<Improvement>,
  ));
}
/// Create a copy of EvaluationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScoreBreakdownCopyWith<$Res> get breakdown {
  
  return $ScoreBreakdownCopyWith<$Res>(_self.breakdown, (value) {
    return _then(_self.copyWith(breakdown: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String requestId,  String rulesVersion,  bool computedOffline,  int score,  ScoreBreakdown breakdown,  String explanation,  List<String> strengths,  List<Remark> warnings,  List<Improvement> suggestions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EvaluationResponse() when $default != null:
return $default(_that.requestId,_that.rulesVersion,_that.computedOffline,_that.score,_that.breakdown,_that.explanation,_that.strengths,_that.warnings,_that.suggestions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String requestId,  String rulesVersion,  bool computedOffline,  int score,  ScoreBreakdown breakdown,  String explanation,  List<String> strengths,  List<Remark> warnings,  List<Improvement> suggestions)  $default,) {final _that = this;
switch (_that) {
case _EvaluationResponse():
return $default(_that.requestId,_that.rulesVersion,_that.computedOffline,_that.score,_that.breakdown,_that.explanation,_that.strengths,_that.warnings,_that.suggestions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String requestId,  String rulesVersion,  bool computedOffline,  int score,  ScoreBreakdown breakdown,  String explanation,  List<String> strengths,  List<Remark> warnings,  List<Improvement> suggestions)?  $default,) {final _that = this;
switch (_that) {
case _EvaluationResponse() when $default != null:
return $default(_that.requestId,_that.rulesVersion,_that.computedOffline,_that.score,_that.breakdown,_that.explanation,_that.strengths,_that.warnings,_that.suggestions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EvaluationResponse implements EvaluationResponse {
  const _EvaluationResponse({required this.requestId, required this.rulesVersion, this.computedOffline = false, required this.score, required this.breakdown, required this.explanation, required  List<String> strengths, required  List<Remark> warnings, required  List<Improvement> suggestions}): _strengths = strengths,_warnings = warnings,_suggestions = suggestions;
  factory _EvaluationResponse.fromJson(Map<String, dynamic> json) => _$EvaluationResponseFromJson(json);

@override final  String requestId;
@override final  String rulesVersion;
@override@JsonKey() final  bool computedOffline;
@override final  int score;
@override final  ScoreBreakdown breakdown;
@override final  String explanation;
 final  List<String> _strengths;
@override List<String> get strengths {
  if (_strengths is EqualUnmodifiableListView) return _strengths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_strengths);
}

 final  List<Remark> _warnings;
@override List<Remark> get warnings {
  if (_warnings is EqualUnmodifiableListView) return _warnings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_warnings);
}

 final  List<Improvement> _suggestions;
@override List<Improvement> get suggestions {
  if (_suggestions is EqualUnmodifiableListView) return _suggestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestions);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EvaluationResponse&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.rulesVersion, rulesVersion) || other.rulesVersion == rulesVersion)&&(identical(other.computedOffline, computedOffline) || other.computedOffline == computedOffline)&&(identical(other.score, score) || other.score == score)&&(identical(other.breakdown, breakdown) || other.breakdown == breakdown)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&const DeepCollectionEquality().equals(other._strengths, _strengths)&&const DeepCollectionEquality().equals(other._warnings, _warnings)&&const DeepCollectionEquality().equals(other._suggestions, _suggestions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,rulesVersion,computedOffline,score,breakdown,explanation,const DeepCollectionEquality().hash(_strengths),const DeepCollectionEquality().hash(_warnings),const DeepCollectionEquality().hash(_suggestions));

@override
String toString() {
  return 'EvaluationResponse(requestId: $requestId, rulesVersion: $rulesVersion, computedOffline: $computedOffline, score: $score, breakdown: $breakdown, explanation: $explanation, strengths: $strengths, warnings: $warnings, suggestions: $suggestions)';
}


}

/// @nodoc
abstract mixin class _$EvaluationResponseCopyWith<$Res> implements $EvaluationResponseCopyWith<$Res> {
  factory _$EvaluationResponseCopyWith(_EvaluationResponse value, $Res Function(_EvaluationResponse) _then) = __$EvaluationResponseCopyWithImpl;
@override @useResult
$Res call({
 String requestId, String rulesVersion, bool computedOffline, int score, ScoreBreakdown breakdown, String explanation, List<String> strengths, List<Remark> warnings, List<Improvement> suggestions
});


@override $ScoreBreakdownCopyWith<$Res> get breakdown;

}
/// @nodoc
class __$EvaluationResponseCopyWithImpl<$Res>
    implements _$EvaluationResponseCopyWith<$Res> {
  __$EvaluationResponseCopyWithImpl(this._self, this._then);

  final _EvaluationResponse _self;
  final $Res Function(_EvaluationResponse) _then;

/// Create a copy of EvaluationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? rulesVersion = null,Object? computedOffline = null,Object? score = null,Object? breakdown = null,Object? explanation = null,Object? strengths = null,Object? warnings = null,Object? suggestions = null,}) {
  return _then(_EvaluationResponse(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,rulesVersion: null == rulesVersion ? _self.rulesVersion : rulesVersion // ignore: cast_nullable_to_non_nullable
as String,computedOffline: null == computedOffline ? _self.computedOffline : computedOffline // ignore: cast_nullable_to_non_nullable
as bool,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,breakdown: null == breakdown ? _self.breakdown : breakdown // ignore: cast_nullable_to_non_nullable
as ScoreBreakdown,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,strengths: null == strengths ? _self._strengths : strengths // ignore: cast_nullable_to_non_nullable
as List<String>,warnings: null == warnings ? _self._warnings : warnings // ignore: cast_nullable_to_non_nullable
as List<Remark>,suggestions: null == suggestions ? _self._suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<Improvement>,
  ));
}

/// Create a copy of EvaluationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScoreBreakdownCopyWith<$Res> get breakdown {
  
  return $ScoreBreakdownCopyWith<$Res>(_self.breakdown, (value) {
    return _then(_self.copyWith(breakdown: value));
  });
}
}


/// @nodoc
mixin _$ImprovementResponse {

 String get requestId; String get rulesVersion; bool get computedOffline; int get currentScore; List<Improvement> get improvements;
/// Create a copy of ImprovementResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImprovementResponseCopyWith<ImprovementResponse> get copyWith => _$ImprovementResponseCopyWithImpl<ImprovementResponse>(this as ImprovementResponse, _$identity);

  /// Serializes this ImprovementResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImprovementResponse&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.rulesVersion, rulesVersion) || other.rulesVersion == rulesVersion)&&(identical(other.computedOffline, computedOffline) || other.computedOffline == computedOffline)&&(identical(other.currentScore, currentScore) || other.currentScore == currentScore)&&const DeepCollectionEquality().equals(other.improvements, improvements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,rulesVersion,computedOffline,currentScore,const DeepCollectionEquality().hash(improvements));

@override
String toString() {
  return 'ImprovementResponse(requestId: $requestId, rulesVersion: $rulesVersion, computedOffline: $computedOffline, currentScore: $currentScore, improvements: $improvements)';
}


}

/// @nodoc
abstract mixin class $ImprovementResponseCopyWith<$Res>  {
  factory $ImprovementResponseCopyWith(ImprovementResponse value, $Res Function(ImprovementResponse) _then) = _$ImprovementResponseCopyWithImpl;
@useResult
$Res call({
 String requestId, String rulesVersion, bool computedOffline, int currentScore, List<Improvement> improvements
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
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? rulesVersion = null,Object? computedOffline = null,Object? currentScore = null,Object? improvements = null,}) {
  return _then(ImprovementResponse(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,rulesVersion: null == rulesVersion ? _self.rulesVersion : rulesVersion // ignore: cast_nullable_to_non_nullable
as String,computedOffline: null == computedOffline ? _self.computedOffline : computedOffline // ignore: cast_nullable_to_non_nullable
as bool,currentScore: null == currentScore ? _self.currentScore : currentScore // ignore: cast_nullable_to_non_nullable
as int,improvements: null == improvements ? _self.improvements : improvements // ignore: cast_nullable_to_non_nullable
as List<Improvement>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String requestId,  String rulesVersion,  bool computedOffline,  int currentScore,  List<Improvement> improvements)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImprovementResponse() when $default != null:
return $default(_that.requestId,_that.rulesVersion,_that.computedOffline,_that.currentScore,_that.improvements);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String requestId,  String rulesVersion,  bool computedOffline,  int currentScore,  List<Improvement> improvements)  $default,) {final _that = this;
switch (_that) {
case _ImprovementResponse():
return $default(_that.requestId,_that.rulesVersion,_that.computedOffline,_that.currentScore,_that.improvements);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String requestId,  String rulesVersion,  bool computedOffline,  int currentScore,  List<Improvement> improvements)?  $default,) {final _that = this;
switch (_that) {
case _ImprovementResponse() when $default != null:
return $default(_that.requestId,_that.rulesVersion,_that.computedOffline,_that.currentScore,_that.improvements);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImprovementResponse implements ImprovementResponse {
  const _ImprovementResponse({required this.requestId, required this.rulesVersion, this.computedOffline = false, required this.currentScore, required  List<Improvement> improvements}): _improvements = improvements;
  factory _ImprovementResponse.fromJson(Map<String, dynamic> json) => _$ImprovementResponseFromJson(json);

@override final  String requestId;
@override final  String rulesVersion;
@override@JsonKey() final  bool computedOffline;
@override final  int currentScore;
 final  List<Improvement> _improvements;
@override List<Improvement> get improvements {
  if (_improvements is EqualUnmodifiableListView) return _improvements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_improvements);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImprovementResponse&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.rulesVersion, rulesVersion) || other.rulesVersion == rulesVersion)&&(identical(other.computedOffline, computedOffline) || other.computedOffline == computedOffline)&&(identical(other.currentScore, currentScore) || other.currentScore == currentScore)&&const DeepCollectionEquality().equals(other._improvements, _improvements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,rulesVersion,computedOffline,currentScore,const DeepCollectionEquality().hash(_improvements));

@override
String toString() {
  return 'ImprovementResponse(requestId: $requestId, rulesVersion: $rulesVersion, computedOffline: $computedOffline, currentScore: $currentScore, improvements: $improvements)';
}


}

/// @nodoc
abstract mixin class _$ImprovementResponseCopyWith<$Res> implements $ImprovementResponseCopyWith<$Res> {
  factory _$ImprovementResponseCopyWith(_ImprovementResponse value, $Res Function(_ImprovementResponse) _then) = __$ImprovementResponseCopyWithImpl;
@override @useResult
$Res call({
 String requestId, String rulesVersion, bool computedOffline, int currentScore, List<Improvement> improvements
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
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? rulesVersion = null,Object? computedOffline = null,Object? currentScore = null,Object? improvements = null,}) {
  return _then(_ImprovementResponse(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,rulesVersion: null == rulesVersion ? _self.rulesVersion : rulesVersion // ignore: cast_nullable_to_non_nullable
as String,computedOffline: null == computedOffline ? _self.computedOffline : computedOffline // ignore: cast_nullable_to_non_nullable
as bool,currentScore: null == currentScore ? _self.currentScore : currentScore // ignore: cast_nullable_to_non_nullable
as int,improvements: null == improvements ? _self._improvements : improvements // ignore: cast_nullable_to_non_nullable
as List<Improvement>,
  ));
}


}


/// @nodoc
mixin _$FeedbackRequest {

 bool get isHelpful;@NullableIdConverter() String? get outfitId; String? get comment;
/// Create a copy of FeedbackRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedbackRequestCopyWith<FeedbackRequest> get copyWith => _$FeedbackRequestCopyWithImpl<FeedbackRequest>(this as FeedbackRequest, _$identity);

  /// Serializes this FeedbackRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbackRequest&&(identical(other.isHelpful, isHelpful) || other.isHelpful == isHelpful)&&(identical(other.outfitId, outfitId) || other.outfitId == outfitId)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isHelpful,outfitId,comment);

@override
String toString() {
  return 'FeedbackRequest(isHelpful: $isHelpful, outfitId: $outfitId, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $FeedbackRequestCopyWith<$Res>  {
  factory $FeedbackRequestCopyWith(FeedbackRequest value, $Res Function(FeedbackRequest) _then) = _$FeedbackRequestCopyWithImpl;
@useResult
$Res call({
 bool isHelpful,@NullableIdConverter() String? outfitId, String? comment
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
@pragma('vm:prefer-inline') @override $Res call({Object? isHelpful = null,Object? outfitId = freezed,Object? comment = freezed,}) {
  return _then(FeedbackRequest(
isHelpful: null == isHelpful ? _self.isHelpful : isHelpful // ignore: cast_nullable_to_non_nullable
as bool,outfitId: freezed == outfitId ? _self.outfitId : outfitId // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isHelpful, @NullableIdConverter()  String? outfitId,  String? comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedbackRequest() when $default != null:
return $default(_that.isHelpful,_that.outfitId,_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isHelpful, @NullableIdConverter()  String? outfitId,  String? comment)  $default,) {final _that = this;
switch (_that) {
case _FeedbackRequest():
return $default(_that.isHelpful,_that.outfitId,_that.comment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isHelpful, @NullableIdConverter()  String? outfitId,  String? comment)?  $default,) {final _that = this;
switch (_that) {
case _FeedbackRequest() when $default != null:
return $default(_that.isHelpful,_that.outfitId,_that.comment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeedbackRequest implements FeedbackRequest {
  const _FeedbackRequest({required this.isHelpful, @NullableIdConverter() this.outfitId, this.comment});
  factory _FeedbackRequest.fromJson(Map<String, dynamic> json) => _$FeedbackRequestFromJson(json);

@override final  bool isHelpful;
@override@NullableIdConverter() final  String? outfitId;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedbackRequest&&(identical(other.isHelpful, isHelpful) || other.isHelpful == isHelpful)&&(identical(other.outfitId, outfitId) || other.outfitId == outfitId)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isHelpful,outfitId,comment);

@override
String toString() {
  return 'FeedbackRequest(isHelpful: $isHelpful, outfitId: $outfitId, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$FeedbackRequestCopyWith<$Res> implements $FeedbackRequestCopyWith<$Res> {
  factory _$FeedbackRequestCopyWith(_FeedbackRequest value, $Res Function(_FeedbackRequest) _then) = __$FeedbackRequestCopyWithImpl;
@override @useResult
$Res call({
 bool isHelpful,@NullableIdConverter() String? outfitId, String? comment
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
@override @pragma('vm:prefer-inline') $Res call({Object? isHelpful = null,Object? outfitId = freezed,Object? comment = freezed,}) {
  return _then(_FeedbackRequest(
isHelpful: null == isHelpful ? _self.isHelpful : isHelpful // ignore: cast_nullable_to_non_nullable
as bool,outfitId: freezed == outfitId ? _self.outfitId : outfitId // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$FeedbackReceipt {

@IdConverter() String get id; String get requestId;@UtcDateTimeConverter() DateTime get createdAt;
/// Create a copy of FeedbackReceipt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedbackReceiptCopyWith<FeedbackReceipt> get copyWith => _$FeedbackReceiptCopyWithImpl<FeedbackReceipt>(this as FeedbackReceipt, _$identity);

  /// Serializes this FeedbackReceipt to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbackReceipt&&(identical(other.id, id) || other.id == id)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,requestId,createdAt);

@override
String toString() {
  return 'FeedbackReceipt(id: $id, requestId: $requestId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FeedbackReceiptCopyWith<$Res>  {
  factory $FeedbackReceiptCopyWith(FeedbackReceipt value, $Res Function(FeedbackReceipt) _then) = _$FeedbackReceiptCopyWithImpl;
@useResult
$Res call({
@IdConverter() String id, String requestId,@UtcDateTimeConverter() DateTime createdAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? requestId = null,Object? createdAt = null,}) {
  return _then(FeedbackReceipt(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String requestId, @UtcDateTimeConverter()  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedbackReceipt() when $default != null:
return $default(_that.id,_that.requestId,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String requestId, @UtcDateTimeConverter()  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _FeedbackReceipt():
return $default(_that.id,_that.requestId,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String id,  String requestId, @UtcDateTimeConverter()  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FeedbackReceipt() when $default != null:
return $default(_that.id,_that.requestId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeedbackReceipt implements FeedbackReceipt {
  const _FeedbackReceipt({@IdConverter() required this.id, required this.requestId, @UtcDateTimeConverter() required this.createdAt});
  factory _FeedbackReceipt.fromJson(Map<String, dynamic> json) => _$FeedbackReceiptFromJson(json);

@override@IdConverter() final  String id;
@override final  String requestId;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedbackReceipt&&(identical(other.id, id) || other.id == id)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,requestId,createdAt);

@override
String toString() {
  return 'FeedbackReceipt(id: $id, requestId: $requestId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FeedbackReceiptCopyWith<$Res> implements $FeedbackReceiptCopyWith<$Res> {
  factory _$FeedbackReceiptCopyWith(_FeedbackReceipt value, $Res Function(_FeedbackReceipt) _then) = __$FeedbackReceiptCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String id, String requestId,@UtcDateTimeConverter() DateTime createdAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? requestId = null,Object? createdAt = null,}) {
  return _then(_FeedbackReceipt(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
