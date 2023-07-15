// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_feed_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReportFeedState {
  List<Plant> get reports => throw _privateConstructorUsedError;
  String? get successMessage => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReportFeedStateCopyWith<ReportFeedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportFeedStateCopyWith<$Res> {
  factory $ReportFeedStateCopyWith(
          ReportFeedState value, $Res Function(ReportFeedState) then) =
      _$ReportFeedStateCopyWithImpl<$Res, ReportFeedState>;
  @useResult
  $Res call(
      {List<Plant> reports, String? successMessage, String? errorMessage});
}

/// @nodoc
class _$ReportFeedStateCopyWithImpl<$Res, $Val extends ReportFeedState>
    implements $ReportFeedStateCopyWith<$Res> {
  _$ReportFeedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reports = null,
    Object? successMessage = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      reports: null == reports
          ? _value.reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<Plant>,
      successMessage: freezed == successMessage
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReportFeedStateCopyWith<$Res>
    implements $ReportFeedStateCopyWith<$Res> {
  factory _$$_ReportFeedStateCopyWith(
          _$_ReportFeedState value, $Res Function(_$_ReportFeedState) then) =
      __$$_ReportFeedStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Plant> reports, String? successMessage, String? errorMessage});
}

/// @nodoc
class __$$_ReportFeedStateCopyWithImpl<$Res>
    extends _$ReportFeedStateCopyWithImpl<$Res, _$_ReportFeedState>
    implements _$$_ReportFeedStateCopyWith<$Res> {
  __$$_ReportFeedStateCopyWithImpl(
      _$_ReportFeedState _value, $Res Function(_$_ReportFeedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reports = null,
    Object? successMessage = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_ReportFeedState(
      reports: null == reports
          ? _value._reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<Plant>,
      successMessage: freezed == successMessage
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ReportFeedState implements _ReportFeedState {
  const _$_ReportFeedState(
      {final List<Plant> reports = const [],
      this.successMessage,
      this.errorMessage})
      : _reports = reports;

  final List<Plant> _reports;
  @override
  @JsonKey()
  List<Plant> get reports {
    if (_reports is EqualUnmodifiableListView) return _reports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reports);
  }

  @override
  final String? successMessage;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ReportFeedState(reports: $reports, successMessage: $successMessage, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportFeedState &&
            const DeepCollectionEquality().equals(other._reports, _reports) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_reports),
      successMessage,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportFeedStateCopyWith<_$_ReportFeedState> get copyWith =>
      __$$_ReportFeedStateCopyWithImpl<_$_ReportFeedState>(this, _$identity);
}

abstract class _ReportFeedState implements ReportFeedState {
  const factory _ReportFeedState(
      {final List<Plant> reports,
      final String? successMessage,
      final String? errorMessage}) = _$_ReportFeedState;

  @override
  List<Plant> get reports;
  @override
  String? get successMessage;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ReportFeedStateCopyWith<_$_ReportFeedState> get copyWith =>
      throw _privateConstructorUsedError;
}
