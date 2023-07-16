// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReportQuery {
  int get page => throw _privateConstructorUsedError;
  int get take => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  Regency? get regency => throw _privateConstructorUsedError;
  ReportTime? get reportTime => throw _privateConstructorUsedError;
  int? get authorId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReportQueryCopyWith<ReportQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportQueryCopyWith<$Res> {
  factory $ReportQueryCopyWith(
          ReportQuery value, $Res Function(ReportQuery) then) =
      _$ReportQueryCopyWithImpl<$Res, ReportQuery>;
  @useResult
  $Res call(
      {int page,
      int take,
      Category? category,
      Regency? regency,
      ReportTime? reportTime,
      int? authorId});

  $CategoryCopyWith<$Res>? get category;
  $RegencyCopyWith<$Res>? get regency;
}

/// @nodoc
class _$ReportQueryCopyWithImpl<$Res, $Val extends ReportQuery>
    implements $ReportQueryCopyWith<$Res> {
  _$ReportQueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? take = null,
    Object? category = freezed,
    Object? regency = freezed,
    Object? reportTime = freezed,
    Object? authorId = freezed,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      take: null == take
          ? _value.take
          : take // ignore: cast_nullable_to_non_nullable
              as int,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      regency: freezed == regency
          ? _value.regency
          : regency // ignore: cast_nullable_to_non_nullable
              as Regency?,
      reportTime: freezed == reportTime
          ? _value.reportTime
          : reportTime // ignore: cast_nullable_to_non_nullable
              as ReportTime?,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RegencyCopyWith<$Res>? get regency {
    if (_value.regency == null) {
      return null;
    }

    return $RegencyCopyWith<$Res>(_value.regency!, (value) {
      return _then(_value.copyWith(regency: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReportQueryCopyWith<$Res>
    implements $ReportQueryCopyWith<$Res> {
  factory _$$_ReportQueryCopyWith(
          _$_ReportQuery value, $Res Function(_$_ReportQuery) then) =
      __$$_ReportQueryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page,
      int take,
      Category? category,
      Regency? regency,
      ReportTime? reportTime,
      int? authorId});

  @override
  $CategoryCopyWith<$Res>? get category;
  @override
  $RegencyCopyWith<$Res>? get regency;
}

/// @nodoc
class __$$_ReportQueryCopyWithImpl<$Res>
    extends _$ReportQueryCopyWithImpl<$Res, _$_ReportQuery>
    implements _$$_ReportQueryCopyWith<$Res> {
  __$$_ReportQueryCopyWithImpl(
      _$_ReportQuery _value, $Res Function(_$_ReportQuery) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? take = null,
    Object? category = freezed,
    Object? regency = freezed,
    Object? reportTime = freezed,
    Object? authorId = freezed,
  }) {
    return _then(_$_ReportQuery(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      take: null == take
          ? _value.take
          : take // ignore: cast_nullable_to_non_nullable
              as int,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      regency: freezed == regency
          ? _value.regency
          : regency // ignore: cast_nullable_to_non_nullable
              as Regency?,
      reportTime: freezed == reportTime
          ? _value.reportTime
          : reportTime // ignore: cast_nullable_to_non_nullable
              as ReportTime?,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_ReportQuery implements _ReportQuery {
  const _$_ReportQuery(
      {this.page = 1,
      this.take = 200,
      this.category,
      this.regency,
      this.reportTime,
      this.authorId});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int take;
  @override
  final Category? category;
  @override
  final Regency? regency;
  @override
  final ReportTime? reportTime;
  @override
  final int? authorId;

  @override
  String toString() {
    return 'ReportQuery(page: $page, take: $take, category: $category, regency: $regency, reportTime: $reportTime, authorId: $authorId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportQuery &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.take, take) || other.take == take) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.regency, regency) || other.regency == regency) &&
            (identical(other.reportTime, reportTime) ||
                other.reportTime == reportTime) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, page, take, category, regency, reportTime, authorId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportQueryCopyWith<_$_ReportQuery> get copyWith =>
      __$$_ReportQueryCopyWithImpl<_$_ReportQuery>(this, _$identity);
}

abstract class _ReportQuery implements ReportQuery {
  const factory _ReportQuery(
      {final int page,
      final int take,
      final Category? category,
      final Regency? regency,
      final ReportTime? reportTime,
      final int? authorId}) = _$_ReportQuery;

  @override
  int get page;
  @override
  int get take;
  @override
  Category? get category;
  @override
  Regency? get regency;
  @override
  ReportTime? get reportTime;
  @override
  int? get authorId;
  @override
  @JsonKey(ignore: true)
  _$$_ReportQueryCopyWith<_$_ReportQuery> get copyWith =>
      throw _privateConstructorUsedError;
}
