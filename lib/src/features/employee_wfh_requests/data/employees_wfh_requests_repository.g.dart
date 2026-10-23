// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employees_wfh_requests_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(employeesWfhRequestsRepository)
final employeesWfhRequestsRepositoryProvider =
    EmployeesWfhRequestsRepositoryProvider._();

final class EmployeesWfhRequestsRepositoryProvider
    extends
        $FunctionalProvider<
          EmployeesWfhRequestsRepository,
          EmployeesWfhRequestsRepository,
          EmployeesWfhRequestsRepository
        >
    with $Provider<EmployeesWfhRequestsRepository> {
  EmployeesWfhRequestsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'employeesWfhRequestsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$employeesWfhRequestsRepositoryHash();

  @$internal
  @override
  $ProviderElement<EmployeesWfhRequestsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EmployeesWfhRequestsRepository create(Ref ref) {
    return employeesWfhRequestsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EmployeesWfhRequestsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EmployeesWfhRequestsRepository>(
        value,
      ),
    );
  }
}

String _$employeesWfhRequestsRepositoryHash() =>
    r'9f2518bf3e8a15367f735774bdb2723f2a812263';

@ProviderFor(fetchAllEmployeesWfhRequest)
final fetchAllEmployeesWfhRequestProvider =
    FetchAllEmployeesWfhRequestFamily._();

final class FetchAllEmployeesWfhRequestProvider
    extends
        $FunctionalProvider<
          AsyncValue<WfhRequestsResponse>,
          WfhRequestsResponse,
          FutureOr<WfhRequestsResponse>
        >
    with
        $FutureModifier<WfhRequestsResponse>,
        $FutureProvider<WfhRequestsResponse> {
  FetchAllEmployeesWfhRequestProvider._({
    required FetchAllEmployeesWfhRequestFamily super.from,
    required ({String? date, String? leaveStatus}) super.argument,
  }) : super(
         retry: null,
         name: r'fetchAllEmployeesWfhRequestProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchAllEmployeesWfhRequestHash();

  @override
  String toString() {
    return r'fetchAllEmployeesWfhRequestProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<WfhRequestsResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<WfhRequestsResponse> create(Ref ref) {
    final argument = this.argument as ({String? date, String? leaveStatus});
    return fetchAllEmployeesWfhRequest(
      ref,
      date: argument.date,
      leaveStatus: argument.leaveStatus,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAllEmployeesWfhRequestProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchAllEmployeesWfhRequestHash() =>
    r'75d54a72e222a877d02a0f5fbf213c8035f2d48d';

final class FetchAllEmployeesWfhRequestFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<WfhRequestsResponse>,
          ({String? date, String? leaveStatus})
        > {
  FetchAllEmployeesWfhRequestFamily._()
    : super(
        retry: null,
        name: r'fetchAllEmployeesWfhRequestProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchAllEmployeesWfhRequestProvider call({
    String? date,
    String? leaveStatus,
  }) => FetchAllEmployeesWfhRequestProvider._(
    argument: (date: date, leaveStatus: leaveStatus),
    from: this,
  );

  @override
  String toString() => r'fetchAllEmployeesWfhRequestProvider';
}
