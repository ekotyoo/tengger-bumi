// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditProfileState {
  dynamic get nameTextInput => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get validated => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  XFile? get newAvatar => throw _privateConstructorUsedError;
  SignedIn get user => throw _privateConstructorUsedError;
  String? get successMessage => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditProfileStateCopyWith<EditProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileStateCopyWith<$Res> {
  factory $EditProfileStateCopyWith(
          EditProfileState value, $Res Function(EditProfileState) then) =
      _$EditProfileStateCopyWithImpl<$Res, EditProfileState>;
  @useResult
  $Res call(
      {dynamic nameTextInput,
      bool isSubmitting,
      bool validated,
      String? avatar,
      XFile? newAvatar,
      SignedIn user,
      String? successMessage,
      String? errorMessage});
}

/// @nodoc
class _$EditProfileStateCopyWithImpl<$Res, $Val extends EditProfileState>
    implements $EditProfileStateCopyWith<$Res> {
  _$EditProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameTextInput = freezed,
    Object? isSubmitting = null,
    Object? validated = null,
    Object? avatar = freezed,
    Object? newAvatar = freezed,
    Object? user = freezed,
    Object? successMessage = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      nameTextInput: freezed == nameTextInput
          ? _value.nameTextInput
          : nameTextInput // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      validated: null == validated
          ? _value.validated
          : validated // ignore: cast_nullable_to_non_nullable
              as bool,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      newAvatar: freezed == newAvatar
          ? _value.newAvatar
          : newAvatar // ignore: cast_nullable_to_non_nullable
              as XFile?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as SignedIn,
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
abstract class _$$_EditProfileStateCopyWith<$Res>
    implements $EditProfileStateCopyWith<$Res> {
  factory _$$_EditProfileStateCopyWith(
          _$_EditProfileState value, $Res Function(_$_EditProfileState) then) =
      __$$_EditProfileStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic nameTextInput,
      bool isSubmitting,
      bool validated,
      String? avatar,
      XFile? newAvatar,
      SignedIn user,
      String? successMessage,
      String? errorMessage});
}

/// @nodoc
class __$$_EditProfileStateCopyWithImpl<$Res>
    extends _$EditProfileStateCopyWithImpl<$Res, _$_EditProfileState>
    implements _$$_EditProfileStateCopyWith<$Res> {
  __$$_EditProfileStateCopyWithImpl(
      _$_EditProfileState _value, $Res Function(_$_EditProfileState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameTextInput = freezed,
    Object? isSubmitting = null,
    Object? validated = null,
    Object? avatar = freezed,
    Object? newAvatar = freezed,
    Object? user = freezed,
    Object? successMessage = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_EditProfileState(
      nameTextInput:
          freezed == nameTextInput ? _value.nameTextInput! : nameTextInput,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      validated: null == validated
          ? _value.validated
          : validated // ignore: cast_nullable_to_non_nullable
              as bool,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      newAvatar: freezed == newAvatar
          ? _value.newAvatar
          : newAvatar // ignore: cast_nullable_to_non_nullable
              as XFile?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as SignedIn,
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

class _$_EditProfileState implements _EditProfileState {
  const _$_EditProfileState(
      {this.nameTextInput = const NameTextInput.pure(),
      this.isSubmitting = false,
      this.validated = false,
      this.avatar,
      this.newAvatar,
      required this.user,
      this.successMessage,
      this.errorMessage});

  @override
  @JsonKey()
  final dynamic nameTextInput;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  @JsonKey()
  final bool validated;
  @override
  final String? avatar;
  @override
  final XFile? newAvatar;
  @override
  final SignedIn user;
  @override
  final String? successMessage;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'EditProfileState(nameTextInput: $nameTextInput, isSubmitting: $isSubmitting, validated: $validated, avatar: $avatar, newAvatar: $newAvatar, user: $user, successMessage: $successMessage, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditProfileState &&
            const DeepCollectionEquality()
                .equals(other.nameTextInput, nameTextInput) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.validated, validated) ||
                other.validated == validated) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.newAvatar, newAvatar) ||
                other.newAvatar == newAvatar) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(nameTextInput),
      isSubmitting,
      validated,
      avatar,
      newAvatar,
      const DeepCollectionEquality().hash(user),
      successMessage,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditProfileStateCopyWith<_$_EditProfileState> get copyWith =>
      __$$_EditProfileStateCopyWithImpl<_$_EditProfileState>(this, _$identity);
}

abstract class _EditProfileState implements EditProfileState {
  const factory _EditProfileState(
      {final dynamic nameTextInput,
      final bool isSubmitting,
      final bool validated,
      final String? avatar,
      final XFile? newAvatar,
      required final SignedIn user,
      final String? successMessage,
      final String? errorMessage}) = _$_EditProfileState;

  @override
  dynamic get nameTextInput;
  @override
  bool get isSubmitting;
  @override
  bool get validated;
  @override
  String? get avatar;
  @override
  XFile? get newAvatar;
  @override
  SignedIn get user;
  @override
  String? get successMessage;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_EditProfileStateCopyWith<_$_EditProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
