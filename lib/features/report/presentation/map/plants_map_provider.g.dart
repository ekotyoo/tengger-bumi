// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plants_map_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPlantsMapHash() => r'8af1ae3bc1681d022c94b2e2c2ec0f71efe96b4a';

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

typedef GetPlantsMapRef = AutoDisposeFutureProviderRef<List<Plant>>;

/// See also [getPlantsMap].
@ProviderFor(getPlantsMap)
const getPlantsMapProvider = GetPlantsMapFamily();

/// See also [getPlantsMap].
class GetPlantsMapFamily extends Family<AsyncValue<List<Plant>>> {
  /// See also [getPlantsMap].
  const GetPlantsMapFamily();

  /// See also [getPlantsMap].
  GetPlantsMapProvider call({
    required ReportQuery query,
  }) {
    return GetPlantsMapProvider(
      query: query,
    );
  }

  @override
  GetPlantsMapProvider getProviderOverride(
    covariant GetPlantsMapProvider provider,
  ) {
    return call(
      query: provider.query,
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
  String? get name => r'getPlantsMapProvider';
}

/// See also [getPlantsMap].
class GetPlantsMapProvider extends AutoDisposeFutureProvider<List<Plant>> {
  /// See also [getPlantsMap].
  GetPlantsMapProvider({
    required this.query,
  }) : super.internal(
          (ref) => getPlantsMap(
            ref,
            query: query,
          ),
          from: getPlantsMapProvider,
          name: r'getPlantsMapProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPlantsMapHash,
          dependencies: GetPlantsMapFamily._dependencies,
          allTransitiveDependencies:
              GetPlantsMapFamily._allTransitiveDependencies,
        );

  final ReportQuery query;

  @override
  bool operator ==(Object other) {
    return other is GetPlantsMapProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$reportMapFilterStateHash() =>
    r'eeeebfc0c3379ad8f7ce136fabb3f4f60a599f9b';

/// See also [ReportMapFilterState].
@ProviderFor(ReportMapFilterState)
final reportMapFilterStateProvider =
    AutoDisposeNotifierProvider<ReportMapFilterState, ReportQuery>.internal(
  ReportMapFilterState.new,
  name: r'reportMapFilterStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reportMapFilterStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ReportMapFilterState = AutoDisposeNotifier<ReportQuery>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
