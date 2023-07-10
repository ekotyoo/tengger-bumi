// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reportDetailControllerHash() =>
    r'f6925ea4e06acb08e7a8a9595b7003a9ed5351b2';

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

abstract class _$ReportDetailController
    extends BuildlessAutoDisposeAsyncNotifier<ReportDetailState> {
  late final int reportId;

  FutureOr<ReportDetailState> build(
    int reportId,
  );
}

/// See also [ReportDetailController].
@ProviderFor(ReportDetailController)
const reportDetailControllerProvider = ReportDetailControllerFamily();

/// See also [ReportDetailController].
class ReportDetailControllerFamily
    extends Family<AsyncValue<ReportDetailState>> {
  /// See also [ReportDetailController].
  const ReportDetailControllerFamily();

  /// See also [ReportDetailController].
  ReportDetailControllerProvider call(
    int reportId,
  ) {
    return ReportDetailControllerProvider(
      reportId,
    );
  }

  @override
  ReportDetailControllerProvider getProviderOverride(
    covariant ReportDetailControllerProvider provider,
  ) {
    return call(
      provider.reportId,
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
  String? get name => r'reportDetailControllerProvider';
}

/// See also [ReportDetailController].
class ReportDetailControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ReportDetailController,
        ReportDetailState> {
  /// See also [ReportDetailController].
  ReportDetailControllerProvider(
    this.reportId,
  ) : super.internal(
          () => ReportDetailController()..reportId = reportId,
          from: reportDetailControllerProvider,
          name: r'reportDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reportDetailControllerHash,
          dependencies: ReportDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              ReportDetailControllerFamily._allTransitiveDependencies,
        );

  final int reportId;

  @override
  bool operator ==(Object other) {
    return other is ReportDetailControllerProvider &&
        other.reportId == reportId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, reportId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<ReportDetailState> runNotifierBuild(
    covariant ReportDetailController notifier,
  ) {
    return notifier.build(
      reportId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
