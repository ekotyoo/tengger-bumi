// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Plant _$PlantFromJson(Map<String, dynamic> json) {
  return _Plant.fromJson(json);
}

/// @nodoc
mixin _$Plant {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Category get category => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Author get author => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  Position get position => throw _privateConstructorUsedError;
  bool get deleting => throw _privateConstructorUsedError;
  bool? get liked => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @TimestampSerializer()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'likes_count', defaultValue: 0)
  int get likesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'dislikes_count', defaultValue: 0)
  int get dislikesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'comments_count', defaultValue: 0)
  int get commentsCount => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  @JsonKey(name: 'allow_edit', defaultValue: false)
  bool get allowEdit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlantCopyWith<Plant> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantCopyWith<$Res> {
  factory $PlantCopyWith(Plant value, $Res Function(Plant) then) =
      _$PlantCopyWithImpl<$Res, Plant>;
  @useResult
  $Res call(
      {int id,
      String name,
      Category category,
      String description,
      Author author,
      String address,
      Position position,
      bool deleting,
      bool? liked,
      @JsonKey(name: 'created_at') @TimestampSerializer() DateTime createdAt,
      @JsonKey(name: 'likes_count', defaultValue: 0) int likesCount,
      @JsonKey(name: 'dislikes_count', defaultValue: 0) int dislikesCount,
      @JsonKey(name: 'comments_count', defaultValue: 0) int commentsCount,
      List<String> images,
      @JsonKey(name: 'allow_edit', defaultValue: false) bool allowEdit});

  $CategoryCopyWith<$Res> get category;
  $AuthorCopyWith<$Res> get author;
  $PositionCopyWith<$Res> get position;
}

/// @nodoc
class _$PlantCopyWithImpl<$Res, $Val extends Plant>
    implements $PlantCopyWith<$Res> {
  _$PlantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? description = null,
    Object? author = null,
    Object? address = null,
    Object? position = null,
    Object? deleting = null,
    Object? liked = freezed,
    Object? createdAt = null,
    Object? likesCount = null,
    Object? dislikesCount = null,
    Object? commentsCount = null,
    Object? images = null,
    Object? allowEdit = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as Author,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
      deleting: null == deleting
          ? _value.deleting
          : deleting // ignore: cast_nullable_to_non_nullable
              as bool,
      liked: freezed == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      dislikesCount: null == dislikesCount
          ? _value.dislikesCount
          : dislikesCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allowEdit: null == allowEdit
          ? _value.allowEdit
          : allowEdit // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthorCopyWith<$Res> get author {
    return $AuthorCopyWith<$Res>(_value.author, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PositionCopyWith<$Res> get position {
    return $PositionCopyWith<$Res>(_value.position, (value) {
      return _then(_value.copyWith(position: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PlantCopyWith<$Res> implements $PlantCopyWith<$Res> {
  factory _$$_PlantCopyWith(_$_Plant value, $Res Function(_$_Plant) then) =
      __$$_PlantCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      Category category,
      String description,
      Author author,
      String address,
      Position position,
      bool deleting,
      bool? liked,
      @JsonKey(name: 'created_at') @TimestampSerializer() DateTime createdAt,
      @JsonKey(name: 'likes_count', defaultValue: 0) int likesCount,
      @JsonKey(name: 'dislikes_count', defaultValue: 0) int dislikesCount,
      @JsonKey(name: 'comments_count', defaultValue: 0) int commentsCount,
      List<String> images,
      @JsonKey(name: 'allow_edit', defaultValue: false) bool allowEdit});

  @override
  $CategoryCopyWith<$Res> get category;
  @override
  $AuthorCopyWith<$Res> get author;
  @override
  $PositionCopyWith<$Res> get position;
}

/// @nodoc
class __$$_PlantCopyWithImpl<$Res> extends _$PlantCopyWithImpl<$Res, _$_Plant>
    implements _$$_PlantCopyWith<$Res> {
  __$$_PlantCopyWithImpl(_$_Plant _value, $Res Function(_$_Plant) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? description = null,
    Object? author = null,
    Object? address = null,
    Object? position = null,
    Object? deleting = null,
    Object? liked = freezed,
    Object? createdAt = null,
    Object? likesCount = null,
    Object? dislikesCount = null,
    Object? commentsCount = null,
    Object? images = null,
    Object? allowEdit = null,
  }) {
    return _then(_$_Plant(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as Author,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
      deleting: null == deleting
          ? _value.deleting
          : deleting // ignore: cast_nullable_to_non_nullable
              as bool,
      liked: freezed == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      dislikesCount: null == dislikesCount
          ? _value.dislikesCount
          : dislikesCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allowEdit: null == allowEdit
          ? _value.allowEdit
          : allowEdit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Plant implements _Plant {
  const _$_Plant(
      {required this.id,
      required this.name,
      required this.category,
      required this.description,
      required this.author,
      required this.address,
      required this.position,
      this.deleting = false,
      this.liked,
      @JsonKey(name: 'created_at')
      @TimestampSerializer()
          required this.createdAt,
      @JsonKey(name: 'likes_count', defaultValue: 0)
          required this.likesCount,
      @JsonKey(name: 'dislikes_count', defaultValue: 0)
          required this.dislikesCount,
      @JsonKey(name: 'comments_count', defaultValue: 0)
          required this.commentsCount,
      final List<String> images = const [],
      @JsonKey(name: 'allow_edit', defaultValue: false)
          required this.allowEdit})
      : _images = images;

  factory _$_Plant.fromJson(Map<String, dynamic> json) =>
      _$$_PlantFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final Category category;
  @override
  final String description;
  @override
  final Author author;
  @override
  final String address;
  @override
  final Position position;
  @override
  @JsonKey()
  final bool deleting;
  @override
  final bool? liked;
  @override
  @JsonKey(name: 'created_at')
  @TimestampSerializer()
  final DateTime createdAt;
  @override
  @JsonKey(name: 'likes_count', defaultValue: 0)
  final int likesCount;
  @override
  @JsonKey(name: 'dislikes_count', defaultValue: 0)
  final int dislikesCount;
  @override
  @JsonKey(name: 'comments_count', defaultValue: 0)
  final int commentsCount;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey(name: 'allow_edit', defaultValue: false)
  final bool allowEdit;

  @override
  String toString() {
    return 'Plant(id: $id, name: $name, category: $category, description: $description, author: $author, address: $address, position: $position, deleting: $deleting, liked: $liked, createdAt: $createdAt, likesCount: $likesCount, dislikesCount: $dislikesCount, commentsCount: $commentsCount, images: $images, allowEdit: $allowEdit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Plant &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.deleting, deleting) ||
                other.deleting == deleting) &&
            (identical(other.liked, liked) || other.liked == liked) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.dislikesCount, dislikesCount) ||
                other.dislikesCount == dislikesCount) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.allowEdit, allowEdit) ||
                other.allowEdit == allowEdit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      category,
      description,
      author,
      address,
      position,
      deleting,
      liked,
      createdAt,
      likesCount,
      dislikesCount,
      commentsCount,
      const DeepCollectionEquality().hash(_images),
      allowEdit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlantCopyWith<_$_Plant> get copyWith =>
      __$$_PlantCopyWithImpl<_$_Plant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlantToJson(
      this,
    );
  }
}

abstract class _Plant implements Plant {
  const factory _Plant(
      {required final int id,
      required final String name,
      required final Category category,
      required final String description,
      required final Author author,
      required final String address,
      required final Position position,
      final bool deleting,
      final bool? liked,
      @JsonKey(name: 'created_at')
      @TimestampSerializer()
          required final DateTime createdAt,
      @JsonKey(name: 'likes_count', defaultValue: 0)
          required final int likesCount,
      @JsonKey(name: 'dislikes_count', defaultValue: 0)
          required final int dislikesCount,
      @JsonKey(name: 'comments_count', defaultValue: 0)
          required final int commentsCount,
      final List<String> images,
      @JsonKey(name: 'allow_edit', defaultValue: false)
          required final bool allowEdit}) = _$_Plant;

  factory _Plant.fromJson(Map<String, dynamic> json) = _$_Plant.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  Category get category;
  @override
  String get description;
  @override
  Author get author;
  @override
  String get address;
  @override
  Position get position;
  @override
  bool get deleting;
  @override
  bool? get liked;
  @override
  @JsonKey(name: 'created_at')
  @TimestampSerializer()
  DateTime get createdAt;
  @override
  @JsonKey(name: 'likes_count', defaultValue: 0)
  int get likesCount;
  @override
  @JsonKey(name: 'dislikes_count', defaultValue: 0)
  int get dislikesCount;
  @override
  @JsonKey(name: 'comments_count', defaultValue: 0)
  int get commentsCount;
  @override
  List<String> get images;
  @override
  @JsonKey(name: 'allow_edit', defaultValue: false)
  bool get allowEdit;
  @override
  @JsonKey(ignore: true)
  _$$_PlantCopyWith<_$_Plant> get copyWith =>
      throw _privateConstructorUsedError;
}
