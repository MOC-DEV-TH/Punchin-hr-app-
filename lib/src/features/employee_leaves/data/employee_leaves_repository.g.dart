// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_leaves_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(employeeLeavesRepository)
final employeeLeavesRepositoryProvider = EmployeeLeavesRepositoryProvider._();

final class EmployeeLeavesRepositoryProvider
    extends
        $FunctionalProvider<
          EmployeeLeavesRepository,
          EmployeeLeavesRepository,
          EmployeeLeavesRepository
        >
    with $Provider<EmployeeLeavesRepository> {
  EmployeeLeavesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'employeeLeavesRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$employeeLeavesRepositoryHash();

  @$internal
  @override
  $ProviderElement<EmployeeLeavesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EmployeeLeavesRepository create(Ref ref) {
    return employeeLeavesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EmployeeLeavesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EmployeeLeavesRepository>(value),
    );
  }
}

String _$employeeLeavesRepositoryHash() =>
    r'fc41b3f26275e7e3dda459b4932bce8ca8e6c017';

@ProviderFor(fetchAllEmployeeLeaves)
final fetchAllEmployeeLeavesProvider = FetchAllEmployeeLeavesFamily._();

final class FetchAllEmployeeLeavesProvider
    extends
        $FunctionalProvider<
          AsyncValue<LeaveStatusResponse>,
          LeaveStatusResponse,
          FutureOr<LeaveStatusResponse>
        >
    with
        $FutureModifier<LeaveStatusResponse>,
        $FutureProvider<LeaveStatusResponse> {
  FetchAllEmployeeLeavesProvider._({
    required FetchAllEmployeeLeavesFamily super.from,
    required ({String? date, String? leaveStatus}) super.argument,
  }) : super(
         retry: null,
         name: r'fetchAllEmployeeLeavesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchAllEmployeeLeavesHash();

  @override
  String toString() {
    return r'fetchAllEmployeeLeavesProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<LeaveStatusResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LeaveStatusResponse> create(Ref ref) {
    final argument = this.argument as ({String? date, String? leaveStatus});
    return fetchAllEmployeeLeaves(
      ref,
      date: argument.date,
      leaveStatus: argument.leaveStatus,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAllEmployeeLeavesProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchAllEmployeeLeavesHash() =>
    r'e882cfea198cd8e01be5228368c192a16af04a50';

final class FetchAllEmployeeLeavesFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<LeaveStatusResponse>,
          ({String? date, String? leaveStatus})
        > {
  FetchAllEmployeeLeavesFamily._()
    : super(
        retry: null,
        name: r'fetchAllEmployeeLeavesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchAllEmployeeLeavesProvider call({String? date, String? leaveStatus}) =>
      FetchAllEmployeeLeavesProvider._(
        argument: (date: date, leaveStatus: leaveStatus),
        from: this,
      );

  @override
  String toString() => r'fetchAllEmployeeLeavesProvider';
}
