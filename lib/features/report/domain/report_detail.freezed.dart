// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlantDetail _$PlantDetailFromJson(Map<String, dynamic> json) {
  return _ReportDetail.fromJson(json);
}

/// @nodoc
mixin _$PlantDetail {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Category get category => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Author get author => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  Position get position => throw _privateConstructorUsedError;
  bool? get liked => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @TimestampSerializer()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'likes_count', defaultValue: 0)
  int get likesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'dislikes_count', defaultValue: 0)
  int get dislikesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'planting_count', defaultValue: 0)
  int get plantingCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'planting_date')
  @TimestampSerializer()
  DateTime get plantingDate => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  List<Comment> get comments => throw _privateConstructorUsedError;
  @JsonKey(name: 'allow_edit', defaultValue: false)
  bool get allowEdit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlantDetailCopyWith<PlantDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantDetailCopyWith<$Res> {
  factory $PlantDetailCopyWith(
          PlantDetail value, $Res Function(PlantDetail) then) =
      _$PlantDetailCopyWithImpl<$Res, PlantDetail>;
  @useResult
  $Res call(
      {int id,
      String name,
      Category category,
      String description,
      Author author,
      String address,
      Position position,
      bool? liked,
      @JsonKey(name: 'created_at')
      @TimestampSerializer()
          DateTime createdAt,
      @JsonKey(name: 'likes_count', defaultValue: 0)
          int likesCount,
      @JsonKey(name: 'dislikes_count', defaultValue: 0)
          int dislikesCount,
      @JsonKey(name: 'planting_count', defaultValue: 0)
          int plantingCount,
      @JsonKey(name: 'planting_date')
      @TimestampSerializer()
          DateTime plantingDate,
      List<String> images,
      List<Comment> comments,
      @JsonKey(name: 'allow_edit', defaultValue: false)
          bool allowEdit});

  $CategoryCopyWith<$Res> get category;
  $AuthorCopyWith<$Res> get author;
  $PositionCopyWith<$Res> get position;
}

/// @nodoc
class _$PlantDetailCopyWithImpl<$Res, $Val extends PlantDetail>
    implements $PlantDetailCopyWith<$Res> {
  _$PlantDetailCopyWithImpl(this._value, this._then);

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
    Object? liked = freezed,
    Object? createdAt = null,
    Object? likesCount = null,
    Object? dislikesCount = null,
    Object? plantingCount = null,
    Object? plantingDate = null,
    Object? images = null,
    Object? comments = null,
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
      plantingCount: null == plantingCount
          ? _value.plantingCount
          : plantingCount // ignore: cast_nullable_to_non_nullable
              as int,
      plantingDate: null == plantingDate
          ? _value.plantingDate
          : plantingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
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
abstract class _$$_ReportDetailCopyWith<$Res>
    implements $PlantDetailCopyWith<$Res> {
  factory _$$_ReportDetailCopyWith(
          _$_ReportDetail value, $Res Function(_$_ReportDetail) then) =
      __$$_ReportDetailCopyWithImpl<$Res>;
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
      bool? liked,
      @JsonKey(name: 'created_at')
      @TimestampSerializer()
          DateTime createdAt,
      @JsonKey(name: 'likes_count', defaultValue: 0)
          int likesCount,
      @JsonKey(name: 'dislikes_count', defaultValue: 0)
          int dislikesCount,
      @JsonKey(name: 'planting_count', defaultValue: 0)
          int plantingCount,
      @JsonKey(name: 'planting_date')
      @TimestampSerializer()
          DateTime plantingDate,
      List<String> images,
      List<Comment> comments,
      @JsonKey(name: 'allow_edit', defaultValue: false)
          bool allowEdit});

  @override
  $CategoryCopyWith<$Res> get category;
  @override
  $AuthorCopyWith<$Res> get author;
  @override
  $PositionCopyWith<$Res> get position;
}

/// @nodoc
class __$$_ReportDetailCopyWithImpl<$Res>
    extends _$PlantDetailCopyWithImpl<$Res, _$_ReportDetail>
    implements _$$_ReportDetailCopyWith<$Res> {
  __$$_ReportDetailCopyWithImpl(
      _$_ReportDetail _value, $Res Function(_$_ReportDetail) _then)
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
    Object? liked = freezed,
    Object? createdAt = null,
    Object? likesCount = null,
    Object? dislikesCount = null,
    Object? plantingCount = null,
    Object? plantingDate = null,
    Object? images = null,
    Object? comments = null,
    Object? allowEdit = null,
  }) {
    return _then(_$_ReportDetail(
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
      plantingCount: null == plantingCount
          ? _value.plantingCount
          : plantingCount // ignore: cast_nullable_to_non_nullable
              as int,
      plantingDate: null == plantingDate
          ? _value.plantingDate
          : plantingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      allowEdit: null == allowEdit
          ? _value.allowEdit
          : allowEdit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReportDetail implements _ReportDetail {
  const _$_ReportDetail(
      {required this.id,
      required this.name,
      required this.category,
      required this.description,
      required this.author,
      required this.address,
      required this.position,
      this.liked,
      @JsonKey(name: 'created_at')
      @TimestampSerializer()
          required this.createdAt,
      @JsonKey(name: 'likes_count', defaultValue: 0)
          required this.likesCount,
      @JsonKey(name: 'dislikes_count', defaultValue: 0)
          required this.dislikesCount,
      @JsonKey(name: 'planting_count', defaultValue: 0)
          required this.plantingCount,
      @JsonKey(name: 'planting_date')
      @TimestampSerializer()
          required this.plantingDate,
      final List<String> images = const [],
      final List<Comment> comments = const [],
      @JsonKey(name: 'allow_edit', defaultValue: false)
          required this.allowEdit})
      : _images = images,
        _comments = comments;

  factory _$_ReportDetail.fromJson(Map<String, dynamic> json) =>
      _$$_ReportDetailFromJson(json);

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
  @JsonKey(name: 'planting_count', defaultValue: 0)
  final int plantingCount;
  @override
  @JsonKey(name: 'planting_date')
  @TimestampSerializer()
  final DateTime plantingDate;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<Comment> _comments;
  @override
  @JsonKey()
  List<Comment> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  @JsonKey(name: 'allow_edit', defaultValue: false)
  final bool allowEdit;

  @override
  String toString() {
    return 'PlantDetail(id: $id, name: $name, category: $category, description: $description, author: $author, address: $address, position: $position, liked: $liked, createdAt: $createdAt, likesCount: $likesCount, dislikesCount: $dislikesCount, plantingCount: $plantingCount, plantingDate: $plantingDate, images: $images, comments: $comments, allowEdit: $allowEdit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportDetail &&
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
            (identical(other.liked, liked) || other.liked == liked) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.dislikesCount, dislikesCount) ||
                other.dislikesCount == dislikesCount) &&
            (identical(other.plantingCount, plantingCount) ||
                other.plantingCount == plantingCount) &&
            (identical(other.plantingDate, plantingDate) ||
                other.plantingDate == plantingDate) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
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
      liked,
      createdAt,
      likesCount,
      dislikesCount,
      plantingCount,
      plantingDate,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_comments),
      allowEdit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportDetailCopyWith<_$_ReportDetail> get copyWith =>
      __$$_ReportDetailCopyWithImpl<_$_ReportDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportDetailToJson(
      this,
    );
  }
}

abstract class _ReportDetail implements PlantDetail {
  const factory _ReportDetail(
      {required final int id,
      required final String name,
      required final Category category,
      required final String description,
      required final Author author,
      required final String address,
      required final Position position,
      final bool? liked,
      @JsonKey(name: 'created_at')
      @TimestampSerializer()
          required final DateTime createdAt,
      @JsonKey(name: 'likes_count', defaultValue: 0)
          required final int likesCount,
      @JsonKey(name: 'dislikes_count', defaultValue: 0)
          required final int dislikesCount,
      @JsonKey(name: 'planting_count', defaultValue: 0)
          required final int plantingCount,
      @JsonKey(name: 'planting_date')
      @TimestampSerializer()
          required final DateTime plantingDate,
      final List<String> images,
      final List<Comment> comments,
      @JsonKey(name: 'allow_edit', defaultValue: false)
          required final bool allowEdit}) = _$_ReportDetail;

  factory _ReportDetail.fromJson(Map<String, dynamic> json) =
      _$_ReportDetail.fromJson;

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
  @JsonKey(name: 'planting_count', defaultValue: 0)
  int get plantingCount;
  @override
  @JsonKey(name: 'planting_date')
  @TimestampSerializer()
  DateTime get plantingDate;
  @override
  List<String> get images;
  @override
  List<Comment> get comments;
  @override
  @JsonKey(name: 'allow_edit', defaultValue: false)
  bool get allowEdit;
  @override
  @JsonKey(ignore: true)
  _$$_ReportDetailCopyWith<_$_ReportDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
