// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$schoolDetailControllerHash() =>
    r'1cf43ef93326aba97194490e147a399f301c21c3';

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

abstract class _$SchoolDetailController
    extends BuildlessAutoDisposeAsyncNotifier<SchoolDetail?> {
  late final int schoolId;

  FutureOr<SchoolDetail?> build(
    int schoolId,
  );
}

/// See also [SchoolDetailController].
@ProviderFor(SchoolDetailController)
const schoolDetailControllerProvider = SchoolDetailControllerFamily();

/// See also [SchoolDetailController].
class SchoolDetailControllerFamily extends Family<AsyncValue<SchoolDetail?>> {
  /// See also [SchoolDetailController].
  const SchoolDetailControllerFamily();

  /// See also [SchoolDetailController].
  SchoolDetailControllerProvider call(
    int schoolId,
  ) {
    return SchoolDetailControllerProvider(
      schoolId,
    );
  }

  @override
  SchoolDetailControllerProvider getProviderOverride(
    covariant SchoolDetailControllerProvider provider,
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
  String? get name => r'schoolDetailControllerProvider';
}

/// See also [SchoolDetailController].
class SchoolDetailControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SchoolDetailController,
        SchoolDetail?> {
  /// See also [SchoolDetailController].
  SchoolDetailControllerProvider(
    this.schoolId,
  ) : super.internal(
          () => SchoolDetailController()..schoolId = schoolId,
          from: schoolDetailControllerProvider,
          name: r'schoolDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$schoolDetailControllerHash,
          dependencies: SchoolDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              SchoolDetailControllerFamily._allTransitiveDependencies,
        );

  final int schoolId;

  @override
  bool operator ==(Object other) {
    return other is SchoolDetailControllerProvider &&
        other.schoolId == schoolId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, schoolId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<SchoolDetail?> runNotifierBuild(
    covariant SchoolDetailController notifier,
  ) {
    return notifier.build(
      schoolId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
