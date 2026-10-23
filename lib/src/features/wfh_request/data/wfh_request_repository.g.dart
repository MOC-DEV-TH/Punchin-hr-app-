// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wfh_request_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(wfhRequestRepository)
final wfhRequestRepositoryProvider = WfhRequestRepositoryProvider._();

final class WfhRequestRepositoryProvider
    extends
        $FunctionalProvider<
          WfhRequestRepository,
          WfhRequestRepository,
          WfhRequestRepository
        >
    with $Provider<WfhRequestRepository> {
  WfhRequestRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wfhRequestRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wfhRequestRepositoryHash();

  @$internal
  @override
  $ProviderElement<WfhRequestRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WfhRequestRepository create(Ref ref) {
    return wfhRequestRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WfhRequestRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WfhRequestRepository>(value),
    );
  }
}

String _$wfhRequestRepositoryHash() =>
    r'31d893207cda55b670e06a740ceac2bb7127e427';
