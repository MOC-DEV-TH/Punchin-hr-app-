// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employees_attendances_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(employeesAttendancesRepository)
final employeesAttendancesRepositoryProvider =
    EmployeesAttendancesRepositoryProvider._();

final class EmployeesAttendancesRepositoryProvider
    extends
        $FunctionalProvider<
          EmployeesAttendancesRepository,
          EmployeesAttendancesRepository,
          EmployeesAttendancesRepository
        >
    with $Provider<EmployeesAttendancesRepository> {
  EmployeesAttendancesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'employeesAttendancesRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$employeesAttendancesRepositoryHash();

  @$internal
  @override
  $ProviderElement<EmployeesAttendancesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EmployeesAttendancesRepository create(Ref ref) {
    return employeesAttendancesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EmployeesAttendancesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EmployeesAttendancesRepository>(
        value,
      ),
    );
  }
}

String _$employeesAttendancesRepositoryHash() =>
    r'105f1361bd9b42d64a725204486c21f3ff14484b';

@ProviderFor(fetchEmployeesAttendances)
final fetchEmployeesAttendancesProvider = FetchEmployeesAttendancesFamily._();

final class FetchEmployeesAttendancesProvider
    extends
        $FunctionalProvider<
          AsyncValue<EmployeesAttendancesResponse>,
          EmployeesAttendancesResponse,
          FutureOr<EmployeesAttendancesResponse>
        >
    with
        $FutureModifier<EmployeesAttendancesResponse>,
        $FutureProvider<EmployeesAttendancesResponse> {
  FetchEmployeesAttendancesProvider._({
    required FetchEmployeesAttendancesFamily super.from,
    required ({int businessUnitId, String date, int pageNo}) super.argument,
  }) : super(
         retry: null,
         name: r'fetchEmployeesAttendancesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchEmployeesAttendancesHash();

  @override
  String toString() {
    return r'fetchEmployeesAttendancesProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<EmployeesAttendancesResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<EmployeesAttendancesResponse> create(Ref ref) {
    final argument =
        this.argument as ({int businessUnitId, String date, int pageNo});
    return fetchEmployeesAttendances(
      ref,
      businessUnitId: argument.businessUnitId,
      date: argument.date,
      pageNo: argument.pageNo,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchEmployeesAttendancesProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchEmployeesAttendancesHash() =>
    r'cf5b6036b8181eee96649eceaa8548c793013dd3';

final class FetchEmployeesAttendancesFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<EmployeesAttendancesResponse>,
          ({int businessUnitId, String date, int pageNo})
        > {
  FetchEmployeesAttendancesFamily._()
    : super(
        retry: null,
        name: r'fetchEmployeesAttendancesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchEmployeesAttendancesProvider call({
    required int businessUnitId,
    required String date,
    required int pageNo,
  }) => FetchEmployeesAttendancesProvider._(
    argument: (businessUnitId: businessUnitId, date: date, pageNo: pageNo),
    from: this,
  );

  @override
  String toString() => r'fetchEmployeesAttendancesProvider';
}
