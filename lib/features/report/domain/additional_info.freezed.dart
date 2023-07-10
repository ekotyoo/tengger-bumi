// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'additional_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdditionalInfo _$AdditionalInfoFromJson(Map<String, dynamic> json) {
  return _AdditionalInfo.fromJson(json);
}

/// @nodoc
mixin _$AdditionalInfo {
  String get label => throw _privateConstructorUsedError;
  String get information => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdditionalInfoCopyWith<AdditionalInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdditionalInfoCopyWith<$Res> {
  factory $AdditionalInfoCopyWith(
          AdditionalInfo value, $Res Function(AdditionalInfo) then) =
      _$AdditionalInfoCopyWithImpl<$Res, AdditionalInfo>;
  @useResult
  $Res call({String label, String information});
}

/// @nodoc
class _$AdditionalInfoCopyWithImpl<$Res, $Val extends AdditionalInfo>
    implements $AdditionalInfoCopyWith<$Res> {
  _$AdditionalInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? information = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      information: null == information
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdditionalInfoCopyWith<$Res>
    implements $AdditionalInfoCopyWith<$Res> {
  factory _$$_AdditionalInfoCopyWith(
          _$_AdditionalInfo value, $Res Function(_$_AdditionalInfo) then) =
      __$$_AdditionalInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, String information});
}

/// @nodoc
class __$$_AdditionalInfoCopyWithImpl<$Res>
    extends _$AdditionalInfoCopyWithImpl<$Res, _$_AdditionalInfo>
    implements _$$_AdditionalInfoCopyWith<$Res> {
  __$$_AdditionalInfoCopyWithImpl(
      _$_AdditionalInfo _value, $Res Function(_$_AdditionalInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? information = null,
  }) {
    return _then(_$_AdditionalInfo(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      information: null == information
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdditionalInfo implements _AdditionalInfo {
  const _$_AdditionalInfo({required this.label, required this.information});

  factory _$_AdditionalInfo.fromJson(Map<String, dynamic> json) =>
      _$$_AdditionalInfoFromJson(json);

  @override
  final String label;
  @override
  final String information;

  @override
  String toString() {
    return 'AdditionalInfo(label: $label, information: $information)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdditionalInfo &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.information, information) ||
                other.information == information));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, information);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdditionalInfoCopyWith<_$_AdditionalInfo> get copyWith =>
      __$$_AdditionalInfoCopyWithImpl<_$_AdditionalInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdditionalInfoToJson(
      this,
    );
  }
}

abstract class _AdditionalInfo implements AdditionalInfo {
  const factory _AdditionalInfo(
      {required final String label,
      required final String information}) = _$_AdditionalInfo;

  factory _AdditionalInfo.fromJson(Map<String, dynamic> json) =
      _$_AdditionalInfo.fromJson;

  @override
  String get label;
  @override
  String get information;
  @override
  @JsonKey(ignore: true)
  _$$_AdditionalInfoCopyWith<_$_AdditionalInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
