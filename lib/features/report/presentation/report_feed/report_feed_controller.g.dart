// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_feed_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCategoriesHash() => r'74bc138b1da357aae29e1f92eacc41e0d75b95df';

/// See also [getCategories].
@ProviderFor(getCategories)
final getCategoriesProvider =
    AutoDisposeFutureProvider<List<Category>>.internal(
  getCategories,
  name: r'getCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCategoriesRef = AutoDisposeFutureProviderRef<List<Category>>;
String _$reportFilterStateHash() => r'f9a1d5ca8ecbfcc299136c46227441436a117564';

/// See also [ReportFilterState].
@ProviderFor(ReportFilterState)
final reportFilterStateProvider =
    AutoDisposeNotifierProvider<ReportFilterState, ReportQuery>.internal(
  ReportFilterState.new,
  name: r'reportFilterStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reportFilterStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ReportFilterState = AutoDisposeNotifier<ReportQuery>;
String _$reportFeedControllerHash() =>
    r'46cf3b4ff359538380c24b286443034ed9f18c87';

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

abstract class _$ReportFeedController
    extends BuildlessAutoDisposeAsyncNotifier<ReportFeedState> {
  late final ReportQuery query;

  FutureOr<ReportFeedState> build(
    ReportQuery query,
  );
}

/// See also [ReportFeedController].
@ProviderFor(ReportFeedController)
const reportFeedControllerProvider = ReportFeedControllerFamily();

/// See also [ReportFeedController].
class ReportFeedControllerFamily extends Family<AsyncValue<ReportFeedState>> {
  /// See also [ReportFeedController].
  const ReportFeedControllerFamily();

  /// See also [ReportFeedController].
  ReportFeedControllerProvider call(
    ReportQuery query,
  ) {
    return ReportFeedControllerProvider(
      query,
    );
  }

  @override
  ReportFeedControllerProvider getProviderOverride(
    covariant ReportFeedControllerProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'reportFeedControllerProvider';
}

/// See also [ReportFeedController].
class ReportFeedControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ReportFeedController, ReportFeedState> {
  /// See also [ReportFeedController].
  ReportFeedControllerProvider(
    this.query,
  ) : super.internal(
          () => ReportFeedController()..query = query,
          from: reportFeedControllerProvider,
          name: r'reportFeedControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reportFeedControllerHash,
          dependencies: ReportFeedControllerFamily._dependencies,
          allTransitiveDependencies:
              ReportFeedControllerFamily._allTransitiveDependencies,
        );

  final ReportQuery query;

  @override
  bool operator ==(Object other) {
    return other is ReportFeedControllerProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<ReportFeedState> runNotifierBuild(
    covariant ReportFeedController notifier,
  ) {
    return notifier.build(
      query,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
