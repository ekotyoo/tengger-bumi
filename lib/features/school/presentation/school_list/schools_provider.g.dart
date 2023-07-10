// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schools_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSchoolsHash() => r'f5d2687d920f5a72d873feae75cb040c701ce988';

/// See also [getSchools].
@ProviderFor(getSchools)
final getSchoolsProvider = AutoDisposeFutureProvider<List<School>>.internal(
  getSchools,
  name: r'getSchoolsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getSchoolsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetSchoolsRef = AutoDisposeFutureProviderRef<List<School>>;
String _$getSchoolsMapHash() => r'b090e8451aa70a5e6ed7643f643924d0deeaa84e';

/// See also [getSchoolsMap].
@ProviderFor(getSchoolsMap)
final getSchoolsMapProvider = AutoDisposeFutureProvider<List<School>>.internal(
  getSchoolsMap,
  name: r'getSchoolsMapProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getSchoolsMapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetSchoolsMapRef = AutoDisposeFutureProviderRef<List<School>>;
String _$schoolSearchQueryHash() => r'63167fe5c3d425cfa1c5735d1b2825712ff9d1f6';

/// See also [SchoolSearchQuery].
@ProviderFor(SchoolSearchQuery)
final schoolSearchQueryProvider =
    AutoDisposeNotifierProvider<SchoolSearchQuery, String?>.internal(
  SchoolSearchQuery.new,
  name: r'schoolSearchQueryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$schoolSearchQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SchoolSearchQuery = AutoDisposeNotifier<String?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
