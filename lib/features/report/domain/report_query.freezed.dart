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
  ReportType? get reportType => throw _privateConstructorUsedError;
  ReportStatus? get reportStatus => throw _privateConstructorUsedError;
  ReportTime get reportTime => throw _privateConstructorUsedError;
  String? get reportCategory => throw _privateConstructorUsedError;
  int? get authorId => throw _privateConstructorUsedError;
  int? get schoolId => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

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
      ReportType? reportType,
      ReportStatus? reportStatus,
      ReportTime reportTime,
      String? reportCategory,
      int? authorId,
      int? schoolId,
      bool isActive});
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
    Object? reportType = freezed,
    Object? reportStatus = freezed,
    Object? reportTime = null,
    Object? reportCategory = freezed,
    Object? authorId = freezed,
    Object? schoolId = freezed,
    Object? isActive = null,
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
      reportType: freezed == reportType
          ? _value.reportType
          : reportType // ignore: cast_nullable_to_non_nullable
              as ReportType?,
      reportStatus: freezed == reportStatus
          ? _value.reportStatus
          : reportStatus // ignore: cast_nullable_to_non_nullable
              as ReportStatus?,
      reportTime: null == reportTime
          ? _value.reportTime
          : reportTime // ignore: cast_nullable_to_non_nullable
              as ReportTime,
      reportCategory: freezed == reportCategory
          ? _value.reportCategory
          : reportCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as int?,
      schoolId: freezed == schoolId
          ? _value.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
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
      ReportType? reportType,
      ReportStatus? reportStatus,
      ReportTime reportTime,
      String? reportCategory,
      int? authorId,
      int? schoolId,
      bool isActive});
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
    Object? reportType = freezed,
    Object? reportStatus = freezed,
    Object? reportTime = null,
    Object? reportCategory = freezed,
    Object? authorId = freezed,
    Object? schoolId = freezed,
    Object? isActive = null,
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
      reportType: freezed == reportType
          ? _value.reportType
          : reportType // ignore: cast_nullable_to_non_nullable
              as ReportType?,
      reportStatus: freezed == reportStatus
          ? _value.reportStatus
          : reportStatus // ignore: cast_nullable_to_non_nullable
              as ReportStatus?,
      reportTime: null == reportTime
          ? _value.reportTime
          : reportTime // ignore: cast_nullable_to_non_nullable
              as ReportTime,
      reportCategory: freezed == reportCategory
          ? _value.reportCategory
          : reportCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as int?,
      schoolId: freezed == schoolId
          ? _value.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ReportQuery implements _ReportQuery {
  const _$_ReportQuery(
      {this.page = 1,
      this.take = 200,
      this.reportType,
      this.reportStatus,
      this.reportTime = ReportTime.all,
      this.reportCategory,
      this.authorId,
      this.schoolId,
      this.isActive = true});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int take;
  @override
  final ReportType? reportType;
  @override
  final ReportStatus? reportStatus;
  @override
  @JsonKey()
  final ReportTime reportTime;
  @override
  final String? reportCategory;
  @override
  final int? authorId;
  @override
  final int? schoolId;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'ReportQuery(page: $page, take: $take, reportType: $reportType, reportStatus: $reportStatus, reportTime: $reportTime, reportCategory: $reportCategory, authorId: $authorId, schoolId: $schoolId, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportQuery &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.take, take) || other.take == take) &&
            (identical(other.reportType, reportType) ||
                other.reportType == reportType) &&
            (identical(other.reportStatus, reportStatus) ||
                other.reportStatus == reportStatus) &&
            (identical(other.reportTime, reportTime) ||
                other.reportTime == reportTime) &&
            (identical(other.reportCategory, reportCategory) ||
                other.reportCategory == reportCategory) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.schoolId, schoolId) ||
                other.schoolId == schoolId) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, take, reportType,
      reportStatus, reportTime, reportCategory, authorId, schoolId, isActive);

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
      final ReportType? reportType,
      final ReportStatus? reportStatus,
      final ReportTime reportTime,
      final String? reportCategory,
      final int? authorId,
      final int? schoolId,
      final bool isActive}) = _$_ReportQuery;

  @override
  int get page;
  @override
  int get take;
  @override
  ReportType? get reportType;
  @override
  ReportStatus? get reportStatus;
  @override
  ReportTime get reportTime;
  @override
  String? get reportCategory;
  @override
  int? get authorId;
  @override
  int? get schoolId;
  @override
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_ReportQueryCopyWith<_$_ReportQuery> get copyWith =>
      throw _privateConstructorUsedError;
}
