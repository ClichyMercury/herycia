// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClothingCategory {

@IdConverter() String get id; String get name; String get slug; CategoryGroup get groupType; bool get isOptional; int get sortOrder;
/// Create a copy of ClothingCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClothingCategoryCopyWith<ClothingCategory> get copyWith => _$ClothingCategoryCopyWithImpl<ClothingCategory>(this as ClothingCategory, _$identity);

  /// Serializes this ClothingCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClothingCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.groupType, groupType) || other.groupType == groupType)&&(identical(other.isOptional, isOptional) || other.isOptional == isOptional)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,groupType,isOptional,sortOrder);

@override
String toString() {
  return 'ClothingCategory(id: $id, name: $name, slug: $slug, groupType: $groupType, isOptional: $isOptional, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $ClothingCategoryCopyWith<$Res>  {
  factory $ClothingCategoryCopyWith(ClothingCategory value, $Res Function(ClothingCategory) _then) = _$ClothingCategoryCopyWithImpl;
@useResult
$Res call({
@IdConverter() String id, String name, String slug, CategoryGroup groupType, bool isOptional, int sortOrder
});




}
/// @nodoc
class _$ClothingCategoryCopyWithImpl<$Res>
    implements $ClothingCategoryCopyWith<$Res> {
  _$ClothingCategoryCopyWithImpl(this._self, this._then);

  final ClothingCategory _self;
  final $Res Function(ClothingCategory) _then;

/// Create a copy of ClothingCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? groupType = null,Object? isOptional = null,Object? sortOrder = null,}) {
  return _then(ClothingCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,groupType: null == groupType ? _self.groupType : groupType // ignore: cast_nullable_to_non_nullable
as CategoryGroup,isOptional: null == isOptional ? _self.isOptional : isOptional // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ClothingCategory].
extension ClothingCategoryPatterns on ClothingCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClothingCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClothingCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClothingCategory value)  $default,){
final _that = this;
switch (_that) {
case _ClothingCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClothingCategory value)?  $default,){
final _that = this;
switch (_that) {
case _ClothingCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String name,  String slug,  CategoryGroup groupType,  bool isOptional,  int sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClothingCategory() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.groupType,_that.isOptional,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String name,  String slug,  CategoryGroup groupType,  bool isOptional,  int sortOrder)  $default,) {final _that = this;
switch (_that) {
case _ClothingCategory():
return $default(_that.id,_that.name,_that.slug,_that.groupType,_that.isOptional,_that.sortOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String id,  String name,  String slug,  CategoryGroup groupType,  bool isOptional,  int sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _ClothingCategory() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.groupType,_that.isOptional,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClothingCategory implements ClothingCategory {
  const _ClothingCategory({@IdConverter() required this.id, required this.name, required this.slug, required this.groupType, this.isOptional = false, this.sortOrder = 0});
  factory _ClothingCategory.fromJson(Map<String, dynamic> json) => _$ClothingCategoryFromJson(json);

@override@IdConverter() final  String id;
@override final  String name;
@override final  String slug;
@override final  CategoryGroup groupType;
@override@JsonKey() final  bool isOptional;
@override@JsonKey() final  int sortOrder;

/// Create a copy of ClothingCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClothingCategoryCopyWith<_ClothingCategory> get copyWith => __$ClothingCategoryCopyWithImpl<_ClothingCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClothingCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClothingCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.groupType, groupType) || other.groupType == groupType)&&(identical(other.isOptional, isOptional) || other.isOptional == isOptional)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,groupType,isOptional,sortOrder);

@override
String toString() {
  return 'ClothingCategory(id: $id, name: $name, slug: $slug, groupType: $groupType, isOptional: $isOptional, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$ClothingCategoryCopyWith<$Res> implements $ClothingCategoryCopyWith<$Res> {
  factory _$ClothingCategoryCopyWith(_ClothingCategory value, $Res Function(_ClothingCategory) _then) = __$ClothingCategoryCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String id, String name, String slug, CategoryGroup groupType, bool isOptional, int sortOrder
});




}
/// @nodoc
class __$ClothingCategoryCopyWithImpl<$Res>
    implements _$ClothingCategoryCopyWith<$Res> {
  __$ClothingCategoryCopyWithImpl(this._self, this._then);

  final _ClothingCategory _self;
  final $Res Function(_ClothingCategory) _then;

/// Create a copy of ClothingCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? groupType = null,Object? isOptional = null,Object? sortOrder = null,}) {
  return _then(_ClothingCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,groupType: null == groupType ? _self.groupType : groupType // ignore: cast_nullable_to_non_nullable
as CategoryGroup,isOptional: null == isOptional ? _self.isOptional : isOptional // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ClothingType {

@IdConverter() String get id;@IdConverter() String get categoryId; String get name; String get slug; bool get isOnePiece; int get sortOrder;
/// Create a copy of ClothingType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClothingTypeCopyWith<ClothingType> get copyWith => _$ClothingTypeCopyWithImpl<ClothingType>(this as ClothingType, _$identity);

  /// Serializes this ClothingType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClothingType&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.isOnePiece, isOnePiece) || other.isOnePiece == isOnePiece)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,name,slug,isOnePiece,sortOrder);

@override
String toString() {
  return 'ClothingType(id: $id, categoryId: $categoryId, name: $name, slug: $slug, isOnePiece: $isOnePiece, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $ClothingTypeCopyWith<$Res>  {
  factory $ClothingTypeCopyWith(ClothingType value, $Res Function(ClothingType) _then) = _$ClothingTypeCopyWithImpl;
@useResult
$Res call({
@IdConverter() String id,@IdConverter() String categoryId, String name, String slug, bool isOnePiece, int sortOrder
});




}
/// @nodoc
class _$ClothingTypeCopyWithImpl<$Res>
    implements $ClothingTypeCopyWith<$Res> {
  _$ClothingTypeCopyWithImpl(this._self, this._then);

  final ClothingType _self;
  final $Res Function(ClothingType) _then;

/// Create a copy of ClothingType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? categoryId = null,Object? name = null,Object? slug = null,Object? isOnePiece = null,Object? sortOrder = null,}) {
  return _then(ClothingType(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,isOnePiece: null == isOnePiece ? _self.isOnePiece : isOnePiece // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ClothingType].
extension ClothingTypePatterns on ClothingType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClothingType value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClothingType() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClothingType value)  $default,){
final _that = this;
switch (_that) {
case _ClothingType():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClothingType value)?  $default,){
final _that = this;
switch (_that) {
case _ClothingType() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String id, @IdConverter()  String categoryId,  String name,  String slug,  bool isOnePiece,  int sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClothingType() when $default != null:
return $default(_that.id,_that.categoryId,_that.name,_that.slug,_that.isOnePiece,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String id, @IdConverter()  String categoryId,  String name,  String slug,  bool isOnePiece,  int sortOrder)  $default,) {final _that = this;
switch (_that) {
case _ClothingType():
return $default(_that.id,_that.categoryId,_that.name,_that.slug,_that.isOnePiece,_that.sortOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String id, @IdConverter()  String categoryId,  String name,  String slug,  bool isOnePiece,  int sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _ClothingType() when $default != null:
return $default(_that.id,_that.categoryId,_that.name,_that.slug,_that.isOnePiece,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClothingType implements ClothingType {
  const _ClothingType({@IdConverter() required this.id, @IdConverter() required this.categoryId, required this.name, required this.slug, this.isOnePiece = false, this.sortOrder = 0});
  factory _ClothingType.fromJson(Map<String, dynamic> json) => _$ClothingTypeFromJson(json);

@override@IdConverter() final  String id;
@override@IdConverter() final  String categoryId;
@override final  String name;
@override final  String slug;
@override@JsonKey() final  bool isOnePiece;
@override@JsonKey() final  int sortOrder;

/// Create a copy of ClothingType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClothingTypeCopyWith<_ClothingType> get copyWith => __$ClothingTypeCopyWithImpl<_ClothingType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClothingTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClothingType&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.isOnePiece, isOnePiece) || other.isOnePiece == isOnePiece)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,name,slug,isOnePiece,sortOrder);

@override
String toString() {
  return 'ClothingType(id: $id, categoryId: $categoryId, name: $name, slug: $slug, isOnePiece: $isOnePiece, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$ClothingTypeCopyWith<$Res> implements $ClothingTypeCopyWith<$Res> {
  factory _$ClothingTypeCopyWith(_ClothingType value, $Res Function(_ClothingType) _then) = __$ClothingTypeCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String id,@IdConverter() String categoryId, String name, String slug, bool isOnePiece, int sortOrder
});




}
/// @nodoc
class __$ClothingTypeCopyWithImpl<$Res>
    implements _$ClothingTypeCopyWith<$Res> {
  __$ClothingTypeCopyWithImpl(this._self, this._then);

  final _ClothingType _self;
  final $Res Function(_ClothingType) _then;

/// Create a copy of ClothingType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = null,Object? name = null,Object? slug = null,Object? isOnePiece = null,Object? sortOrder = null,}) {
  return _then(_ClothingType(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,isOnePiece: null == isOnePiece ? _self.isOnePiece : isOnePiece // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CatalogColor {

@IdConverter() String get id; String get name; String get slug; String get hexCode; String get colorFamily; String? get temperature; double? get brightness; double? get saturation; bool get isNeutral;
/// Create a copy of CatalogColor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogColorCopyWith<CatalogColor> get copyWith => _$CatalogColorCopyWithImpl<CatalogColor>(this as CatalogColor, _$identity);

  /// Serializes this CatalogColor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogColor&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.hexCode, hexCode) || other.hexCode == hexCode)&&(identical(other.colorFamily, colorFamily) || other.colorFamily == colorFamily)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.saturation, saturation) || other.saturation == saturation)&&(identical(other.isNeutral, isNeutral) || other.isNeutral == isNeutral));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,hexCode,colorFamily,temperature,brightness,saturation,isNeutral);

@override
String toString() {
  return 'CatalogColor(id: $id, name: $name, slug: $slug, hexCode: $hexCode, colorFamily: $colorFamily, temperature: $temperature, brightness: $brightness, saturation: $saturation, isNeutral: $isNeutral)';
}


}

/// @nodoc
abstract mixin class $CatalogColorCopyWith<$Res>  {
  factory $CatalogColorCopyWith(CatalogColor value, $Res Function(CatalogColor) _then) = _$CatalogColorCopyWithImpl;
@useResult
$Res call({
@IdConverter() String id, String name, String slug, String hexCode, String colorFamily, String? temperature, double? brightness, double? saturation, bool isNeutral
});




}
/// @nodoc
class _$CatalogColorCopyWithImpl<$Res>
    implements $CatalogColorCopyWith<$Res> {
  _$CatalogColorCopyWithImpl(this._self, this._then);

  final CatalogColor _self;
  final $Res Function(CatalogColor) _then;

/// Create a copy of CatalogColor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? hexCode = null,Object? colorFamily = null,Object? temperature = freezed,Object? brightness = freezed,Object? saturation = freezed,Object? isNeutral = null,}) {
  return _then(CatalogColor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,hexCode: null == hexCode ? _self.hexCode : hexCode // ignore: cast_nullable_to_non_nullable
as String,colorFamily: null == colorFamily ? _self.colorFamily : colorFamily // ignore: cast_nullable_to_non_nullable
as String,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as String?,brightness: freezed == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as double?,saturation: freezed == saturation ? _self.saturation : saturation // ignore: cast_nullable_to_non_nullable
as double?,isNeutral: null == isNeutral ? _self.isNeutral : isNeutral // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogColor].
extension CatalogColorPatterns on CatalogColor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogColor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogColor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogColor value)  $default,){
final _that = this;
switch (_that) {
case _CatalogColor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogColor value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogColor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String name,  String slug,  String hexCode,  String colorFamily,  String? temperature,  double? brightness,  double? saturation,  bool isNeutral)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogColor() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.hexCode,_that.colorFamily,_that.temperature,_that.brightness,_that.saturation,_that.isNeutral);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String name,  String slug,  String hexCode,  String colorFamily,  String? temperature,  double? brightness,  double? saturation,  bool isNeutral)  $default,) {final _that = this;
switch (_that) {
case _CatalogColor():
return $default(_that.id,_that.name,_that.slug,_that.hexCode,_that.colorFamily,_that.temperature,_that.brightness,_that.saturation,_that.isNeutral);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String id,  String name,  String slug,  String hexCode,  String colorFamily,  String? temperature,  double? brightness,  double? saturation,  bool isNeutral)?  $default,) {final _that = this;
switch (_that) {
case _CatalogColor() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.hexCode,_that.colorFamily,_that.temperature,_that.brightness,_that.saturation,_that.isNeutral);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatalogColor extends CatalogColor {
  const _CatalogColor({@IdConverter() required this.id, required this.name, required this.slug, required this.hexCode, required this.colorFamily, this.temperature, this.brightness, this.saturation, this.isNeutral = false}): super._();
  factory _CatalogColor.fromJson(Map<String, dynamic> json) => _$CatalogColorFromJson(json);

@override@IdConverter() final  String id;
@override final  String name;
@override final  String slug;
@override final  String hexCode;
@override final  String colorFamily;
@override final  String? temperature;
@override final  double? brightness;
@override final  double? saturation;
@override@JsonKey() final  bool isNeutral;

/// Create a copy of CatalogColor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogColorCopyWith<_CatalogColor> get copyWith => __$CatalogColorCopyWithImpl<_CatalogColor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatalogColorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogColor&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.hexCode, hexCode) || other.hexCode == hexCode)&&(identical(other.colorFamily, colorFamily) || other.colorFamily == colorFamily)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.saturation, saturation) || other.saturation == saturation)&&(identical(other.isNeutral, isNeutral) || other.isNeutral == isNeutral));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,hexCode,colorFamily,temperature,brightness,saturation,isNeutral);

@override
String toString() {
  return 'CatalogColor(id: $id, name: $name, slug: $slug, hexCode: $hexCode, colorFamily: $colorFamily, temperature: $temperature, brightness: $brightness, saturation: $saturation, isNeutral: $isNeutral)';
}


}

/// @nodoc
abstract mixin class _$CatalogColorCopyWith<$Res> implements $CatalogColorCopyWith<$Res> {
  factory _$CatalogColorCopyWith(_CatalogColor value, $Res Function(_CatalogColor) _then) = __$CatalogColorCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String id, String name, String slug, String hexCode, String colorFamily, String? temperature, double? brightness, double? saturation, bool isNeutral
});




}
/// @nodoc
class __$CatalogColorCopyWithImpl<$Res>
    implements _$CatalogColorCopyWith<$Res> {
  __$CatalogColorCopyWithImpl(this._self, this._then);

  final _CatalogColor _self;
  final $Res Function(_CatalogColor) _then;

/// Create a copy of CatalogColor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? hexCode = null,Object? colorFamily = null,Object? temperature = freezed,Object? brightness = freezed,Object? saturation = freezed,Object? isNeutral = null,}) {
  return _then(_CatalogColor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,hexCode: null == hexCode ? _self.hexCode : hexCode // ignore: cast_nullable_to_non_nullable
as String,colorFamily: null == colorFamily ? _self.colorFamily : colorFamily // ignore: cast_nullable_to_non_nullable
as String,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as String?,brightness: freezed == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as double?,saturation: freezed == saturation ? _self.saturation : saturation // ignore: cast_nullable_to_non_nullable
as double?,isNeutral: null == isNeutral ? _self.isNeutral : isNeutral // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$OutfitStyle {

@IdConverter() String get id; String get name; String get slug; String? get description; int get sortOrder;
/// Create a copy of OutfitStyle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutfitStyleCopyWith<OutfitStyle> get copyWith => _$OutfitStyleCopyWithImpl<OutfitStyle>(this as OutfitStyle, _$identity);

  /// Serializes this OutfitStyle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutfitStyle&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,description,sortOrder);

@override
String toString() {
  return 'OutfitStyle(id: $id, name: $name, slug: $slug, description: $description, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $OutfitStyleCopyWith<$Res>  {
  factory $OutfitStyleCopyWith(OutfitStyle value, $Res Function(OutfitStyle) _then) = _$OutfitStyleCopyWithImpl;
@useResult
$Res call({
@IdConverter() String id, String name, String slug, String? description, int sortOrder
});




}
/// @nodoc
class _$OutfitStyleCopyWithImpl<$Res>
    implements $OutfitStyleCopyWith<$Res> {
  _$OutfitStyleCopyWithImpl(this._self, this._then);

  final OutfitStyle _self;
  final $Res Function(OutfitStyle) _then;

/// Create a copy of OutfitStyle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? description = freezed,Object? sortOrder = null,}) {
  return _then(OutfitStyle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OutfitStyle].
extension OutfitStylePatterns on OutfitStyle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OutfitStyle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OutfitStyle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OutfitStyle value)  $default,){
final _that = this;
switch (_that) {
case _OutfitStyle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OutfitStyle value)?  $default,){
final _that = this;
switch (_that) {
case _OutfitStyle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String name,  String slug,  String? description,  int sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OutfitStyle() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.description,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String name,  String slug,  String? description,  int sortOrder)  $default,) {final _that = this;
switch (_that) {
case _OutfitStyle():
return $default(_that.id,_that.name,_that.slug,_that.description,_that.sortOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String id,  String name,  String slug,  String? description,  int sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _OutfitStyle() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.description,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OutfitStyle implements OutfitStyle {
  const _OutfitStyle({@IdConverter() required this.id, required this.name, required this.slug, this.description, this.sortOrder = 0});
  factory _OutfitStyle.fromJson(Map<String, dynamic> json) => _$OutfitStyleFromJson(json);

@override@IdConverter() final  String id;
@override final  String name;
@override final  String slug;
@override final  String? description;
@override@JsonKey() final  int sortOrder;

/// Create a copy of OutfitStyle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutfitStyleCopyWith<_OutfitStyle> get copyWith => __$OutfitStyleCopyWithImpl<_OutfitStyle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OutfitStyleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutfitStyle&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,description,sortOrder);

@override
String toString() {
  return 'OutfitStyle(id: $id, name: $name, slug: $slug, description: $description, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$OutfitStyleCopyWith<$Res> implements $OutfitStyleCopyWith<$Res> {
  factory _$OutfitStyleCopyWith(_OutfitStyle value, $Res Function(_OutfitStyle) _then) = __$OutfitStyleCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String id, String name, String slug, String? description, int sortOrder
});




}
/// @nodoc
class __$OutfitStyleCopyWithImpl<$Res>
    implements _$OutfitStyleCopyWith<$Res> {
  __$OutfitStyleCopyWithImpl(this._self, this._then);

  final _OutfitStyle _self;
  final $Res Function(_OutfitStyle) _then;

/// Create a copy of OutfitStyle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? description = freezed,Object? sortOrder = null,}) {
  return _then(_OutfitStyle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Occasion {

@IdConverter() String get id; String get name; String get slug; String? get description; int get sortOrder;
/// Create a copy of Occasion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OccasionCopyWith<Occasion> get copyWith => _$OccasionCopyWithImpl<Occasion>(this as Occasion, _$identity);

  /// Serializes this Occasion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Occasion&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,description,sortOrder);

@override
String toString() {
  return 'Occasion(id: $id, name: $name, slug: $slug, description: $description, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $OccasionCopyWith<$Res>  {
  factory $OccasionCopyWith(Occasion value, $Res Function(Occasion) _then) = _$OccasionCopyWithImpl;
@useResult
$Res call({
@IdConverter() String id, String name, String slug, String? description, int sortOrder
});




}
/// @nodoc
class _$OccasionCopyWithImpl<$Res>
    implements $OccasionCopyWith<$Res> {
  _$OccasionCopyWithImpl(this._self, this._then);

  final Occasion _self;
  final $Res Function(Occasion) _then;

/// Create a copy of Occasion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? description = freezed,Object? sortOrder = null,}) {
  return _then(Occasion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Occasion].
extension OccasionPatterns on Occasion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Occasion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Occasion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Occasion value)  $default,){
final _that = this;
switch (_that) {
case _Occasion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Occasion value)?  $default,){
final _that = this;
switch (_that) {
case _Occasion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String name,  String slug,  String? description,  int sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Occasion() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.description,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String name,  String slug,  String? description,  int sortOrder)  $default,) {final _that = this;
switch (_that) {
case _Occasion():
return $default(_that.id,_that.name,_that.slug,_that.description,_that.sortOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String id,  String name,  String slug,  String? description,  int sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _Occasion() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.description,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Occasion implements Occasion {
  const _Occasion({@IdConverter() required this.id, required this.name, required this.slug, this.description, this.sortOrder = 0});
  factory _Occasion.fromJson(Map<String, dynamic> json) => _$OccasionFromJson(json);

@override@IdConverter() final  String id;
@override final  String name;
@override final  String slug;
@override final  String? description;
@override@JsonKey() final  int sortOrder;

/// Create a copy of Occasion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OccasionCopyWith<_Occasion> get copyWith => __$OccasionCopyWithImpl<_Occasion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OccasionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Occasion&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,description,sortOrder);

@override
String toString() {
  return 'Occasion(id: $id, name: $name, slug: $slug, description: $description, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$OccasionCopyWith<$Res> implements $OccasionCopyWith<$Res> {
  factory _$OccasionCopyWith(_Occasion value, $Res Function(_Occasion) _then) = __$OccasionCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String id, String name, String slug, String? description, int sortOrder
});




}
/// @nodoc
class __$OccasionCopyWithImpl<$Res>
    implements _$OccasionCopyWith<$Res> {
  __$OccasionCopyWithImpl(this._self, this._then);

  final _Occasion _self;
  final $Res Function(_Occasion) _then;

/// Create a copy of Occasion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? description = freezed,Object? sortOrder = null,}) {
  return _then(_Occasion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CatalogVersion {

 String get catalogVersion; String get rulesVersion;@UtcDateTimeConverter() DateTime get updatedAt;
/// Create a copy of CatalogVersion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogVersionCopyWith<CatalogVersion> get copyWith => _$CatalogVersionCopyWithImpl<CatalogVersion>(this as CatalogVersion, _$identity);

  /// Serializes this CatalogVersion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogVersion&&(identical(other.catalogVersion, catalogVersion) || other.catalogVersion == catalogVersion)&&(identical(other.rulesVersion, rulesVersion) || other.rulesVersion == rulesVersion)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,catalogVersion,rulesVersion,updatedAt);

@override
String toString() {
  return 'CatalogVersion(catalogVersion: $catalogVersion, rulesVersion: $rulesVersion, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CatalogVersionCopyWith<$Res>  {
  factory $CatalogVersionCopyWith(CatalogVersion value, $Res Function(CatalogVersion) _then) = _$CatalogVersionCopyWithImpl;
@useResult
$Res call({
 String catalogVersion, String rulesVersion,@UtcDateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class _$CatalogVersionCopyWithImpl<$Res>
    implements $CatalogVersionCopyWith<$Res> {
  _$CatalogVersionCopyWithImpl(this._self, this._then);

  final CatalogVersion _self;
  final $Res Function(CatalogVersion) _then;

/// Create a copy of CatalogVersion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? catalogVersion = null,Object? rulesVersion = null,Object? updatedAt = null,}) {
  return _then(CatalogVersion(
catalogVersion: null == catalogVersion ? _self.catalogVersion : catalogVersion // ignore: cast_nullable_to_non_nullable
as String,rulesVersion: null == rulesVersion ? _self.rulesVersion : rulesVersion // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogVersion].
extension CatalogVersionPatterns on CatalogVersion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogVersion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogVersion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogVersion value)  $default,){
final _that = this;
switch (_that) {
case _CatalogVersion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogVersion value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogVersion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String catalogVersion,  String rulesVersion, @UtcDateTimeConverter()  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogVersion() when $default != null:
return $default(_that.catalogVersion,_that.rulesVersion,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String catalogVersion,  String rulesVersion, @UtcDateTimeConverter()  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CatalogVersion():
return $default(_that.catalogVersion,_that.rulesVersion,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String catalogVersion,  String rulesVersion, @UtcDateTimeConverter()  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CatalogVersion() when $default != null:
return $default(_that.catalogVersion,_that.rulesVersion,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatalogVersion implements CatalogVersion {
  const _CatalogVersion({required this.catalogVersion, required this.rulesVersion, @UtcDateTimeConverter() required this.updatedAt});
  factory _CatalogVersion.fromJson(Map<String, dynamic> json) => _$CatalogVersionFromJson(json);

@override final  String catalogVersion;
@override final  String rulesVersion;
@override@UtcDateTimeConverter() final  DateTime updatedAt;

/// Create a copy of CatalogVersion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogVersionCopyWith<_CatalogVersion> get copyWith => __$CatalogVersionCopyWithImpl<_CatalogVersion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatalogVersionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogVersion&&(identical(other.catalogVersion, catalogVersion) || other.catalogVersion == catalogVersion)&&(identical(other.rulesVersion, rulesVersion) || other.rulesVersion == rulesVersion)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,catalogVersion,rulesVersion,updatedAt);

@override
String toString() {
  return 'CatalogVersion(catalogVersion: $catalogVersion, rulesVersion: $rulesVersion, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CatalogVersionCopyWith<$Res> implements $CatalogVersionCopyWith<$Res> {
  factory _$CatalogVersionCopyWith(_CatalogVersion value, $Res Function(_CatalogVersion) _then) = __$CatalogVersionCopyWithImpl;
@override @useResult
$Res call({
 String catalogVersion, String rulesVersion,@UtcDateTimeConverter() DateTime updatedAt
});




}
/// @nodoc
class __$CatalogVersionCopyWithImpl<$Res>
    implements _$CatalogVersionCopyWith<$Res> {
  __$CatalogVersionCopyWithImpl(this._self, this._then);

  final _CatalogVersion _self;
  final $Res Function(_CatalogVersion) _then;

/// Create a copy of CatalogVersion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? catalogVersion = null,Object? rulesVersion = null,Object? updatedAt = null,}) {
  return _then(_CatalogVersion(
catalogVersion: null == catalogVersion ? _self.catalogVersion : catalogVersion // ignore: cast_nullable_to_non_nullable
as String,rulesVersion: null == rulesVersion ? _self.rulesVersion : rulesVersion // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$ColorFamilyGuide {

 String get slug; String get name; String get description; bool get isNeutral;@IdListConverter() List<String> get colorIds;@IdListConverter() List<String> get pairsWellWithColorIds;
/// Create a copy of ColorFamilyGuide
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ColorFamilyGuideCopyWith<ColorFamilyGuide> get copyWith => _$ColorFamilyGuideCopyWithImpl<ColorFamilyGuide>(this as ColorFamilyGuide, _$identity);

  /// Serializes this ColorFamilyGuide to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColorFamilyGuide&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.isNeutral, isNeutral) || other.isNeutral == isNeutral)&&const DeepCollectionEquality().equals(other.colorIds, colorIds)&&const DeepCollectionEquality().equals(other.pairsWellWithColorIds, pairsWellWithColorIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slug,name,description,isNeutral,const DeepCollectionEquality().hash(colorIds),const DeepCollectionEquality().hash(pairsWellWithColorIds));

@override
String toString() {
  return 'ColorFamilyGuide(slug: $slug, name: $name, description: $description, isNeutral: $isNeutral, colorIds: $colorIds, pairsWellWithColorIds: $pairsWellWithColorIds)';
}


}

/// @nodoc
abstract mixin class $ColorFamilyGuideCopyWith<$Res>  {
  factory $ColorFamilyGuideCopyWith(ColorFamilyGuide value, $Res Function(ColorFamilyGuide) _then) = _$ColorFamilyGuideCopyWithImpl;
@useResult
$Res call({
 String slug, String name, String description, bool isNeutral,@IdListConverter() List<String> colorIds,@IdListConverter() List<String> pairsWellWithColorIds
});




}
/// @nodoc
class _$ColorFamilyGuideCopyWithImpl<$Res>
    implements $ColorFamilyGuideCopyWith<$Res> {
  _$ColorFamilyGuideCopyWithImpl(this._self, this._then);

  final ColorFamilyGuide _self;
  final $Res Function(ColorFamilyGuide) _then;

/// Create a copy of ColorFamilyGuide
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slug = null,Object? name = null,Object? description = null,Object? isNeutral = null,Object? colorIds = null,Object? pairsWellWithColorIds = null,}) {
  return _then(ColorFamilyGuide(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isNeutral: null == isNeutral ? _self.isNeutral : isNeutral // ignore: cast_nullable_to_non_nullable
as bool,colorIds: null == colorIds ? _self.colorIds : colorIds // ignore: cast_nullable_to_non_nullable
as List<String>,pairsWellWithColorIds: null == pairsWellWithColorIds ? _self.pairsWellWithColorIds : pairsWellWithColorIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ColorFamilyGuide].
extension ColorFamilyGuidePatterns on ColorFamilyGuide {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ColorFamilyGuide value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ColorFamilyGuide() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ColorFamilyGuide value)  $default,){
final _that = this;
switch (_that) {
case _ColorFamilyGuide():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ColorFamilyGuide value)?  $default,){
final _that = this;
switch (_that) {
case _ColorFamilyGuide() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String slug,  String name,  String description,  bool isNeutral, @IdListConverter()  List<String> colorIds, @IdListConverter()  List<String> pairsWellWithColorIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ColorFamilyGuide() when $default != null:
return $default(_that.slug,_that.name,_that.description,_that.isNeutral,_that.colorIds,_that.pairsWellWithColorIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String slug,  String name,  String description,  bool isNeutral, @IdListConverter()  List<String> colorIds, @IdListConverter()  List<String> pairsWellWithColorIds)  $default,) {final _that = this;
switch (_that) {
case _ColorFamilyGuide():
return $default(_that.slug,_that.name,_that.description,_that.isNeutral,_that.colorIds,_that.pairsWellWithColorIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String slug,  String name,  String description,  bool isNeutral, @IdListConverter()  List<String> colorIds, @IdListConverter()  List<String> pairsWellWithColorIds)?  $default,) {final _that = this;
switch (_that) {
case _ColorFamilyGuide() when $default != null:
return $default(_that.slug,_that.name,_that.description,_that.isNeutral,_that.colorIds,_that.pairsWellWithColorIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ColorFamilyGuide implements ColorFamilyGuide {
  const _ColorFamilyGuide({required this.slug, required this.name, required this.description, this.isNeutral = false, @IdListConverter() required  List<String> colorIds, @IdListConverter()  List<String> pairsWellWithColorIds = const []}): _colorIds = colorIds,_pairsWellWithColorIds = pairsWellWithColorIds;
  factory _ColorFamilyGuide.fromJson(Map<String, dynamic> json) => _$ColorFamilyGuideFromJson(json);

@override final  String slug;
@override final  String name;
@override final  String description;
@override@JsonKey() final  bool isNeutral;
 final  List<String> _colorIds;
@override@IdListConverter() List<String> get colorIds {
  if (_colorIds is EqualUnmodifiableListView) return _colorIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_colorIds);
}

 final  List<String> _pairsWellWithColorIds;
@override@JsonKey()@IdListConverter() List<String> get pairsWellWithColorIds {
  if (_pairsWellWithColorIds is EqualUnmodifiableListView) return _pairsWellWithColorIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pairsWellWithColorIds);
}


/// Create a copy of ColorFamilyGuide
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ColorFamilyGuideCopyWith<_ColorFamilyGuide> get copyWith => __$ColorFamilyGuideCopyWithImpl<_ColorFamilyGuide>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ColorFamilyGuideToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ColorFamilyGuide&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.isNeutral, isNeutral) || other.isNeutral == isNeutral)&&const DeepCollectionEquality().equals(other._colorIds, _colorIds)&&const DeepCollectionEquality().equals(other._pairsWellWithColorIds, _pairsWellWithColorIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slug,name,description,isNeutral,const DeepCollectionEquality().hash(_colorIds),const DeepCollectionEquality().hash(_pairsWellWithColorIds));

@override
String toString() {
  return 'ColorFamilyGuide(slug: $slug, name: $name, description: $description, isNeutral: $isNeutral, colorIds: $colorIds, pairsWellWithColorIds: $pairsWellWithColorIds)';
}


}

/// @nodoc
abstract mixin class _$ColorFamilyGuideCopyWith<$Res> implements $ColorFamilyGuideCopyWith<$Res> {
  factory _$ColorFamilyGuideCopyWith(_ColorFamilyGuide value, $Res Function(_ColorFamilyGuide) _then) = __$ColorFamilyGuideCopyWithImpl;
@override @useResult
$Res call({
 String slug, String name, String description, bool isNeutral,@IdListConverter() List<String> colorIds,@IdListConverter() List<String> pairsWellWithColorIds
});




}
/// @nodoc
class __$ColorFamilyGuideCopyWithImpl<$Res>
    implements _$ColorFamilyGuideCopyWith<$Res> {
  __$ColorFamilyGuideCopyWithImpl(this._self, this._then);

  final _ColorFamilyGuide _self;
  final $Res Function(_ColorFamilyGuide) _then;

/// Create a copy of ColorFamilyGuide
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slug = null,Object? name = null,Object? description = null,Object? isNeutral = null,Object? colorIds = null,Object? pairsWellWithColorIds = null,}) {
  return _then(_ColorFamilyGuide(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isNeutral: null == isNeutral ? _self.isNeutral : isNeutral // ignore: cast_nullable_to_non_nullable
as bool,colorIds: null == colorIds ? _self._colorIds : colorIds // ignore: cast_nullable_to_non_nullable
as List<String>,pairsWellWithColorIds: null == pairsWellWithColorIds ? _self._pairsWellWithColorIds : pairsWellWithColorIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$GuidePrinciple {

 String get slug; String get title; String get body;@IdListConverter() List<String> get exampleColorIds;
/// Create a copy of GuidePrinciple
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuidePrincipleCopyWith<GuidePrinciple> get copyWith => _$GuidePrincipleCopyWithImpl<GuidePrinciple>(this as GuidePrinciple, _$identity);

  /// Serializes this GuidePrinciple to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuidePrinciple&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&const DeepCollectionEquality().equals(other.exampleColorIds, exampleColorIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slug,title,body,const DeepCollectionEquality().hash(exampleColorIds));

@override
String toString() {
  return 'GuidePrinciple(slug: $slug, title: $title, body: $body, exampleColorIds: $exampleColorIds)';
}


}

/// @nodoc
abstract mixin class $GuidePrincipleCopyWith<$Res>  {
  factory $GuidePrincipleCopyWith(GuidePrinciple value, $Res Function(GuidePrinciple) _then) = _$GuidePrincipleCopyWithImpl;
@useResult
$Res call({
 String slug, String title, String body,@IdListConverter() List<String> exampleColorIds
});




}
/// @nodoc
class _$GuidePrincipleCopyWithImpl<$Res>
    implements $GuidePrincipleCopyWith<$Res> {
  _$GuidePrincipleCopyWithImpl(this._self, this._then);

  final GuidePrinciple _self;
  final $Res Function(GuidePrinciple) _then;

/// Create a copy of GuidePrinciple
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slug = null,Object? title = null,Object? body = null,Object? exampleColorIds = null,}) {
  return _then(GuidePrinciple(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,exampleColorIds: null == exampleColorIds ? _self.exampleColorIds : exampleColorIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [GuidePrinciple].
extension GuidePrinciplePatterns on GuidePrinciple {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuidePrinciple value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuidePrinciple() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuidePrinciple value)  $default,){
final _that = this;
switch (_that) {
case _GuidePrinciple():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuidePrinciple value)?  $default,){
final _that = this;
switch (_that) {
case _GuidePrinciple() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String slug,  String title,  String body, @IdListConverter()  List<String> exampleColorIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuidePrinciple() when $default != null:
return $default(_that.slug,_that.title,_that.body,_that.exampleColorIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String slug,  String title,  String body, @IdListConverter()  List<String> exampleColorIds)  $default,) {final _that = this;
switch (_that) {
case _GuidePrinciple():
return $default(_that.slug,_that.title,_that.body,_that.exampleColorIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String slug,  String title,  String body, @IdListConverter()  List<String> exampleColorIds)?  $default,) {final _that = this;
switch (_that) {
case _GuidePrinciple() when $default != null:
return $default(_that.slug,_that.title,_that.body,_that.exampleColorIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GuidePrinciple implements GuidePrinciple {
  const _GuidePrinciple({required this.slug, required this.title, required this.body, @IdListConverter()  List<String> exampleColorIds = const []}): _exampleColorIds = exampleColorIds;
  factory _GuidePrinciple.fromJson(Map<String, dynamic> json) => _$GuidePrincipleFromJson(json);

@override final  String slug;
@override final  String title;
@override final  String body;
 final  List<String> _exampleColorIds;
@override@JsonKey()@IdListConverter() List<String> get exampleColorIds {
  if (_exampleColorIds is EqualUnmodifiableListView) return _exampleColorIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exampleColorIds);
}


/// Create a copy of GuidePrinciple
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuidePrincipleCopyWith<_GuidePrinciple> get copyWith => __$GuidePrincipleCopyWithImpl<_GuidePrinciple>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuidePrincipleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuidePrinciple&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&const DeepCollectionEquality().equals(other._exampleColorIds, _exampleColorIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slug,title,body,const DeepCollectionEquality().hash(_exampleColorIds));

@override
String toString() {
  return 'GuidePrinciple(slug: $slug, title: $title, body: $body, exampleColorIds: $exampleColorIds)';
}


}

/// @nodoc
abstract mixin class _$GuidePrincipleCopyWith<$Res> implements $GuidePrincipleCopyWith<$Res> {
  factory _$GuidePrincipleCopyWith(_GuidePrinciple value, $Res Function(_GuidePrinciple) _then) = __$GuidePrincipleCopyWithImpl;
@override @useResult
$Res call({
 String slug, String title, String body,@IdListConverter() List<String> exampleColorIds
});




}
/// @nodoc
class __$GuidePrincipleCopyWithImpl<$Res>
    implements _$GuidePrincipleCopyWith<$Res> {
  __$GuidePrincipleCopyWithImpl(this._self, this._then);

  final _GuidePrinciple _self;
  final $Res Function(_GuidePrinciple) _then;

/// Create a copy of GuidePrinciple
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slug = null,Object? title = null,Object? body = null,Object? exampleColorIds = null,}) {
  return _then(_GuidePrinciple(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,exampleColorIds: null == exampleColorIds ? _self._exampleColorIds : exampleColorIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$ColorGuide {

 List<ColorFamilyGuide> get families; List<GuidePrinciple> get principles;
/// Create a copy of ColorGuide
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ColorGuideCopyWith<ColorGuide> get copyWith => _$ColorGuideCopyWithImpl<ColorGuide>(this as ColorGuide, _$identity);

  /// Serializes this ColorGuide to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColorGuide&&const DeepCollectionEquality().equals(other.families, families)&&const DeepCollectionEquality().equals(other.principles, principles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(families),const DeepCollectionEquality().hash(principles));

@override
String toString() {
  return 'ColorGuide(families: $families, principles: $principles)';
}


}

/// @nodoc
abstract mixin class $ColorGuideCopyWith<$Res>  {
  factory $ColorGuideCopyWith(ColorGuide value, $Res Function(ColorGuide) _then) = _$ColorGuideCopyWithImpl;
@useResult
$Res call({
 List<ColorFamilyGuide> families, List<GuidePrinciple> principles
});




}
/// @nodoc
class _$ColorGuideCopyWithImpl<$Res>
    implements $ColorGuideCopyWith<$Res> {
  _$ColorGuideCopyWithImpl(this._self, this._then);

  final ColorGuide _self;
  final $Res Function(ColorGuide) _then;

/// Create a copy of ColorGuide
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? families = null,Object? principles = null,}) {
  return _then(ColorGuide(
families: null == families ? _self.families : families // ignore: cast_nullable_to_non_nullable
as List<ColorFamilyGuide>,principles: null == principles ? _self.principles : principles // ignore: cast_nullable_to_non_nullable
as List<GuidePrinciple>,
  ));
}

}


/// Adds pattern-matching-related methods to [ColorGuide].
extension ColorGuidePatterns on ColorGuide {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ColorGuide value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ColorGuide() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ColorGuide value)  $default,){
final _that = this;
switch (_that) {
case _ColorGuide():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ColorGuide value)?  $default,){
final _that = this;
switch (_that) {
case _ColorGuide() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ColorFamilyGuide> families,  List<GuidePrinciple> principles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ColorGuide() when $default != null:
return $default(_that.families,_that.principles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ColorFamilyGuide> families,  List<GuidePrinciple> principles)  $default,) {final _that = this;
switch (_that) {
case _ColorGuide():
return $default(_that.families,_that.principles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ColorFamilyGuide> families,  List<GuidePrinciple> principles)?  $default,) {final _that = this;
switch (_that) {
case _ColorGuide() when $default != null:
return $default(_that.families,_that.principles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ColorGuide implements ColorGuide {
  const _ColorGuide({required  List<ColorFamilyGuide> families, required  List<GuidePrinciple> principles}): _families = families,_principles = principles;
  factory _ColorGuide.fromJson(Map<String, dynamic> json) => _$ColorGuideFromJson(json);

 final  List<ColorFamilyGuide> _families;
@override List<ColorFamilyGuide> get families {
  if (_families is EqualUnmodifiableListView) return _families;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_families);
}

 final  List<GuidePrinciple> _principles;
@override List<GuidePrinciple> get principles {
  if (_principles is EqualUnmodifiableListView) return _principles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_principles);
}


/// Create a copy of ColorGuide
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ColorGuideCopyWith<_ColorGuide> get copyWith => __$ColorGuideCopyWithImpl<_ColorGuide>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ColorGuideToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ColorGuide&&const DeepCollectionEquality().equals(other._families, _families)&&const DeepCollectionEquality().equals(other._principles, _principles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_families),const DeepCollectionEquality().hash(_principles));

@override
String toString() {
  return 'ColorGuide(families: $families, principles: $principles)';
}


}

/// @nodoc
abstract mixin class _$ColorGuideCopyWith<$Res> implements $ColorGuideCopyWith<$Res> {
  factory _$ColorGuideCopyWith(_ColorGuide value, $Res Function(_ColorGuide) _then) = __$ColorGuideCopyWithImpl;
@override @useResult
$Res call({
 List<ColorFamilyGuide> families, List<GuidePrinciple> principles
});




}
/// @nodoc
class __$ColorGuideCopyWithImpl<$Res>
    implements _$ColorGuideCopyWith<$Res> {
  __$ColorGuideCopyWithImpl(this._self, this._then);

  final _ColorGuide _self;
  final $Res Function(_ColorGuide) _then;

/// Create a copy of ColorGuide
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? families = null,Object? principles = null,}) {
  return _then(_ColorGuide(
families: null == families ? _self._families : families // ignore: cast_nullable_to_non_nullable
as List<ColorFamilyGuide>,principles: null == principles ? _self._principles : principles // ignore: cast_nullable_to_non_nullable
as List<GuidePrinciple>,
  ));
}


}


/// @nodoc
mixin _$ColorPairingRule {

@IdConverter() String get id;@IdConverter() String get colorAId;@IdConverter() String get colorBId; PairingRuleType get ruleType; double get compatibilityScore; String get explanation; String get ruleVersion;
/// Create a copy of ColorPairingRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ColorPairingRuleCopyWith<ColorPairingRule> get copyWith => _$ColorPairingRuleCopyWithImpl<ColorPairingRule>(this as ColorPairingRule, _$identity);

  /// Serializes this ColorPairingRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColorPairingRule&&(identical(other.id, id) || other.id == id)&&(identical(other.colorAId, colorAId) || other.colorAId == colorAId)&&(identical(other.colorBId, colorBId) || other.colorBId == colorBId)&&(identical(other.ruleType, ruleType) || other.ruleType == ruleType)&&(identical(other.compatibilityScore, compatibilityScore) || other.compatibilityScore == compatibilityScore)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.ruleVersion, ruleVersion) || other.ruleVersion == ruleVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,colorAId,colorBId,ruleType,compatibilityScore,explanation,ruleVersion);

@override
String toString() {
  return 'ColorPairingRule(id: $id, colorAId: $colorAId, colorBId: $colorBId, ruleType: $ruleType, compatibilityScore: $compatibilityScore, explanation: $explanation, ruleVersion: $ruleVersion)';
}


}

/// @nodoc
abstract mixin class $ColorPairingRuleCopyWith<$Res>  {
  factory $ColorPairingRuleCopyWith(ColorPairingRule value, $Res Function(ColorPairingRule) _then) = _$ColorPairingRuleCopyWithImpl;
@useResult
$Res call({
@IdConverter() String id,@IdConverter() String colorAId,@IdConverter() String colorBId, PairingRuleType ruleType, double compatibilityScore, String explanation, String ruleVersion
});




}
/// @nodoc
class _$ColorPairingRuleCopyWithImpl<$Res>
    implements $ColorPairingRuleCopyWith<$Res> {
  _$ColorPairingRuleCopyWithImpl(this._self, this._then);

  final ColorPairingRule _self;
  final $Res Function(ColorPairingRule) _then;

/// Create a copy of ColorPairingRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? colorAId = null,Object? colorBId = null,Object? ruleType = null,Object? compatibilityScore = null,Object? explanation = null,Object? ruleVersion = null,}) {
  return _then(ColorPairingRule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,colorAId: null == colorAId ? _self.colorAId : colorAId // ignore: cast_nullable_to_non_nullable
as String,colorBId: null == colorBId ? _self.colorBId : colorBId // ignore: cast_nullable_to_non_nullable
as String,ruleType: null == ruleType ? _self.ruleType : ruleType // ignore: cast_nullable_to_non_nullable
as PairingRuleType,compatibilityScore: null == compatibilityScore ? _self.compatibilityScore : compatibilityScore // ignore: cast_nullable_to_non_nullable
as double,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,ruleVersion: null == ruleVersion ? _self.ruleVersion : ruleVersion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ColorPairingRule].
extension ColorPairingRulePatterns on ColorPairingRule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ColorPairingRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ColorPairingRule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ColorPairingRule value)  $default,){
final _that = this;
switch (_that) {
case _ColorPairingRule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ColorPairingRule value)?  $default,){
final _that = this;
switch (_that) {
case _ColorPairingRule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String id, @IdConverter()  String colorAId, @IdConverter()  String colorBId,  PairingRuleType ruleType,  double compatibilityScore,  String explanation,  String ruleVersion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ColorPairingRule() when $default != null:
return $default(_that.id,_that.colorAId,_that.colorBId,_that.ruleType,_that.compatibilityScore,_that.explanation,_that.ruleVersion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String id, @IdConverter()  String colorAId, @IdConverter()  String colorBId,  PairingRuleType ruleType,  double compatibilityScore,  String explanation,  String ruleVersion)  $default,) {final _that = this;
switch (_that) {
case _ColorPairingRule():
return $default(_that.id,_that.colorAId,_that.colorBId,_that.ruleType,_that.compatibilityScore,_that.explanation,_that.ruleVersion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String id, @IdConverter()  String colorAId, @IdConverter()  String colorBId,  PairingRuleType ruleType,  double compatibilityScore,  String explanation,  String ruleVersion)?  $default,) {final _that = this;
switch (_that) {
case _ColorPairingRule() when $default != null:
return $default(_that.id,_that.colorAId,_that.colorBId,_that.ruleType,_that.compatibilityScore,_that.explanation,_that.ruleVersion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ColorPairingRule implements ColorPairingRule {
  const _ColorPairingRule({@IdConverter() required this.id, @IdConverter() required this.colorAId, @IdConverter() required this.colorBId, required this.ruleType, required this.compatibilityScore, required this.explanation, required this.ruleVersion});
  factory _ColorPairingRule.fromJson(Map<String, dynamic> json) => _$ColorPairingRuleFromJson(json);

@override@IdConverter() final  String id;
@override@IdConverter() final  String colorAId;
@override@IdConverter() final  String colorBId;
@override final  PairingRuleType ruleType;
@override final  double compatibilityScore;
@override final  String explanation;
@override final  String ruleVersion;

/// Create a copy of ColorPairingRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ColorPairingRuleCopyWith<_ColorPairingRule> get copyWith => __$ColorPairingRuleCopyWithImpl<_ColorPairingRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ColorPairingRuleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ColorPairingRule&&(identical(other.id, id) || other.id == id)&&(identical(other.colorAId, colorAId) || other.colorAId == colorAId)&&(identical(other.colorBId, colorBId) || other.colorBId == colorBId)&&(identical(other.ruleType, ruleType) || other.ruleType == ruleType)&&(identical(other.compatibilityScore, compatibilityScore) || other.compatibilityScore == compatibilityScore)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.ruleVersion, ruleVersion) || other.ruleVersion == ruleVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,colorAId,colorBId,ruleType,compatibilityScore,explanation,ruleVersion);

@override
String toString() {
  return 'ColorPairingRule(id: $id, colorAId: $colorAId, colorBId: $colorBId, ruleType: $ruleType, compatibilityScore: $compatibilityScore, explanation: $explanation, ruleVersion: $ruleVersion)';
}


}

/// @nodoc
abstract mixin class _$ColorPairingRuleCopyWith<$Res> implements $ColorPairingRuleCopyWith<$Res> {
  factory _$ColorPairingRuleCopyWith(_ColorPairingRule value, $Res Function(_ColorPairingRule) _then) = __$ColorPairingRuleCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String id,@IdConverter() String colorAId,@IdConverter() String colorBId, PairingRuleType ruleType, double compatibilityScore, String explanation, String ruleVersion
});




}
/// @nodoc
class __$ColorPairingRuleCopyWithImpl<$Res>
    implements _$ColorPairingRuleCopyWith<$Res> {
  __$ColorPairingRuleCopyWithImpl(this._self, this._then);

  final _ColorPairingRule _self;
  final $Res Function(_ColorPairingRule) _then;

/// Create a copy of ColorPairingRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? colorAId = null,Object? colorBId = null,Object? ruleType = null,Object? compatibilityScore = null,Object? explanation = null,Object? ruleVersion = null,}) {
  return _then(_ColorPairingRule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,colorAId: null == colorAId ? _self.colorAId : colorAId // ignore: cast_nullable_to_non_nullable
as String,colorBId: null == colorBId ? _self.colorBId : colorBId // ignore: cast_nullable_to_non_nullable
as String,ruleType: null == ruleType ? _self.ruleType : ruleType // ignore: cast_nullable_to_non_nullable
as PairingRuleType,compatibilityScore: null == compatibilityScore ? _self.compatibilityScore : compatibilityScore // ignore: cast_nullable_to_non_nullable
as double,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,ruleVersion: null == ruleVersion ? _self.ruleVersion : ruleVersion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RecommendationRule {

@IdConverter() String get id; String get name; RecommendationRuleType get ruleType; Map<String, String> get conditionsJson; double get weight; String get explanation; String get version;
/// Create a copy of RecommendationRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendationRuleCopyWith<RecommendationRule> get copyWith => _$RecommendationRuleCopyWithImpl<RecommendationRule>(this as RecommendationRule, _$identity);

  /// Serializes this RecommendationRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendationRule&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.ruleType, ruleType) || other.ruleType == ruleType)&&const DeepCollectionEquality().equals(other.conditionsJson, conditionsJson)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,ruleType,const DeepCollectionEquality().hash(conditionsJson),weight,explanation,version);

@override
String toString() {
  return 'RecommendationRule(id: $id, name: $name, ruleType: $ruleType, conditionsJson: $conditionsJson, weight: $weight, explanation: $explanation, version: $version)';
}


}

/// @nodoc
abstract mixin class $RecommendationRuleCopyWith<$Res>  {
  factory $RecommendationRuleCopyWith(RecommendationRule value, $Res Function(RecommendationRule) _then) = _$RecommendationRuleCopyWithImpl;
@useResult
$Res call({
@IdConverter() String id, String name, RecommendationRuleType ruleType, Map<String, String> conditionsJson, double weight, String explanation, String version
});




}
/// @nodoc
class _$RecommendationRuleCopyWithImpl<$Res>
    implements $RecommendationRuleCopyWith<$Res> {
  _$RecommendationRuleCopyWithImpl(this._self, this._then);

  final RecommendationRule _self;
  final $Res Function(RecommendationRule) _then;

/// Create a copy of RecommendationRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? ruleType = null,Object? conditionsJson = null,Object? weight = null,Object? explanation = null,Object? version = null,}) {
  return _then(RecommendationRule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,ruleType: null == ruleType ? _self.ruleType : ruleType // ignore: cast_nullable_to_non_nullable
as RecommendationRuleType,conditionsJson: null == conditionsJson ? _self.conditionsJson : conditionsJson // ignore: cast_nullable_to_non_nullable
as Map<String, String>,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RecommendationRule].
extension RecommendationRulePatterns on RecommendationRule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendationRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendationRule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendationRule value)  $default,){
final _that = this;
switch (_that) {
case _RecommendationRule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendationRule value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendationRule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String name,  RecommendationRuleType ruleType,  Map<String, String> conditionsJson,  double weight,  String explanation,  String version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendationRule() when $default != null:
return $default(_that.id,_that.name,_that.ruleType,_that.conditionsJson,_that.weight,_that.explanation,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String name,  RecommendationRuleType ruleType,  Map<String, String> conditionsJson,  double weight,  String explanation,  String version)  $default,) {final _that = this;
switch (_that) {
case _RecommendationRule():
return $default(_that.id,_that.name,_that.ruleType,_that.conditionsJson,_that.weight,_that.explanation,_that.version);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String id,  String name,  RecommendationRuleType ruleType,  Map<String, String> conditionsJson,  double weight,  String explanation,  String version)?  $default,) {final _that = this;
switch (_that) {
case _RecommendationRule() when $default != null:
return $default(_that.id,_that.name,_that.ruleType,_that.conditionsJson,_that.weight,_that.explanation,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendationRule implements RecommendationRule {
  const _RecommendationRule({@IdConverter() required this.id, required this.name, required this.ruleType, required  Map<String, String> conditionsJson, required this.weight, required this.explanation, required this.version}): _conditionsJson = conditionsJson;
  factory _RecommendationRule.fromJson(Map<String, dynamic> json) => _$RecommendationRuleFromJson(json);

@override@IdConverter() final  String id;
@override final  String name;
@override final  RecommendationRuleType ruleType;
 final  Map<String, String> _conditionsJson;
@override Map<String, String> get conditionsJson {
  if (_conditionsJson is EqualUnmodifiableMapView) return _conditionsJson;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_conditionsJson);
}

@override final  double weight;
@override final  String explanation;
@override final  String version;

/// Create a copy of RecommendationRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendationRuleCopyWith<_RecommendationRule> get copyWith => __$RecommendationRuleCopyWithImpl<_RecommendationRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendationRuleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendationRule&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.ruleType, ruleType) || other.ruleType == ruleType)&&const DeepCollectionEquality().equals(other._conditionsJson, _conditionsJson)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,ruleType,const DeepCollectionEquality().hash(_conditionsJson),weight,explanation,version);

@override
String toString() {
  return 'RecommendationRule(id: $id, name: $name, ruleType: $ruleType, conditionsJson: $conditionsJson, weight: $weight, explanation: $explanation, version: $version)';
}


}

/// @nodoc
abstract mixin class _$RecommendationRuleCopyWith<$Res> implements $RecommendationRuleCopyWith<$Res> {
  factory _$RecommendationRuleCopyWith(_RecommendationRule value, $Res Function(_RecommendationRule) _then) = __$RecommendationRuleCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String id, String name, RecommendationRuleType ruleType, Map<String, String> conditionsJson, double weight, String explanation, String version
});




}
/// @nodoc
class __$RecommendationRuleCopyWithImpl<$Res>
    implements _$RecommendationRuleCopyWith<$Res> {
  __$RecommendationRuleCopyWithImpl(this._self, this._then);

  final _RecommendationRule _self;
  final $Res Function(_RecommendationRule) _then;

/// Create a copy of RecommendationRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? ruleType = null,Object? conditionsJson = null,Object? weight = null,Object? explanation = null,Object? version = null,}) {
  return _then(_RecommendationRule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,ruleType: null == ruleType ? _self.ruleType : ruleType // ignore: cast_nullable_to_non_nullable
as RecommendationRuleType,conditionsJson: null == conditionsJson ? _self._conditionsJson : conditionsJson // ignore: cast_nullable_to_non_nullable
as Map<String, String>,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
