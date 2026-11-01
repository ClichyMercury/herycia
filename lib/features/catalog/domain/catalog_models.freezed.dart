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
mixin _$CatalogRef {

@IdConverter() String get id; String get slug; String get name;
/// Create a copy of CatalogRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogRefCopyWith<CatalogRef> get copyWith => _$CatalogRefCopyWithImpl<CatalogRef>(this as CatalogRef, _$identity);

  /// Serializes this CatalogRef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogRef&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,name);

@override
String toString() {
  return 'CatalogRef(id: $id, slug: $slug, name: $name)';
}


}

/// @nodoc
abstract mixin class $CatalogRefCopyWith<$Res>  {
  factory $CatalogRefCopyWith(CatalogRef value, $Res Function(CatalogRef) _then) = _$CatalogRefCopyWithImpl;
@useResult
$Res call({
@IdConverter() String id, String slug, String name
});




}
/// @nodoc
class _$CatalogRefCopyWithImpl<$Res>
    implements $CatalogRefCopyWith<$Res> {
  _$CatalogRefCopyWithImpl(this._self, this._then);

  final CatalogRef _self;
  final $Res Function(CatalogRef) _then;

/// Create a copy of CatalogRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? name = null,}) {
  return _then(CatalogRef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogRef].
extension CatalogRefPatterns on CatalogRef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogRef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogRef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogRef value)  $default,){
final _that = this;
switch (_that) {
case _CatalogRef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogRef value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogRef() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String slug,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogRef() when $default != null:
return $default(_that.id,_that.slug,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String slug,  String name)  $default,) {final _that = this;
switch (_that) {
case _CatalogRef():
return $default(_that.id,_that.slug,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String id,  String slug,  String name)?  $default,) {final _that = this;
switch (_that) {
case _CatalogRef() when $default != null:
return $default(_that.id,_that.slug,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatalogRef implements CatalogRef {
  const _CatalogRef({@IdConverter() required this.id, required this.slug, required this.name});
  factory _CatalogRef.fromJson(Map<String, dynamic> json) => _$CatalogRefFromJson(json);

@override@IdConverter() final  String id;
@override final  String slug;
@override final  String name;

/// Create a copy of CatalogRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogRefCopyWith<_CatalogRef> get copyWith => __$CatalogRefCopyWithImpl<_CatalogRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatalogRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogRef&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,name);

@override
String toString() {
  return 'CatalogRef(id: $id, slug: $slug, name: $name)';
}


}

/// @nodoc
abstract mixin class _$CatalogRefCopyWith<$Res> implements $CatalogRefCopyWith<$Res> {
  factory _$CatalogRefCopyWith(_CatalogRef value, $Res Function(_CatalogRef) _then) = __$CatalogRefCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String id, String slug, String name
});




}
/// @nodoc
class __$CatalogRefCopyWithImpl<$Res>
    implements _$CatalogRefCopyWith<$Res> {
  __$CatalogRefCopyWithImpl(this._self, this._then);

  final _CatalogRef _self;
  final $Res Function(_CatalogRef) _then;

/// Create a copy of CatalogRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? name = null,}) {
  return _then(_CatalogRef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ColorRef {

@IdConverter() String get id; String get slug; String get name; String get hexCode;
/// Create a copy of ColorRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ColorRefCopyWith<ColorRef> get copyWith => _$ColorRefCopyWithImpl<ColorRef>(this as ColorRef, _$identity);

  /// Serializes this ColorRef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColorRef&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.hexCode, hexCode) || other.hexCode == hexCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,name,hexCode);

@override
String toString() {
  return 'ColorRef(id: $id, slug: $slug, name: $name, hexCode: $hexCode)';
}


}

/// @nodoc
abstract mixin class $ColorRefCopyWith<$Res>  {
  factory $ColorRefCopyWith(ColorRef value, $Res Function(ColorRef) _then) = _$ColorRefCopyWithImpl;
@useResult
$Res call({
@IdConverter() String id, String slug, String name, String hexCode
});




}
/// @nodoc
class _$ColorRefCopyWithImpl<$Res>
    implements $ColorRefCopyWith<$Res> {
  _$ColorRefCopyWithImpl(this._self, this._then);

  final ColorRef _self;
  final $Res Function(ColorRef) _then;

/// Create a copy of ColorRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? hexCode = null,}) {
  return _then(ColorRef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hexCode: null == hexCode ? _self.hexCode : hexCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ColorRef].
extension ColorRefPatterns on ColorRef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ColorRef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ColorRef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ColorRef value)  $default,){
final _that = this;
switch (_that) {
case _ColorRef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ColorRef value)?  $default,){
final _that = this;
switch (_that) {
case _ColorRef() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String slug,  String name,  String hexCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ColorRef() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.hexCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String slug,  String name,  String hexCode)  $default,) {final _that = this;
switch (_that) {
case _ColorRef():
return $default(_that.id,_that.slug,_that.name,_that.hexCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String id,  String slug,  String name,  String hexCode)?  $default,) {final _that = this;
switch (_that) {
case _ColorRef() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.hexCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ColorRef implements ColorRef {
  const _ColorRef({@IdConverter() required this.id, required this.slug, required this.name, required this.hexCode});
  factory _ColorRef.fromJson(Map<String, dynamic> json) => _$ColorRefFromJson(json);

@override@IdConverter() final  String id;
@override final  String slug;
@override final  String name;
@override final  String hexCode;

/// Create a copy of ColorRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ColorRefCopyWith<_ColorRef> get copyWith => __$ColorRefCopyWithImpl<_ColorRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ColorRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ColorRef&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.hexCode, hexCode) || other.hexCode == hexCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,name,hexCode);

@override
String toString() {
  return 'ColorRef(id: $id, slug: $slug, name: $name, hexCode: $hexCode)';
}


}

/// @nodoc
abstract mixin class _$ColorRefCopyWith<$Res> implements $ColorRefCopyWith<$Res> {
  factory _$ColorRefCopyWith(_ColorRef value, $Res Function(_ColorRef) _then) = __$ColorRefCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String id, String slug, String name, String hexCode
});




}
/// @nodoc
class __$ColorRefCopyWithImpl<$Res>
    implements _$ColorRefCopyWith<$Res> {
  __$ColorRefCopyWithImpl(this._self, this._then);

  final _ColorRef _self;
  final $Res Function(_ColorRef) _then;

/// Create a copy of ColorRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? hexCode = null,}) {
  return _then(_ColorRef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hexCode: null == hexCode ? _self.hexCode : hexCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


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

class _ClothingType extends ClothingType {
  const _ClothingType({@IdConverter() required this.id, @IdConverter() required this.categoryId, required this.name, required this.slug, this.isOnePiece = false, this.sortOrder = 0}): super._();
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

@IdConverter() String get id; String get name; String get slug; String get hexCode; String get colorFamily; String? get temperature; String? get brightness; String? get saturation; bool get isNeutral; List<String> get aliases;
/// Create a copy of CatalogColor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogColorCopyWith<CatalogColor> get copyWith => _$CatalogColorCopyWithImpl<CatalogColor>(this as CatalogColor, _$identity);

  /// Serializes this CatalogColor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogColor&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.hexCode, hexCode) || other.hexCode == hexCode)&&(identical(other.colorFamily, colorFamily) || other.colorFamily == colorFamily)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.saturation, saturation) || other.saturation == saturation)&&(identical(other.isNeutral, isNeutral) || other.isNeutral == isNeutral)&&const DeepCollectionEquality().equals(other.aliases, aliases));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,hexCode,colorFamily,temperature,brightness,saturation,isNeutral,const DeepCollectionEquality().hash(aliases));

@override
String toString() {
  return 'CatalogColor(id: $id, name: $name, slug: $slug, hexCode: $hexCode, colorFamily: $colorFamily, temperature: $temperature, brightness: $brightness, saturation: $saturation, isNeutral: $isNeutral, aliases: $aliases)';
}


}

/// @nodoc
abstract mixin class $CatalogColorCopyWith<$Res>  {
  factory $CatalogColorCopyWith(CatalogColor value, $Res Function(CatalogColor) _then) = _$CatalogColorCopyWithImpl;
@useResult
$Res call({
@IdConverter() String id, String name, String slug, String hexCode, String colorFamily, String? temperature, String? brightness, String? saturation, bool isNeutral, List<String> aliases
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? hexCode = null,Object? colorFamily = null,Object? temperature = freezed,Object? brightness = freezed,Object? saturation = freezed,Object? isNeutral = null,Object? aliases = null,}) {
  return _then(CatalogColor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,hexCode: null == hexCode ? _self.hexCode : hexCode // ignore: cast_nullable_to_non_nullable
as String,colorFamily: null == colorFamily ? _self.colorFamily : colorFamily // ignore: cast_nullable_to_non_nullable
as String,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as String?,brightness: freezed == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as String?,saturation: freezed == saturation ? _self.saturation : saturation // ignore: cast_nullable_to_non_nullable
as String?,isNeutral: null == isNeutral ? _self.isNeutral : isNeutral // ignore: cast_nullable_to_non_nullable
as bool,aliases: null == aliases ? _self.aliases : aliases // ignore: cast_nullable_to_non_nullable
as List<String>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String name,  String slug,  String hexCode,  String colorFamily,  String? temperature,  String? brightness,  String? saturation,  bool isNeutral,  List<String> aliases)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogColor() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.hexCode,_that.colorFamily,_that.temperature,_that.brightness,_that.saturation,_that.isNeutral,_that.aliases);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String name,  String slug,  String hexCode,  String colorFamily,  String? temperature,  String? brightness,  String? saturation,  bool isNeutral,  List<String> aliases)  $default,) {final _that = this;
switch (_that) {
case _CatalogColor():
return $default(_that.id,_that.name,_that.slug,_that.hexCode,_that.colorFamily,_that.temperature,_that.brightness,_that.saturation,_that.isNeutral,_that.aliases);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String id,  String name,  String slug,  String hexCode,  String colorFamily,  String? temperature,  String? brightness,  String? saturation,  bool isNeutral,  List<String> aliases)?  $default,) {final _that = this;
switch (_that) {
case _CatalogColor() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.hexCode,_that.colorFamily,_that.temperature,_that.brightness,_that.saturation,_that.isNeutral,_that.aliases);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatalogColor extends CatalogColor {
  const _CatalogColor({@IdConverter() required this.id, required this.name, required this.slug, required this.hexCode, required this.colorFamily, this.temperature, this.brightness, this.saturation, this.isNeutral = false,  List<String> aliases = const []}): _aliases = aliases,super._();
  factory _CatalogColor.fromJson(Map<String, dynamic> json) => _$CatalogColorFromJson(json);

@override@IdConverter() final  String id;
@override final  String name;
@override final  String slug;
@override final  String hexCode;
@override final  String colorFamily;
@override final  String? temperature;
@override final  String? brightness;
@override final  String? saturation;
@override@JsonKey() final  bool isNeutral;
 final  List<String> _aliases;
@override@JsonKey() List<String> get aliases {
  if (_aliases is EqualUnmodifiableListView) return _aliases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_aliases);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogColor&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.hexCode, hexCode) || other.hexCode == hexCode)&&(identical(other.colorFamily, colorFamily) || other.colorFamily == colorFamily)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.saturation, saturation) || other.saturation == saturation)&&(identical(other.isNeutral, isNeutral) || other.isNeutral == isNeutral)&&const DeepCollectionEquality().equals(other._aliases, _aliases));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,hexCode,colorFamily,temperature,brightness,saturation,isNeutral,const DeepCollectionEquality().hash(_aliases));

@override
String toString() {
  return 'CatalogColor(id: $id, name: $name, slug: $slug, hexCode: $hexCode, colorFamily: $colorFamily, temperature: $temperature, brightness: $brightness, saturation: $saturation, isNeutral: $isNeutral, aliases: $aliases)';
}


}

/// @nodoc
abstract mixin class _$CatalogColorCopyWith<$Res> implements $CatalogColorCopyWith<$Res> {
  factory _$CatalogColorCopyWith(_CatalogColor value, $Res Function(_CatalogColor) _then) = __$CatalogColorCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String id, String name, String slug, String hexCode, String colorFamily, String? temperature, String? brightness, String? saturation, bool isNeutral, List<String> aliases
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? hexCode = null,Object? colorFamily = null,Object? temperature = freezed,Object? brightness = freezed,Object? saturation = freezed,Object? isNeutral = null,Object? aliases = null,}) {
  return _then(_CatalogColor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,hexCode: null == hexCode ? _self.hexCode : hexCode // ignore: cast_nullable_to_non_nullable
as String,colorFamily: null == colorFamily ? _self.colorFamily : colorFamily // ignore: cast_nullable_to_non_nullable
as String,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as String?,brightness: freezed == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as String?,saturation: freezed == saturation ? _self.saturation : saturation // ignore: cast_nullable_to_non_nullable
as String?,isNeutral: null == isNeutral ? _self.isNeutral : isNeutral // ignore: cast_nullable_to_non_nullable
as bool,aliases: null == aliases ? _self._aliases : aliases // ignore: cast_nullable_to_non_nullable
as List<String>,
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

 int get catalogVersion; int get rulesVersion;
/// Create a copy of CatalogVersion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogVersionCopyWith<CatalogVersion> get copyWith => _$CatalogVersionCopyWithImpl<CatalogVersion>(this as CatalogVersion, _$identity);

  /// Serializes this CatalogVersion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogVersion&&(identical(other.catalogVersion, catalogVersion) || other.catalogVersion == catalogVersion)&&(identical(other.rulesVersion, rulesVersion) || other.rulesVersion == rulesVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,catalogVersion,rulesVersion);

@override
String toString() {
  return 'CatalogVersion(catalogVersion: $catalogVersion, rulesVersion: $rulesVersion)';
}


}

/// @nodoc
abstract mixin class $CatalogVersionCopyWith<$Res>  {
  factory $CatalogVersionCopyWith(CatalogVersion value, $Res Function(CatalogVersion) _then) = _$CatalogVersionCopyWithImpl;
@useResult
$Res call({
 int catalogVersion, int rulesVersion
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
@pragma('vm:prefer-inline') @override $Res call({Object? catalogVersion = null,Object? rulesVersion = null,}) {
  return _then(CatalogVersion(
catalogVersion: null == catalogVersion ? _self.catalogVersion : catalogVersion // ignore: cast_nullable_to_non_nullable
as int,rulesVersion: null == rulesVersion ? _self.rulesVersion : rulesVersion // ignore: cast_nullable_to_non_nullable
as int,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int catalogVersion,  int rulesVersion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogVersion() when $default != null:
return $default(_that.catalogVersion,_that.rulesVersion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int catalogVersion,  int rulesVersion)  $default,) {final _that = this;
switch (_that) {
case _CatalogVersion():
return $default(_that.catalogVersion,_that.rulesVersion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int catalogVersion,  int rulesVersion)?  $default,) {final _that = this;
switch (_that) {
case _CatalogVersion() when $default != null:
return $default(_that.catalogVersion,_that.rulesVersion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatalogVersion implements CatalogVersion {
  const _CatalogVersion({required this.catalogVersion, required this.rulesVersion});
  factory _CatalogVersion.fromJson(Map<String, dynamic> json) => _$CatalogVersionFromJson(json);

@override final  int catalogVersion;
@override final  int rulesVersion;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogVersion&&(identical(other.catalogVersion, catalogVersion) || other.catalogVersion == catalogVersion)&&(identical(other.rulesVersion, rulesVersion) || other.rulesVersion == rulesVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,catalogVersion,rulesVersion);

@override
String toString() {
  return 'CatalogVersion(catalogVersion: $catalogVersion, rulesVersion: $rulesVersion)';
}


}

/// @nodoc
abstract mixin class _$CatalogVersionCopyWith<$Res> implements $CatalogVersionCopyWith<$Res> {
  factory _$CatalogVersionCopyWith(_CatalogVersion value, $Res Function(_CatalogVersion) _then) = __$CatalogVersionCopyWithImpl;
@override @useResult
$Res call({
 int catalogVersion, int rulesVersion
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
@override @pragma('vm:prefer-inline') $Res call({Object? catalogVersion = null,Object? rulesVersion = null,}) {
  return _then(_CatalogVersion(
catalogVersion: null == catalogVersion ? _self.catalogVersion : catalogVersion // ignore: cast_nullable_to_non_nullable
as int,rulesVersion: null == rulesVersion ? _self.rulesVersion : rulesVersion // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ColorFamilyGuide {

 String get slug; String get name;@IdListConverter() List<String> get colorIds;
/// Create a copy of ColorFamilyGuide
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ColorFamilyGuideCopyWith<ColorFamilyGuide> get copyWith => _$ColorFamilyGuideCopyWithImpl<ColorFamilyGuide>(this as ColorFamilyGuide, _$identity);

  /// Serializes this ColorFamilyGuide to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColorFamilyGuide&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.colorIds, colorIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slug,name,const DeepCollectionEquality().hash(colorIds));

@override
String toString() {
  return 'ColorFamilyGuide(slug: $slug, name: $name, colorIds: $colorIds)';
}


}

/// @nodoc
abstract mixin class $ColorFamilyGuideCopyWith<$Res>  {
  factory $ColorFamilyGuideCopyWith(ColorFamilyGuide value, $Res Function(ColorFamilyGuide) _then) = _$ColorFamilyGuideCopyWithImpl;
@useResult
$Res call({
 String slug, String name,@IdListConverter() List<String> colorIds
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
@pragma('vm:prefer-inline') @override $Res call({Object? slug = null,Object? name = null,Object? colorIds = null,}) {
  return _then(ColorFamilyGuide(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,colorIds: null == colorIds ? _self.colorIds : colorIds // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String slug,  String name, @IdListConverter()  List<String> colorIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ColorFamilyGuide() when $default != null:
return $default(_that.slug,_that.name,_that.colorIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String slug,  String name, @IdListConverter()  List<String> colorIds)  $default,) {final _that = this;
switch (_that) {
case _ColorFamilyGuide():
return $default(_that.slug,_that.name,_that.colorIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String slug,  String name, @IdListConverter()  List<String> colorIds)?  $default,) {final _that = this;
switch (_that) {
case _ColorFamilyGuide() when $default != null:
return $default(_that.slug,_that.name,_that.colorIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ColorFamilyGuide implements ColorFamilyGuide {
  const _ColorFamilyGuide({required this.slug, required this.name, @IdListConverter() required  List<String> colorIds}): _colorIds = colorIds;
  factory _ColorFamilyGuide.fromJson(Map<String, dynamic> json) => _$ColorFamilyGuideFromJson(json);

@override final  String slug;
@override final  String name;
 final  List<String> _colorIds;
@override@IdListConverter() List<String> get colorIds {
  if (_colorIds is EqualUnmodifiableListView) return _colorIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_colorIds);
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ColorFamilyGuide&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._colorIds, _colorIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slug,name,const DeepCollectionEquality().hash(_colorIds));

@override
String toString() {
  return 'ColorFamilyGuide(slug: $slug, name: $name, colorIds: $colorIds)';
}


}

/// @nodoc
abstract mixin class _$ColorFamilyGuideCopyWith<$Res> implements $ColorFamilyGuideCopyWith<$Res> {
  factory _$ColorFamilyGuideCopyWith(_ColorFamilyGuide value, $Res Function(_ColorFamilyGuide) _then) = __$ColorFamilyGuideCopyWithImpl;
@override @useResult
$Res call({
 String slug, String name,@IdListConverter() List<String> colorIds
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
@override @pragma('vm:prefer-inline') $Res call({Object? slug = null,Object? name = null,Object? colorIds = null,}) {
  return _then(_ColorFamilyGuide(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,colorIds: null == colorIds ? _self._colorIds : colorIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$ColorPartner {

@IdConverter() String get colorId; int get score; String get explanation;
/// Create a copy of ColorPartner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ColorPartnerCopyWith<ColorPartner> get copyWith => _$ColorPartnerCopyWithImpl<ColorPartner>(this as ColorPartner, _$identity);

  /// Serializes this ColorPartner to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColorPartner&&(identical(other.colorId, colorId) || other.colorId == colorId)&&(identical(other.score, score) || other.score == score)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,colorId,score,explanation);

@override
String toString() {
  return 'ColorPartner(colorId: $colorId, score: $score, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class $ColorPartnerCopyWith<$Res>  {
  factory $ColorPartnerCopyWith(ColorPartner value, $Res Function(ColorPartner) _then) = _$ColorPartnerCopyWithImpl;
@useResult
$Res call({
@IdConverter() String colorId, int score, String explanation
});




}
/// @nodoc
class _$ColorPartnerCopyWithImpl<$Res>
    implements $ColorPartnerCopyWith<$Res> {
  _$ColorPartnerCopyWithImpl(this._self, this._then);

  final ColorPartner _self;
  final $Res Function(ColorPartner) _then;

/// Create a copy of ColorPartner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? colorId = null,Object? score = null,Object? explanation = null,}) {
  return _then(ColorPartner(
colorId: null == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ColorPartner].
extension ColorPartnerPatterns on ColorPartner {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ColorPartner value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ColorPartner() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ColorPartner value)  $default,){
final _that = this;
switch (_that) {
case _ColorPartner():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ColorPartner value)?  $default,){
final _that = this;
switch (_that) {
case _ColorPartner() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String colorId,  int score,  String explanation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ColorPartner() when $default != null:
return $default(_that.colorId,_that.score,_that.explanation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String colorId,  int score,  String explanation)  $default,) {final _that = this;
switch (_that) {
case _ColorPartner():
return $default(_that.colorId,_that.score,_that.explanation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String colorId,  int score,  String explanation)?  $default,) {final _that = this;
switch (_that) {
case _ColorPartner() when $default != null:
return $default(_that.colorId,_that.score,_that.explanation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ColorPartner implements ColorPartner {
  const _ColorPartner({@IdConverter() required this.colorId, required this.score, required this.explanation});
  factory _ColorPartner.fromJson(Map<String, dynamic> json) => _$ColorPartnerFromJson(json);

@override@IdConverter() final  String colorId;
@override final  int score;
@override final  String explanation;

/// Create a copy of ColorPartner
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ColorPartnerCopyWith<_ColorPartner> get copyWith => __$ColorPartnerCopyWithImpl<_ColorPartner>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ColorPartnerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ColorPartner&&(identical(other.colorId, colorId) || other.colorId == colorId)&&(identical(other.score, score) || other.score == score)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,colorId,score,explanation);

@override
String toString() {
  return 'ColorPartner(colorId: $colorId, score: $score, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class _$ColorPartnerCopyWith<$Res> implements $ColorPartnerCopyWith<$Res> {
  factory _$ColorPartnerCopyWith(_ColorPartner value, $Res Function(_ColorPartner) _then) = __$ColorPartnerCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String colorId, int score, String explanation
});




}
/// @nodoc
class __$ColorPartnerCopyWithImpl<$Res>
    implements _$ColorPartnerCopyWith<$Res> {
  __$ColorPartnerCopyWithImpl(this._self, this._then);

  final _ColorPartner _self;
  final $Res Function(_ColorPartner) _then;

/// Create a copy of ColorPartner
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? colorId = null,Object? score = null,Object? explanation = null,}) {
  return _then(_ColorPartner(
colorId: null == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ColorHarmony {

@IdConverter() String get colorId; List<ColorPartner> get harmonious; List<ColorPartner> get contrast; List<ColorPartner> get neutralPairing; List<ColorPartner> get caution;
/// Create a copy of ColorHarmony
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ColorHarmonyCopyWith<ColorHarmony> get copyWith => _$ColorHarmonyCopyWithImpl<ColorHarmony>(this as ColorHarmony, _$identity);

  /// Serializes this ColorHarmony to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColorHarmony&&(identical(other.colorId, colorId) || other.colorId == colorId)&&const DeepCollectionEquality().equals(other.harmonious, harmonious)&&const DeepCollectionEquality().equals(other.contrast, contrast)&&const DeepCollectionEquality().equals(other.neutralPairing, neutralPairing)&&const DeepCollectionEquality().equals(other.caution, caution));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,colorId,const DeepCollectionEquality().hash(harmonious),const DeepCollectionEquality().hash(contrast),const DeepCollectionEquality().hash(neutralPairing),const DeepCollectionEquality().hash(caution));

@override
String toString() {
  return 'ColorHarmony(colorId: $colorId, harmonious: $harmonious, contrast: $contrast, neutralPairing: $neutralPairing, caution: $caution)';
}


}

/// @nodoc
abstract mixin class $ColorHarmonyCopyWith<$Res>  {
  factory $ColorHarmonyCopyWith(ColorHarmony value, $Res Function(ColorHarmony) _then) = _$ColorHarmonyCopyWithImpl;
@useResult
$Res call({
@IdConverter() String colorId, List<ColorPartner> harmonious, List<ColorPartner> contrast, List<ColorPartner> neutralPairing, List<ColorPartner> caution
});




}
/// @nodoc
class _$ColorHarmonyCopyWithImpl<$Res>
    implements $ColorHarmonyCopyWith<$Res> {
  _$ColorHarmonyCopyWithImpl(this._self, this._then);

  final ColorHarmony _self;
  final $Res Function(ColorHarmony) _then;

/// Create a copy of ColorHarmony
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? colorId = null,Object? harmonious = null,Object? contrast = null,Object? neutralPairing = null,Object? caution = null,}) {
  return _then(ColorHarmony(
colorId: null == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as String,harmonious: null == harmonious ? _self.harmonious : harmonious // ignore: cast_nullable_to_non_nullable
as List<ColorPartner>,contrast: null == contrast ? _self.contrast : contrast // ignore: cast_nullable_to_non_nullable
as List<ColorPartner>,neutralPairing: null == neutralPairing ? _self.neutralPairing : neutralPairing // ignore: cast_nullable_to_non_nullable
as List<ColorPartner>,caution: null == caution ? _self.caution : caution // ignore: cast_nullable_to_non_nullable
as List<ColorPartner>,
  ));
}

}


/// Adds pattern-matching-related methods to [ColorHarmony].
extension ColorHarmonyPatterns on ColorHarmony {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ColorHarmony value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ColorHarmony() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ColorHarmony value)  $default,){
final _that = this;
switch (_that) {
case _ColorHarmony():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ColorHarmony value)?  $default,){
final _that = this;
switch (_that) {
case _ColorHarmony() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String colorId,  List<ColorPartner> harmonious,  List<ColorPartner> contrast,  List<ColorPartner> neutralPairing,  List<ColorPartner> caution)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ColorHarmony() when $default != null:
return $default(_that.colorId,_that.harmonious,_that.contrast,_that.neutralPairing,_that.caution);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String colorId,  List<ColorPartner> harmonious,  List<ColorPartner> contrast,  List<ColorPartner> neutralPairing,  List<ColorPartner> caution)  $default,) {final _that = this;
switch (_that) {
case _ColorHarmony():
return $default(_that.colorId,_that.harmonious,_that.contrast,_that.neutralPairing,_that.caution);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String colorId,  List<ColorPartner> harmonious,  List<ColorPartner> contrast,  List<ColorPartner> neutralPairing,  List<ColorPartner> caution)?  $default,) {final _that = this;
switch (_that) {
case _ColorHarmony() when $default != null:
return $default(_that.colorId,_that.harmonious,_that.contrast,_that.neutralPairing,_that.caution);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ColorHarmony extends ColorHarmony {
  const _ColorHarmony({@IdConverter() required this.colorId,  List<ColorPartner> harmonious = const [],  List<ColorPartner> contrast = const [],  List<ColorPartner> neutralPairing = const [],  List<ColorPartner> caution = const []}): _harmonious = harmonious,_contrast = contrast,_neutralPairing = neutralPairing,_caution = caution,super._();
  factory _ColorHarmony.fromJson(Map<String, dynamic> json) => _$ColorHarmonyFromJson(json);

@override@IdConverter() final  String colorId;
 final  List<ColorPartner> _harmonious;
@override@JsonKey() List<ColorPartner> get harmonious {
  if (_harmonious is EqualUnmodifiableListView) return _harmonious;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_harmonious);
}

 final  List<ColorPartner> _contrast;
@override@JsonKey() List<ColorPartner> get contrast {
  if (_contrast is EqualUnmodifiableListView) return _contrast;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contrast);
}

 final  List<ColorPartner> _neutralPairing;
@override@JsonKey() List<ColorPartner> get neutralPairing {
  if (_neutralPairing is EqualUnmodifiableListView) return _neutralPairing;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_neutralPairing);
}

 final  List<ColorPartner> _caution;
@override@JsonKey() List<ColorPartner> get caution {
  if (_caution is EqualUnmodifiableListView) return _caution;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_caution);
}


/// Create a copy of ColorHarmony
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ColorHarmonyCopyWith<_ColorHarmony> get copyWith => __$ColorHarmonyCopyWithImpl<_ColorHarmony>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ColorHarmonyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ColorHarmony&&(identical(other.colorId, colorId) || other.colorId == colorId)&&const DeepCollectionEquality().equals(other._harmonious, _harmonious)&&const DeepCollectionEquality().equals(other._contrast, _contrast)&&const DeepCollectionEquality().equals(other._neutralPairing, _neutralPairing)&&const DeepCollectionEquality().equals(other._caution, _caution));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,colorId,const DeepCollectionEquality().hash(_harmonious),const DeepCollectionEquality().hash(_contrast),const DeepCollectionEquality().hash(_neutralPairing),const DeepCollectionEquality().hash(_caution));

@override
String toString() {
  return 'ColorHarmony(colorId: $colorId, harmonious: $harmonious, contrast: $contrast, neutralPairing: $neutralPairing, caution: $caution)';
}


}

/// @nodoc
abstract mixin class _$ColorHarmonyCopyWith<$Res> implements $ColorHarmonyCopyWith<$Res> {
  factory _$ColorHarmonyCopyWith(_ColorHarmony value, $Res Function(_ColorHarmony) _then) = __$ColorHarmonyCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String colorId, List<ColorPartner> harmonious, List<ColorPartner> contrast, List<ColorPartner> neutralPairing, List<ColorPartner> caution
});




}
/// @nodoc
class __$ColorHarmonyCopyWithImpl<$Res>
    implements _$ColorHarmonyCopyWith<$Res> {
  __$ColorHarmonyCopyWithImpl(this._self, this._then);

  final _ColorHarmony _self;
  final $Res Function(_ColorHarmony) _then;

/// Create a copy of ColorHarmony
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? colorId = null,Object? harmonious = null,Object? contrast = null,Object? neutralPairing = null,Object? caution = null,}) {
  return _then(_ColorHarmony(
colorId: null == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as String,harmonious: null == harmonious ? _self._harmonious : harmonious // ignore: cast_nullable_to_non_nullable
as List<ColorPartner>,contrast: null == contrast ? _self._contrast : contrast // ignore: cast_nullable_to_non_nullable
as List<ColorPartner>,neutralPairing: null == neutralPairing ? _self._neutralPairing : neutralPairing // ignore: cast_nullable_to_non_nullable
as List<ColorPartner>,caution: null == caution ? _self._caution : caution // ignore: cast_nullable_to_non_nullable
as List<ColorPartner>,
  ));
}


}


/// @nodoc
mixin _$ColorGuide {

 int get catalogVersion; int get rulesVersion; List<ColorFamilyGuide> get families;@IdListConverter() List<String> get neutralColorIds; List<ColorHarmony> get harmonies;
/// Create a copy of ColorGuide
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ColorGuideCopyWith<ColorGuide> get copyWith => _$ColorGuideCopyWithImpl<ColorGuide>(this as ColorGuide, _$identity);

  /// Serializes this ColorGuide to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColorGuide&&(identical(other.catalogVersion, catalogVersion) || other.catalogVersion == catalogVersion)&&(identical(other.rulesVersion, rulesVersion) || other.rulesVersion == rulesVersion)&&const DeepCollectionEquality().equals(other.families, families)&&const DeepCollectionEquality().equals(other.neutralColorIds, neutralColorIds)&&const DeepCollectionEquality().equals(other.harmonies, harmonies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,catalogVersion,rulesVersion,const DeepCollectionEquality().hash(families),const DeepCollectionEquality().hash(neutralColorIds),const DeepCollectionEquality().hash(harmonies));

@override
String toString() {
  return 'ColorGuide(catalogVersion: $catalogVersion, rulesVersion: $rulesVersion, families: $families, neutralColorIds: $neutralColorIds, harmonies: $harmonies)';
}


}

/// @nodoc
abstract mixin class $ColorGuideCopyWith<$Res>  {
  factory $ColorGuideCopyWith(ColorGuide value, $Res Function(ColorGuide) _then) = _$ColorGuideCopyWithImpl;
@useResult
$Res call({
 int catalogVersion, int rulesVersion, List<ColorFamilyGuide> families,@IdListConverter() List<String> neutralColorIds, List<ColorHarmony> harmonies
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
@pragma('vm:prefer-inline') @override $Res call({Object? catalogVersion = null,Object? rulesVersion = null,Object? families = null,Object? neutralColorIds = null,Object? harmonies = null,}) {
  return _then(ColorGuide(
catalogVersion: null == catalogVersion ? _self.catalogVersion : catalogVersion // ignore: cast_nullable_to_non_nullable
as int,rulesVersion: null == rulesVersion ? _self.rulesVersion : rulesVersion // ignore: cast_nullable_to_non_nullable
as int,families: null == families ? _self.families : families // ignore: cast_nullable_to_non_nullable
as List<ColorFamilyGuide>,neutralColorIds: null == neutralColorIds ? _self.neutralColorIds : neutralColorIds // ignore: cast_nullable_to_non_nullable
as List<String>,harmonies: null == harmonies ? _self.harmonies : harmonies // ignore: cast_nullable_to_non_nullable
as List<ColorHarmony>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int catalogVersion,  int rulesVersion,  List<ColorFamilyGuide> families, @IdListConverter()  List<String> neutralColorIds,  List<ColorHarmony> harmonies)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ColorGuide() when $default != null:
return $default(_that.catalogVersion,_that.rulesVersion,_that.families,_that.neutralColorIds,_that.harmonies);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int catalogVersion,  int rulesVersion,  List<ColorFamilyGuide> families, @IdListConverter()  List<String> neutralColorIds,  List<ColorHarmony> harmonies)  $default,) {final _that = this;
switch (_that) {
case _ColorGuide():
return $default(_that.catalogVersion,_that.rulesVersion,_that.families,_that.neutralColorIds,_that.harmonies);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int catalogVersion,  int rulesVersion,  List<ColorFamilyGuide> families, @IdListConverter()  List<String> neutralColorIds,  List<ColorHarmony> harmonies)?  $default,) {final _that = this;
switch (_that) {
case _ColorGuide() when $default != null:
return $default(_that.catalogVersion,_that.rulesVersion,_that.families,_that.neutralColorIds,_that.harmonies);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ColorGuide extends ColorGuide {
  const _ColorGuide({this.catalogVersion = 1, this.rulesVersion = 1, required  List<ColorFamilyGuide> families, @IdListConverter()  List<String> neutralColorIds = const [],  List<ColorHarmony> harmonies = const []}): _families = families,_neutralColorIds = neutralColorIds,_harmonies = harmonies,super._();
  factory _ColorGuide.fromJson(Map<String, dynamic> json) => _$ColorGuideFromJson(json);

@override@JsonKey() final  int catalogVersion;
@override@JsonKey() final  int rulesVersion;
 final  List<ColorFamilyGuide> _families;
@override List<ColorFamilyGuide> get families {
  if (_families is EqualUnmodifiableListView) return _families;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_families);
}

 final  List<String> _neutralColorIds;
@override@JsonKey()@IdListConverter() List<String> get neutralColorIds {
  if (_neutralColorIds is EqualUnmodifiableListView) return _neutralColorIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_neutralColorIds);
}

 final  List<ColorHarmony> _harmonies;
@override@JsonKey() List<ColorHarmony> get harmonies {
  if (_harmonies is EqualUnmodifiableListView) return _harmonies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_harmonies);
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ColorGuide&&(identical(other.catalogVersion, catalogVersion) || other.catalogVersion == catalogVersion)&&(identical(other.rulesVersion, rulesVersion) || other.rulesVersion == rulesVersion)&&const DeepCollectionEquality().equals(other._families, _families)&&const DeepCollectionEquality().equals(other._neutralColorIds, _neutralColorIds)&&const DeepCollectionEquality().equals(other._harmonies, _harmonies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,catalogVersion,rulesVersion,const DeepCollectionEquality().hash(_families),const DeepCollectionEquality().hash(_neutralColorIds),const DeepCollectionEquality().hash(_harmonies));

@override
String toString() {
  return 'ColorGuide(catalogVersion: $catalogVersion, rulesVersion: $rulesVersion, families: $families, neutralColorIds: $neutralColorIds, harmonies: $harmonies)';
}


}

/// @nodoc
abstract mixin class _$ColorGuideCopyWith<$Res> implements $ColorGuideCopyWith<$Res> {
  factory _$ColorGuideCopyWith(_ColorGuide value, $Res Function(_ColorGuide) _then) = __$ColorGuideCopyWithImpl;
@override @useResult
$Res call({
 int catalogVersion, int rulesVersion, List<ColorFamilyGuide> families,@IdListConverter() List<String> neutralColorIds, List<ColorHarmony> harmonies
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
@override @pragma('vm:prefer-inline') $Res call({Object? catalogVersion = null,Object? rulesVersion = null,Object? families = null,Object? neutralColorIds = null,Object? harmonies = null,}) {
  return _then(_ColorGuide(
catalogVersion: null == catalogVersion ? _self.catalogVersion : catalogVersion // ignore: cast_nullable_to_non_nullable
as int,rulesVersion: null == rulesVersion ? _self.rulesVersion : rulesVersion // ignore: cast_nullable_to_non_nullable
as int,families: null == families ? _self._families : families // ignore: cast_nullable_to_non_nullable
as List<ColorFamilyGuide>,neutralColorIds: null == neutralColorIds ? _self._neutralColorIds : neutralColorIds // ignore: cast_nullable_to_non_nullable
as List<String>,harmonies: null == harmonies ? _self._harmonies : harmonies // ignore: cast_nullable_to_non_nullable
as List<ColorHarmony>,
  ));
}


}

// dart format on
