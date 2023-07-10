// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_school_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editSchoolControllerHash() =>
    r'a93538b9c2f305e05b70253267c264a40599e255';

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

abstract class _$EditSchoolController
    extends BuildlessAutoDisposeAsyncNotifier<EditSchoolState> {
  late final int schoolId;

  Future<EditSchoolState> build(
    int schoolId,
  );
}

/// See also [EditSchoolController].
@ProviderFor(EditSchoolController)
const editSchoolControllerProvider = EditSchoolControllerFamily();

/// See also [EditSchoolController].
class EditSchoolControllerFamily extends Family<AsyncValue<EditSchoolState>> {
  /// See also [EditSchoolController].
  const EditSchoolControllerFamily();

  /// See also [EditSchoolController].
  EditSchoolControllerProvider call(
    int schoolId,
  ) {
    return EditSchoolControllerProvider(
      schoolId,
    );
  }

  @override
  EditSchoolControllerProvider getProviderOverride(
    covariant EditSchoolControllerProvider provider,
  ) {
    return call(
      provider.schoolId,
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
  String? get name => r'editSchoolControllerProvider';
}

/// See also [EditSchoolController].
class EditSchoolControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    EditSchoolController, EditSchoolState> {
  /// See also [EditSchoolController].
  EditSchoolControllerProvider(
    this.schoolId,
  ) : super.internal(
          () => EditSchoolController()..schoolId = schoolId,
          from: editSchoolControllerProvider,
          name: r'editSchoolControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editSchoolControllerHash,
          dependencies: EditSchoolControllerFamily._dependencies,
          allTransitiveDependencies:
              EditSchoolControllerFamily._allTransitiveDependencies,
        );

  final int schoolId;

  @override
  bool operator ==(Object other) {
    return other is EditSchoolControllerProvider && other.schoolId == schoolId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, schoolId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<EditSchoolState> runNotifierBuild(
    covariant EditSchoolController notifier,
  ) {
    return notifier.build(
      schoolId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
