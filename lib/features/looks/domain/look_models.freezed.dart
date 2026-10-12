// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'look_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LookImage {

@IdConverter() String get id; String get url; String? get thumbnailUrl; String get sourceName; String? get sourceUrl; LicenseType get licenseType; String? get attribution; bool get usageApproved; String get altText;
/// Create a copy of LookImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LookImageCopyWith<LookImage> get copyWith => _$LookImageCopyWithImpl<LookImage>(this as LookImage, _$identity);

  /// Serializes this LookImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LookImage&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.sourceName, sourceName) || other.sourceName == sourceName)&&(identical(other.sourceUrl, sourceUrl) || other.sourceUrl == sourceUrl)&&(identical(other.licenseType, licenseType) || other.licenseType == licenseType)&&(identical(other.attribution, attribution) || other.attribution == attribution)&&(identical(other.usageApproved, usageApproved) || other.usageApproved == usageApproved)&&(identical(other.altText, altText) || other.altText == altText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,thumbnailUrl,sourceName,sourceUrl,licenseType,attribution,usageApproved,altText);

@override
String toString() {
  return 'LookImage(id: $id, url: $url, thumbnailUrl: $thumbnailUrl, sourceName: $sourceName, sourceUrl: $sourceUrl, licenseType: $licenseType, attribution: $attribution, usageApproved: $usageApproved, altText: $altText)';
}


}

/// @nodoc
abstract mixin class $LookImageCopyWith<$Res>  {
  factory $LookImageCopyWith(LookImage value, $Res Function(LookImage) _then) = _$LookImageCopyWithImpl;
@useResult
$Res call({
@IdConverter() String id, String url, String? thumbnailUrl, String sourceName, String? sourceUrl, LicenseType licenseType, String? attribution, bool usageApproved, String altText
});




}
/// @nodoc
class _$LookImageCopyWithImpl<$Res>
    implements $LookImageCopyWith<$Res> {
  _$LookImageCopyWithImpl(this._self, this._then);

  final LookImage _self;
  final $Res Function(LookImage) _then;

/// Create a copy of LookImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,Object? thumbnailUrl = freezed,Object? sourceName = null,Object? sourceUrl = freezed,Object? licenseType = null,Object? attribution = freezed,Object? usageApproved = null,Object? altText = null,}) {
  return _then(LookImage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,sourceName: null == sourceName ? _self.sourceName : sourceName // ignore: cast_nullable_to_non_nullable
as String,sourceUrl: freezed == sourceUrl ? _self.sourceUrl : sourceUrl // ignore: cast_nullable_to_non_nullable
as String?,licenseType: null == licenseType ? _self.licenseType : licenseType // ignore: cast_nullable_to_non_nullable
as LicenseType,attribution: freezed == attribution ? _self.attribution : attribution // ignore: cast_nullable_to_non_nullable
as String?,usageApproved: null == usageApproved ? _self.usageApproved : usageApproved // ignore: cast_nullable_to_non_nullable
as bool,altText: null == altText ? _self.altText : altText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LookImage].
extension LookImagePatterns on LookImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LookImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LookImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LookImage value)  $default,){
final _that = this;
switch (_that) {
case _LookImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LookImage value)?  $default,){
final _that = this;
switch (_that) {
case _LookImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String url,  String? thumbnailUrl,  String sourceName,  String? sourceUrl,  LicenseType licenseType,  String? attribution,  bool usageApproved,  String altText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LookImage() when $default != null:
return $default(_that.id,_that.url,_that.thumbnailUrl,_that.sourceName,_that.sourceUrl,_that.licenseType,_that.attribution,_that.usageApproved,_that.altText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String url,  String? thumbnailUrl,  String sourceName,  String? sourceUrl,  LicenseType licenseType,  String? attribution,  bool usageApproved,  String altText)  $default,) {final _that = this;
switch (_that) {
case _LookImage():
return $default(_that.id,_that.url,_that.thumbnailUrl,_that.sourceName,_that.sourceUrl,_that.licenseType,_that.attribution,_that.usageApproved,_that.altText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String id,  String url,  String? thumbnailUrl,  String sourceName,  String? sourceUrl,  LicenseType licenseType,  String? attribution,  bool usageApproved,  String altText)?  $default,) {final _that = this;
switch (_that) {
case _LookImage() when $default != null:
return $default(_that.id,_that.url,_that.thumbnailUrl,_that.sourceName,_that.sourceUrl,_that.licenseType,_that.attribution,_that.usageApproved,_that.altText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LookImage extends LookImage {
  const _LookImage({@IdConverter() required this.id, required this.url, this.thumbnailUrl, required this.sourceName, this.sourceUrl, required this.licenseType, this.attribution, required this.usageApproved, required this.altText}): super._();
  factory _LookImage.fromJson(Map<String, dynamic> json) => _$LookImageFromJson(json);

@override@IdConverter() final  String id;
@override final  String url;
@override final  String? thumbnailUrl;
@override final  String sourceName;
@override final  String? sourceUrl;
@override final  LicenseType licenseType;
@override final  String? attribution;
@override final  bool usageApproved;
@override final  String altText;

/// Create a copy of LookImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LookImageCopyWith<_LookImage> get copyWith => __$LookImageCopyWithImpl<_LookImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LookImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LookImage&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.sourceName, sourceName) || other.sourceName == sourceName)&&(identical(other.sourceUrl, sourceUrl) || other.sourceUrl == sourceUrl)&&(identical(other.licenseType, licenseType) || other.licenseType == licenseType)&&(identical(other.attribution, attribution) || other.attribution == attribution)&&(identical(other.usageApproved, usageApproved) || other.usageApproved == usageApproved)&&(identical(other.altText, altText) || other.altText == altText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,thumbnailUrl,sourceName,sourceUrl,licenseType,attribution,usageApproved,altText);

@override
String toString() {
  return 'LookImage(id: $id, url: $url, thumbnailUrl: $thumbnailUrl, sourceName: $sourceName, sourceUrl: $sourceUrl, licenseType: $licenseType, attribution: $attribution, usageApproved: $usageApproved, altText: $altText)';
}


}

/// @nodoc
abstract mixin class _$LookImageCopyWith<$Res> implements $LookImageCopyWith<$Res> {
  factory _$LookImageCopyWith(_LookImage value, $Res Function(_LookImage) _then) = __$LookImageCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String id, String url, String? thumbnailUrl, String sourceName, String? sourceUrl, LicenseType licenseType, String? attribution, bool usageApproved, String altText
});




}
/// @nodoc
class __$LookImageCopyWithImpl<$Res>
    implements _$LookImageCopyWith<$Res> {
  __$LookImageCopyWithImpl(this._self, this._then);

  final _LookImage _self;
  final $Res Function(_LookImage) _then;

/// Create a copy of LookImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,Object? thumbnailUrl = freezed,Object? sourceName = null,Object? sourceUrl = freezed,Object? licenseType = null,Object? attribution = freezed,Object? usageApproved = null,Object? altText = null,}) {
  return _then(_LookImage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,sourceName: null == sourceName ? _self.sourceName : sourceName // ignore: cast_nullable_to_non_nullable
as String,sourceUrl: freezed == sourceUrl ? _self.sourceUrl : sourceUrl // ignore: cast_nullable_to_non_nullable
as String?,licenseType: null == licenseType ? _self.licenseType : licenseType // ignore: cast_nullable_to_non_nullable
as LicenseType,attribution: freezed == attribution ? _self.attribution : attribution // ignore: cast_nullable_to_non_nullable
as String?,usageApproved: null == usageApproved ? _self.usageApproved : usageApproved // ignore: cast_nullable_to_non_nullable
as bool,altText: null == altText ? _self.altText : altText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LookItem {

@IdConverter() String get id;@IdConverter() String get clothingTypeId;@IdConverter() String get colorId; PieceRole get role; bool get isRequired; int get sortOrder;
/// Create a copy of LookItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LookItemCopyWith<LookItem> get copyWith => _$LookItemCopyWithImpl<LookItem>(this as LookItem, _$identity);

  /// Serializes this LookItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LookItem&&(identical(other.id, id) || other.id == id)&&(identical(other.clothingTypeId, clothingTypeId) || other.clothingTypeId == clothingTypeId)&&(identical(other.colorId, colorId) || other.colorId == colorId)&&(identical(other.role, role) || other.role == role)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clothingTypeId,colorId,role,isRequired,sortOrder);

@override
String toString() {
  return 'LookItem(id: $id, clothingTypeId: $clothingTypeId, colorId: $colorId, role: $role, isRequired: $isRequired, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $LookItemCopyWith<$Res>  {
  factory $LookItemCopyWith(LookItem value, $Res Function(LookItem) _then) = _$LookItemCopyWithImpl;
@useResult
$Res call({
@IdConverter() String id,@IdConverter() String clothingTypeId,@IdConverter() String colorId, PieceRole role, bool isRequired, int sortOrder
});




}
/// @nodoc
class _$LookItemCopyWithImpl<$Res>
    implements $LookItemCopyWith<$Res> {
  _$LookItemCopyWithImpl(this._self, this._then);

  final LookItem _self;
  final $Res Function(LookItem) _then;

/// Create a copy of LookItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clothingTypeId = null,Object? colorId = null,Object? role = null,Object? isRequired = null,Object? sortOrder = null,}) {
  return _then(LookItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clothingTypeId: null == clothingTypeId ? _self.clothingTypeId : clothingTypeId // ignore: cast_nullable_to_non_nullable
as String,colorId: null == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as PieceRole,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LookItem].
extension LookItemPatterns on LookItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LookItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LookItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LookItem value)  $default,){
final _that = this;
switch (_that) {
case _LookItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LookItem value)?  $default,){
final _that = this;
switch (_that) {
case _LookItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String id, @IdConverter()  String clothingTypeId, @IdConverter()  String colorId,  PieceRole role,  bool isRequired,  int sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LookItem() when $default != null:
return $default(_that.id,_that.clothingTypeId,_that.colorId,_that.role,_that.isRequired,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String id, @IdConverter()  String clothingTypeId, @IdConverter()  String colorId,  PieceRole role,  bool isRequired,  int sortOrder)  $default,) {final _that = this;
switch (_that) {
case _LookItem():
return $default(_that.id,_that.clothingTypeId,_that.colorId,_that.role,_that.isRequired,_that.sortOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String id, @IdConverter()  String clothingTypeId, @IdConverter()  String colorId,  PieceRole role,  bool isRequired,  int sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _LookItem() when $default != null:
return $default(_that.id,_that.clothingTypeId,_that.colorId,_that.role,_that.isRequired,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LookItem implements LookItem {
  const _LookItem({@IdConverter() required this.id, @IdConverter() required this.clothingTypeId, @IdConverter() required this.colorId, required this.role, this.isRequired = true, this.sortOrder = 0});
  factory _LookItem.fromJson(Map<String, dynamic> json) => _$LookItemFromJson(json);

@override@IdConverter() final  String id;
@override@IdConverter() final  String clothingTypeId;
@override@IdConverter() final  String colorId;
@override final  PieceRole role;
@override@JsonKey() final  bool isRequired;
@override@JsonKey() final  int sortOrder;

/// Create a copy of LookItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LookItemCopyWith<_LookItem> get copyWith => __$LookItemCopyWithImpl<_LookItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LookItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LookItem&&(identical(other.id, id) || other.id == id)&&(identical(other.clothingTypeId, clothingTypeId) || other.clothingTypeId == clothingTypeId)&&(identical(other.colorId, colorId) || other.colorId == colorId)&&(identical(other.role, role) || other.role == role)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clothingTypeId,colorId,role,isRequired,sortOrder);

@override
String toString() {
  return 'LookItem(id: $id, clothingTypeId: $clothingTypeId, colorId: $colorId, role: $role, isRequired: $isRequired, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$LookItemCopyWith<$Res> implements $LookItemCopyWith<$Res> {
  factory _$LookItemCopyWith(_LookItem value, $Res Function(_LookItem) _then) = __$LookItemCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String id,@IdConverter() String clothingTypeId,@IdConverter() String colorId, PieceRole role, bool isRequired, int sortOrder
});




}
/// @nodoc
class __$LookItemCopyWithImpl<$Res>
    implements _$LookItemCopyWith<$Res> {
  __$LookItemCopyWithImpl(this._self, this._then);

  final _LookItem _self;
  final $Res Function(_LookItem) _then;

/// Create a copy of LookItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clothingTypeId = null,Object? colorId = null,Object? role = null,Object? isRequired = null,Object? sortOrder = null,}) {
  return _then(_LookItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clothingTypeId: null == clothingTypeId ? _self.clothingTypeId : clothingTypeId // ignore: cast_nullable_to_non_nullable
as String,colorId: null == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as PieceRole,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Look {

@IdConverter() String get id; String get title; String get slug; String get description;@NullableIdConverter() String? get styleId;@NullableIdConverter() String? get occasionId; LookStatus get status;@NullableUtcDateTimeConverter() DateTime? get publishedAt; LookOrigin get origin; List<LookItem> get items; LookImage? get primaryImage; List<LookImage> get images;
/// Create a copy of Look
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LookCopyWith<Look> get copyWith => _$LookCopyWithImpl<Look>(this as Look, _$identity);

  /// Serializes this Look to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Look&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.styleId, styleId) || other.styleId == styleId)&&(identical(other.occasionId, occasionId) || other.occasionId == occasionId)&&(identical(other.status, status) || other.status == status)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.origin, origin) || other.origin == origin)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.primaryImage, primaryImage) || other.primaryImage == primaryImage)&&const DeepCollectionEquality().equals(other.images, images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,slug,description,styleId,occasionId,status,publishedAt,origin,const DeepCollectionEquality().hash(items),primaryImage,const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'Look(id: $id, title: $title, slug: $slug, description: $description, styleId: $styleId, occasionId: $occasionId, status: $status, publishedAt: $publishedAt, origin: $origin, items: $items, primaryImage: $primaryImage, images: $images)';
}


}

/// @nodoc
abstract mixin class $LookCopyWith<$Res>  {
  factory $LookCopyWith(Look value, $Res Function(Look) _then) = _$LookCopyWithImpl;
@useResult
$Res call({
@IdConverter() String id, String title, String slug, String description,@NullableIdConverter() String? styleId,@NullableIdConverter() String? occasionId, LookStatus status,@NullableUtcDateTimeConverter() DateTime? publishedAt, LookOrigin origin, List<LookItem> items, LookImage? primaryImage, List<LookImage> images
});


$LookImageCopyWith<$Res>? get primaryImage;

}
/// @nodoc
class _$LookCopyWithImpl<$Res>
    implements $LookCopyWith<$Res> {
  _$LookCopyWithImpl(this._self, this._then);

  final Look _self;
  final $Res Function(Look) _then;

/// Create a copy of Look
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? slug = null,Object? description = null,Object? styleId = freezed,Object? occasionId = freezed,Object? status = null,Object? publishedAt = freezed,Object? origin = null,Object? items = null,Object? primaryImage = freezed,Object? images = null,}) {
  return _then(Look(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,styleId: freezed == styleId ? _self.styleId : styleId // ignore: cast_nullable_to_non_nullable
as String?,occasionId: freezed == occasionId ? _self.occasionId : occasionId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LookStatus,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as LookOrigin,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<LookItem>,primaryImage: freezed == primaryImage ? _self.primaryImage : primaryImage // ignore: cast_nullable_to_non_nullable
as LookImage?,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<LookImage>,
  ));
}
/// Create a copy of Look
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LookImageCopyWith<$Res>? get primaryImage {
    if (_self.primaryImage == null) {
    return null;
  }

  return $LookImageCopyWith<$Res>(_self.primaryImage!, (value) {
    return _then(_self.copyWith(primaryImage: value));
  });
}
}


/// Adds pattern-matching-related methods to [Look].
extension LookPatterns on Look {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Look value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Look() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Look value)  $default,){
final _that = this;
switch (_that) {
case _Look():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Look value)?  $default,){
final _that = this;
switch (_that) {
case _Look() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String title,  String slug,  String description, @NullableIdConverter()  String? styleId, @NullableIdConverter()  String? occasionId,  LookStatus status, @NullableUtcDateTimeConverter()  DateTime? publishedAt,  LookOrigin origin,  List<LookItem> items,  LookImage? primaryImage,  List<LookImage> images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Look() when $default != null:
return $default(_that.id,_that.title,_that.slug,_that.description,_that.styleId,_that.occasionId,_that.status,_that.publishedAt,_that.origin,_that.items,_that.primaryImage,_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String title,  String slug,  String description, @NullableIdConverter()  String? styleId, @NullableIdConverter()  String? occasionId,  LookStatus status, @NullableUtcDateTimeConverter()  DateTime? publishedAt,  LookOrigin origin,  List<LookItem> items,  LookImage? primaryImage,  List<LookImage> images)  $default,) {final _that = this;
switch (_that) {
case _Look():
return $default(_that.id,_that.title,_that.slug,_that.description,_that.styleId,_that.occasionId,_that.status,_that.publishedAt,_that.origin,_that.items,_that.primaryImage,_that.images);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String id,  String title,  String slug,  String description, @NullableIdConverter()  String? styleId, @NullableIdConverter()  String? occasionId,  LookStatus status, @NullableUtcDateTimeConverter()  DateTime? publishedAt,  LookOrigin origin,  List<LookItem> items,  LookImage? primaryImage,  List<LookImage> images)?  $default,) {final _that = this;
switch (_that) {
case _Look() when $default != null:
return $default(_that.id,_that.title,_that.slug,_that.description,_that.styleId,_that.occasionId,_that.status,_that.publishedAt,_that.origin,_that.items,_that.primaryImage,_that.images);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Look implements Look {
  const _Look({@IdConverter() required this.id, required this.title, required this.slug, required this.description, @NullableIdConverter() this.styleId, @NullableIdConverter() this.occasionId, required this.status, @NullableUtcDateTimeConverter() this.publishedAt, this.origin = LookOrigin.editorial, required  List<LookItem> items, this.primaryImage,  List<LookImage> images = const []}): _items = items,_images = images;
  factory _Look.fromJson(Map<String, dynamic> json) => _$LookFromJson(json);

@override@IdConverter() final  String id;
@override final  String title;
@override final  String slug;
@override final  String description;
@override@NullableIdConverter() final  String? styleId;
@override@NullableIdConverter() final  String? occasionId;
@override final  LookStatus status;
@override@NullableUtcDateTimeConverter() final  DateTime? publishedAt;
@override@JsonKey() final  LookOrigin origin;
 final  List<LookItem> _items;
@override List<LookItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  LookImage? primaryImage;
 final  List<LookImage> _images;
@override@JsonKey() List<LookImage> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of Look
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LookCopyWith<_Look> get copyWith => __$LookCopyWithImpl<_Look>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LookToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Look&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.styleId, styleId) || other.styleId == styleId)&&(identical(other.occasionId, occasionId) || other.occasionId == occasionId)&&(identical(other.status, status) || other.status == status)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.origin, origin) || other.origin == origin)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.primaryImage, primaryImage) || other.primaryImage == primaryImage)&&const DeepCollectionEquality().equals(other._images, _images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,slug,description,styleId,occasionId,status,publishedAt,origin,const DeepCollectionEquality().hash(_items),primaryImage,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'Look(id: $id, title: $title, slug: $slug, description: $description, styleId: $styleId, occasionId: $occasionId, status: $status, publishedAt: $publishedAt, origin: $origin, items: $items, primaryImage: $primaryImage, images: $images)';
}


}

/// @nodoc
abstract mixin class _$LookCopyWith<$Res> implements $LookCopyWith<$Res> {
  factory _$LookCopyWith(_Look value, $Res Function(_Look) _then) = __$LookCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String id, String title, String slug, String description,@NullableIdConverter() String? styleId,@NullableIdConverter() String? occasionId, LookStatus status,@NullableUtcDateTimeConverter() DateTime? publishedAt, LookOrigin origin, List<LookItem> items, LookImage? primaryImage, List<LookImage> images
});


@override $LookImageCopyWith<$Res>? get primaryImage;

}
/// @nodoc
class __$LookCopyWithImpl<$Res>
    implements _$LookCopyWith<$Res> {
  __$LookCopyWithImpl(this._self, this._then);

  final _Look _self;
  final $Res Function(_Look) _then;

/// Create a copy of Look
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? slug = null,Object? description = null,Object? styleId = freezed,Object? occasionId = freezed,Object? status = null,Object? publishedAt = freezed,Object? origin = null,Object? items = null,Object? primaryImage = freezed,Object? images = null,}) {
  return _then(_Look(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,styleId: freezed == styleId ? _self.styleId : styleId // ignore: cast_nullable_to_non_nullable
as String?,occasionId: freezed == occasionId ? _self.occasionId : occasionId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LookStatus,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as LookOrigin,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<LookItem>,primaryImage: freezed == primaryImage ? _self.primaryImage : primaryImage // ignore: cast_nullable_to_non_nullable
as LookImage?,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<LookImage>,
  ));
}

/// Create a copy of Look
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LookImageCopyWith<$Res>? get primaryImage {
    if (_self.primaryImage == null) {
    return null;
  }

  return $LookImageCopyWith<$Res>(_self.primaryImage!, (value) {
    return _then(_self.copyWith(primaryImage: value));
  });
}
}


/// @nodoc
mixin _$PageMeta {

 int get currentPage; int get perPage; int get total; int get lastPage;
/// Create a copy of PageMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageMetaCopyWith<PageMeta> get copyWith => _$PageMetaCopyWithImpl<PageMeta>(this as PageMeta, _$identity);

  /// Serializes this PageMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageMeta&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.total, total) || other.total == total)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,perPage,total,lastPage);

@override
String toString() {
  return 'PageMeta(currentPage: $currentPage, perPage: $perPage, total: $total, lastPage: $lastPage)';
}


}

/// @nodoc
abstract mixin class $PageMetaCopyWith<$Res>  {
  factory $PageMetaCopyWith(PageMeta value, $Res Function(PageMeta) _then) = _$PageMetaCopyWithImpl;
@useResult
$Res call({
 int currentPage, int perPage, int total, int lastPage
});




}
/// @nodoc
class _$PageMetaCopyWithImpl<$Res>
    implements $PageMetaCopyWith<$Res> {
  _$PageMetaCopyWithImpl(this._self, this._then);

  final PageMeta _self;
  final $Res Function(PageMeta) _then;

/// Create a copy of PageMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPage = null,Object? perPage = null,Object? total = null,Object? lastPage = null,}) {
  return _then(PageMeta(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PageMeta].
extension PageMetaPatterns on PageMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PageMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PageMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PageMeta value)  $default,){
final _that = this;
switch (_that) {
case _PageMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PageMeta value)?  $default,){
final _that = this;
switch (_that) {
case _PageMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentPage,  int perPage,  int total,  int lastPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PageMeta() when $default != null:
return $default(_that.currentPage,_that.perPage,_that.total,_that.lastPage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentPage,  int perPage,  int total,  int lastPage)  $default,) {final _that = this;
switch (_that) {
case _PageMeta():
return $default(_that.currentPage,_that.perPage,_that.total,_that.lastPage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentPage,  int perPage,  int total,  int lastPage)?  $default,) {final _that = this;
switch (_that) {
case _PageMeta() when $default != null:
return $default(_that.currentPage,_that.perPage,_that.total,_that.lastPage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PageMeta implements PageMeta {
  const _PageMeta({required this.currentPage, required this.perPage, required this.total, required this.lastPage});
  factory _PageMeta.fromJson(Map<String, dynamic> json) => _$PageMetaFromJson(json);

@override final  int currentPage;
@override final  int perPage;
@override final  int total;
@override final  int lastPage;

/// Create a copy of PageMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageMetaCopyWith<_PageMeta> get copyWith => __$PageMetaCopyWithImpl<_PageMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PageMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageMeta&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.total, total) || other.total == total)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,perPage,total,lastPage);

@override
String toString() {
  return 'PageMeta(currentPage: $currentPage, perPage: $perPage, total: $total, lastPage: $lastPage)';
}


}

/// @nodoc
abstract mixin class _$PageMetaCopyWith<$Res> implements $PageMetaCopyWith<$Res> {
  factory _$PageMetaCopyWith(_PageMeta value, $Res Function(_PageMeta) _then) = __$PageMetaCopyWithImpl;
@override @useResult
$Res call({
 int currentPage, int perPage, int total, int lastPage
});




}
/// @nodoc
class __$PageMetaCopyWithImpl<$Res>
    implements _$PageMetaCopyWith<$Res> {
  __$PageMetaCopyWithImpl(this._self, this._then);

  final _PageMeta _self;
  final $Res Function(_PageMeta) _then;

/// Create a copy of PageMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPage = null,Object? perPage = null,Object? total = null,Object? lastPage = null,}) {
  return _then(_PageMeta(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$LookQuery {

 String? get styleSlug; String? get occasionSlug; int get page; int get perPage;
/// Create a copy of LookQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LookQueryCopyWith<LookQuery> get copyWith => _$LookQueryCopyWithImpl<LookQuery>(this as LookQuery, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LookQuery&&(identical(other.styleSlug, styleSlug) || other.styleSlug == styleSlug)&&(identical(other.occasionSlug, occasionSlug) || other.occasionSlug == occasionSlug)&&(identical(other.page, page) || other.page == page)&&(identical(other.perPage, perPage) || other.perPage == perPage));
}


@override
int get hashCode => Object.hash(runtimeType,styleSlug,occasionSlug,page,perPage);

@override
String toString() {
  return 'LookQuery(styleSlug: $styleSlug, occasionSlug: $occasionSlug, page: $page, perPage: $perPage)';
}


}

/// @nodoc
abstract mixin class $LookQueryCopyWith<$Res>  {
  factory $LookQueryCopyWith(LookQuery value, $Res Function(LookQuery) _then) = _$LookQueryCopyWithImpl;
@useResult
$Res call({
 String? styleSlug, String? occasionSlug, int page, int perPage
});




}
/// @nodoc
class _$LookQueryCopyWithImpl<$Res>
    implements $LookQueryCopyWith<$Res> {
  _$LookQueryCopyWithImpl(this._self, this._then);

  final LookQuery _self;
  final $Res Function(LookQuery) _then;

/// Create a copy of LookQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? styleSlug = freezed,Object? occasionSlug = freezed,Object? page = null,Object? perPage = null,}) {
  return _then(LookQuery(
styleSlug: freezed == styleSlug ? _self.styleSlug : styleSlug // ignore: cast_nullable_to_non_nullable
as String?,occasionSlug: freezed == occasionSlug ? _self.occasionSlug : occasionSlug // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LookQuery].
extension LookQueryPatterns on LookQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LookQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LookQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LookQuery value)  $default,){
final _that = this;
switch (_that) {
case _LookQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LookQuery value)?  $default,){
final _that = this;
switch (_that) {
case _LookQuery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? styleSlug,  String? occasionSlug,  int page,  int perPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LookQuery() when $default != null:
return $default(_that.styleSlug,_that.occasionSlug,_that.page,_that.perPage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? styleSlug,  String? occasionSlug,  int page,  int perPage)  $default,) {final _that = this;
switch (_that) {
case _LookQuery():
return $default(_that.styleSlug,_that.occasionSlug,_that.page,_that.perPage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? styleSlug,  String? occasionSlug,  int page,  int perPage)?  $default,) {final _that = this;
switch (_that) {
case _LookQuery() when $default != null:
return $default(_that.styleSlug,_that.occasionSlug,_that.page,_that.perPage);case _:
  return null;

}
}

}

/// @nodoc


class _LookQuery extends LookQuery {
  const _LookQuery({this.styleSlug, this.occasionSlug, this.page = 1, this.perPage = 10}): super._();
  

@override final  String? styleSlug;
@override final  String? occasionSlug;
@override@JsonKey() final  int page;
@override@JsonKey() final  int perPage;

/// Create a copy of LookQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LookQueryCopyWith<_LookQuery> get copyWith => __$LookQueryCopyWithImpl<_LookQuery>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LookQuery&&(identical(other.styleSlug, styleSlug) || other.styleSlug == styleSlug)&&(identical(other.occasionSlug, occasionSlug) || other.occasionSlug == occasionSlug)&&(identical(other.page, page) || other.page == page)&&(identical(other.perPage, perPage) || other.perPage == perPage));
}


@override
int get hashCode => Object.hash(runtimeType,styleSlug,occasionSlug,page,perPage);

@override
String toString() {
  return 'LookQuery(styleSlug: $styleSlug, occasionSlug: $occasionSlug, page: $page, perPage: $perPage)';
}


}

/// @nodoc
abstract mixin class _$LookQueryCopyWith<$Res> implements $LookQueryCopyWith<$Res> {
  factory _$LookQueryCopyWith(_LookQuery value, $Res Function(_LookQuery) _then) = __$LookQueryCopyWithImpl;
@override @useResult
$Res call({
 String? styleSlug, String? occasionSlug, int page, int perPage
});




}
/// @nodoc
class __$LookQueryCopyWithImpl<$Res>
    implements _$LookQueryCopyWith<$Res> {
  __$LookQueryCopyWithImpl(this._self, this._then);

  final _LookQuery _self;
  final $Res Function(_LookQuery) _then;

/// Create a copy of LookQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? styleSlug = freezed,Object? occasionSlug = freezed,Object? page = null,Object? perPage = null,}) {
  return _then(_LookQuery(
styleSlug: freezed == styleSlug ? _self.styleSlug : styleSlug // ignore: cast_nullable_to_non_nullable
as String?,occasionSlug: freezed == occasionSlug ? _self.occasionSlug : occasionSlug // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
