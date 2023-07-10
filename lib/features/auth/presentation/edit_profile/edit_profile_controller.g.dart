// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editProfileControllerHash() =>
    r'bf58b9af264ead82eb0d60357e26bc62ba1d7193';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$EditProfileController
    extends BuildlessAutoDisposeNotifier<EditProfileState> {
  late final SignedIn user;

  EditProfileState build(
    SignedIn user,
  );
}

/// See also [EditProfileController].
@ProviderFor(EditProfileController)
const editProfileControllerProvider = EditProfileControllerFamily();

/// See also [EditProfileController].
class EditProfileControllerFamily extends Family<EditProfileState> {
  /// See also [EditProfileController].
  const EditProfileControllerFamily();

  /// See also [EditProfileController].
  EditProfileControllerProvider call(
    SignedIn user,
  ) {
    return EditProfileControllerProvider(
      user,
    );
  }

  @override
  EditProfileControllerProvider getProviderOverride(
    covariant EditProfileControllerProvider provider,
  ) {
    return call(
      provider.user,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'editProfileControllerProvider';
}

/// See also [EditProfileController].
class EditProfileControllerProvider extends AutoDisposeNotifierProviderImpl<
    EditProfileController, EditProfileState> {
  /// See also [EditProfileController].
  EditProfileControllerProvider(
    this.user,
  ) : super.internal(
          () => EditProfileController()..user = user,
          from: editProfileControllerProvider,
          name: r'editProfileControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editProfileControllerHash,
          dependencies: EditProfileControllerFamily._dependencies,
          allTransitiveDependencies:
              EditProfileControllerFamily._allTransitiveDependencies,
        );

  final SignedIn user;

  @override
  bool operator ==(Object other) {
    return other is EditProfileControllerProvider && other.user == user;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, user.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  EditProfileState runNotifierBuild(
    covariant EditProfileController notifier,
  ) {
    return notifier.build(
      user,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
