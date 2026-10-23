// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_status_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(leaveStatusRepository)
final leaveStatusRepositoryProvider = LeaveStatusRepositoryProvider._();

final class LeaveStatusRepositoryProvider
    extends
        $FunctionalProvider<
          LeaveStatusRepository,
          LeaveStatusRepository,
          LeaveStatusRepository
        >
    with $Provider<LeaveStatusRepository> {
  LeaveStatusRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'leaveStatusRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$leaveStatusRepositoryHash();

  @$internal
  @override
  $ProviderElement<LeaveStatusRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LeaveStatusRepository create(Ref ref) {
    return leaveStatusRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LeaveStatusRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LeaveStatusRepository>(value),
    );
  }
}

String _$leaveStatusRepositoryHash() =>
    r'8f3d1250f4bef0bedcf95a9fad516e929215ec11';

@ProviderFor(fetchLeaveStatusData)
final fetchLeaveStatusDataProvider = FetchLeaveStatusDataProvider._();

final class FetchLeaveStatusDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<LeaveStatusResponse>,
          LeaveStatusResponse,
          FutureOr<LeaveStatusResponse>
        >
    with
        $FutureModifier<LeaveStatusResponse>,
        $FutureProvider<LeaveStatusResponse> {
  FetchLeaveStatusDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchLeaveStatusDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchLeaveStatusDataHash();

  @$internal
  @override
  $FutureProviderElement<LeaveStatusResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LeaveStatusResponse> create(Ref ref) {
    return fetchLeaveStatusData(ref);
  }
}

String _$fetchLeaveStatusDataHash() =>
    r'4e8a45fe24147df89e2e9173a381e2d01c44bf69';
