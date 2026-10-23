// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_request_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(leaveRequestRepository)
final leaveRequestRepositoryProvider = LeaveRequestRepositoryProvider._();

final class LeaveRequestRepositoryProvider
    extends
        $FunctionalProvider<
          LeaveRequestRepository,
          LeaveRequestRepository,
          LeaveRequestRepository
        >
    with $Provider<LeaveRequestRepository> {
  LeaveRequestRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'leaveRequestRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$leaveRequestRepositoryHash();

  @$internal
  @override
  $ProviderElement<LeaveRequestRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LeaveRequestRepository create(Ref ref) {
    return leaveRequestRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LeaveRequestRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LeaveRequestRepository>(value),
    );
  }
}

String _$leaveRequestRepositoryHash() =>
    r'b7c619c5f85d57dcc01d426930c1949692f9c6fa';

@ProviderFor(fetchLeaveTypesData)
final fetchLeaveTypesDataProvider = FetchLeaveTypesDataProvider._();

final class FetchLeaveTypesDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<LeaveTypeResponse>,
          LeaveTypeResponse,
          FutureOr<LeaveTypeResponse>
        >
    with
        $FutureModifier<LeaveTypeResponse>,
        $FutureProvider<LeaveTypeResponse> {
  FetchLeaveTypesDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchLeaveTypesDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchLeaveTypesDataHash();

  @$internal
  @override
  $FutureProviderElement<LeaveTypeResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LeaveTypeResponse> create(Ref ref) {
    return fetchLeaveTypesData(ref);
  }
}

String _$fetchLeaveTypesDataHash() =>
    r'5bcb229ab25860418746a3d3ebc94e45ede5a370';
