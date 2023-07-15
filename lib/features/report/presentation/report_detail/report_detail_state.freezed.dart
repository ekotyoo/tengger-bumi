// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReportDetailState {
  PlantDetail? get report => throw _privateConstructorUsedError;
  bool get commentLoading => throw _privateConstructorUsedError;
  bool get reportDeleting => throw _privateConstructorUsedError;
  String? get successMessage => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReportDetailStateCopyWith<ReportDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportDetailStateCopyWith<$Res> {
  factory $ReportDetailStateCopyWith(
          ReportDetailState value, $Res Function(ReportDetailState) then) =
      _$ReportDetailStateCopyWithImpl<$Res, ReportDetailState>;
  @useResult
  $Res call(
      {PlantDetail? report,
      bool commentLoading,
      bool reportDeleting,
      String? successMessage,
      String? errorMessage});

  $PlantDetailCopyWith<$Res>? get report;
}

/// @nodoc
class _$ReportDetailStateCopyWithImpl<$Res, $Val extends ReportDetailState>
    implements $ReportDetailStateCopyWith<$Res> {
  _$ReportDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? report = freezed,
    Object? commentLoading = null,
    Object? reportDeleting = null,
    Object? successMessage = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      report: freezed == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as PlantDetail?,
      commentLoading: null == commentLoading
          ? _value.commentLoading
          : commentLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      reportDeleting: null == reportDeleting
          ? _value.reportDeleting
          : reportDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
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

  @override
  @pragma('vm:prefer-inline')
  $PlantDetailCopyWith<$Res>? get report {
    if (_value.report == null) {
      return null;
    }

    return $PlantDetailCopyWith<$Res>(_value.report!, (value) {
      return _then(_value.copyWith(report: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReportDetailStateCopyWith<$Res>
    implements $ReportDetailStateCopyWith<$Res> {
  factory _$$_ReportDetailStateCopyWith(_$_ReportDetailState value,
          $Res Function(_$_ReportDetailState) then) =
      __$$_ReportDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PlantDetail? report,
      bool commentLoading,
      bool reportDeleting,
      String? successMessage,
      String? errorMessage});

  @override
  $PlantDetailCopyWith<$Res>? get report;
}

/// @nodoc
class __$$_ReportDetailStateCopyWithImpl<$Res>
    extends _$ReportDetailStateCopyWithImpl<$Res, _$_ReportDetailState>
    implements _$$_ReportDetailStateCopyWith<$Res> {
  __$$_ReportDetailStateCopyWithImpl(
      _$_ReportDetailState _value, $Res Function(_$_ReportDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? report = freezed,
    Object? commentLoading = null,
    Object? reportDeleting = null,
    Object? successMessage = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_ReportDetailState(
      report: freezed == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as PlantDetail?,
      commentLoading: null == commentLoading
          ? _value.commentLoading
          : commentLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      reportDeleting: null == reportDeleting
          ? _value.reportDeleting
          : reportDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
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

class _$_ReportDetailState implements _ReportDetailState {
  const _$_ReportDetailState(
      {this.report,
      this.commentLoading = false,
      this.reportDeleting = false,
      this.successMessage,
      this.errorMessage});

  @override
  final PlantDetail? report;
  @override
  @JsonKey()
  final bool commentLoading;
  @override
  @JsonKey()
  final bool reportDeleting;
  @override
  final String? successMessage;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ReportDetailState(report: $report, commentLoading: $commentLoading, reportDeleting: $reportDeleting, successMessage: $successMessage, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportDetailState &&
            (identical(other.report, report) || other.report == report) &&
            (identical(other.commentLoading, commentLoading) ||
                other.commentLoading == commentLoading) &&
            (identical(other.reportDeleting, reportDeleting) ||
                other.reportDeleting == reportDeleting) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, report, commentLoading,
      reportDeleting, successMessage, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportDetailStateCopyWith<_$_ReportDetailState> get copyWith =>
      __$$_ReportDetailStateCopyWithImpl<_$_ReportDetailState>(
          this, _$identity);
}

abstract class _ReportDetailState implements ReportDetailState {
  const factory _ReportDetailState(
      {final PlantDetail? report,
      final bool commentLoading,
      final bool reportDeleting,
      final String? successMessage,
      final String? errorMessage}) = _$_ReportDetailState;

  @override
  PlantDetail? get report;
  @override
  bool get commentLoading;
  @override
  bool get reportDeleting;
  @override
  String? get successMessage;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ReportDetailStateCopyWith<_$_ReportDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
