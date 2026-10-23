// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_details_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(employeeDetailsRepository)
final employeeDetailsRepositoryProvider = EmployeeDetailsRepositoryProvider._();

final class EmployeeDetailsRepositoryProvider
    extends
        $FunctionalProvider<
          EmployeeDetailsRepository,
          EmployeeDetailsRepository,
          EmployeeDetailsRepository
        >
    with $Provider<EmployeeDetailsRepository> {
  EmployeeDetailsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'employeeDetailsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$employeeDetailsRepositoryHash();

  @$internal
  @override
  $ProviderElement<EmployeeDetailsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EmployeeDetailsRepository create(Ref ref) {
    return employeeDetailsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EmployeeDetailsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EmployeeDetailsRepository>(value),
    );
  }
}

String _$employeeDetailsRepositoryHash() =>
    r'bded034d0ef722c69808b81f971a38dc4413e66c';

@ProviderFor(fetchEmployeeProfileData)
final fetchEmployeeProfileDataProvider = FetchEmployeeProfileDataFamily._();

final class FetchEmployeeProfileDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<EmployeeProfileResponse>,
          EmployeeProfileResponse,
          FutureOr<EmployeeProfileResponse>
        >
    with
        $FutureModifier<EmployeeProfileResponse>,
        $FutureProvider<EmployeeProfileResponse> {
  FetchEmployeeProfileDataProvider._({
    required FetchEmployeeProfileDataFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'fetchEmployeeProfileDataProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchEmployeeProfileDataHash();

  @override
  String toString() {
    return r'fetchEmployeeProfileDataProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<EmployeeProfileResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<EmployeeProfileResponse> create(Ref ref) {
    final argument = this.argument as int;
    return fetchEmployeeProfileData(ref, userID: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchEmployeeProfileDataProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchEmployeeProfileDataHash() =>
    r'2a00c86c98827906ae9a07de25807e4da25f17ce';

final class FetchEmployeeProfileDataFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<EmployeeProfileResponse>, int> {
  FetchEmployeeProfileDataFamily._()
    : super(
        retry: null,
        name: r'fetchEmployeeProfileDataProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchEmployeeProfileDataProvider call({required int userID}) =>
      FetchEmployeeProfileDataProvider._(argument: userID, from: this);

  @override
  String toString() => r'fetchEmployeeProfileDataProvider';
}

@ProviderFor(fetchEmployeeLeavesData)
final fetchEmployeeLeavesDataProvider = FetchEmployeeLeavesDataFamily._();

final class FetchEmployeeLeavesDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<LeaveStatusResponse>,
          LeaveStatusResponse,
          FutureOr<LeaveStatusResponse>
        >
    with
        $FutureModifier<LeaveStatusResponse>,
        $FutureProvider<LeaveStatusResponse> {
  FetchEmployeeLeavesDataProvider._({
    required FetchEmployeeLeavesDataFamily super.from,
    required ({int userID, String leaveStatus}) super.argument,
  }) : super(
         retry: null,
         name: r'fetchEmployeeLeavesDataProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchEmployeeLeavesDataHash();

  @override
  String toString() {
    return r'fetchEmployeeLeavesDataProvider'
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
    final argument = this.argument as ({int userID, String leaveStatus});
    return fetchEmployeeLeavesData(
      ref,
      userID: argument.userID,
      leaveStatus: argument.leaveStatus,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchEmployeeLeavesDataProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchEmployeeLeavesDataHash() =>
    r'89cdd6cc9f91da62f33f66ffa01173dcb09bdef7';

final class FetchEmployeeLeavesDataFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<LeaveStatusResponse>,
          ({int userID, String leaveStatus})
        > {
  FetchEmployeeLeavesDataFamily._()
    : super(
        retry: null,
        name: r'fetchEmployeeLeavesDataProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchEmployeeLeavesDataProvider call({
    required int userID,
    required String leaveStatus,
  }) => FetchEmployeeLeavesDataProvider._(
    argument: (userID: userID, leaveStatus: leaveStatus),
    from: this,
  );

  @override
  String toString() => r'fetchEmployeeLeavesDataProvider';
}

@ProviderFor(fetchEmployeeAttendancesData)
final fetchEmployeeAttendancesDataProvider =
    FetchEmployeeAttendancesDataFamily._();

final class FetchEmployeeAttendancesDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<AttendanceResponse>,
          AttendanceResponse,
          FutureOr<AttendanceResponse>
        >
    with
        $FutureModifier<AttendanceResponse>,
        $FutureProvider<AttendanceResponse> {
  FetchEmployeeAttendancesDataProvider._({
    required FetchEmployeeAttendancesDataFamily super.from,
    required ({int userID, String year, String month}) super.argument,
  }) : super(
         retry: null,
         name: r'fetchEmployeeAttendancesDataProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchEmployeeAttendancesDataHash();

  @override
  String toString() {
    return r'fetchEmployeeAttendancesDataProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<AttendanceResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AttendanceResponse> create(Ref ref) {
    final argument = this.argument as ({int userID, String year, String month});
    return fetchEmployeeAttendancesData(
      ref,
      userID: argument.userID,
      year: argument.year,
      month: argument.month,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchEmployeeAttendancesDataProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchEmployeeAttendancesDataHash() =>
    r'f5a5e3add7d799af6b4e026c6f2a90c98b198f97';

final class FetchEmployeeAttendancesDataFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<AttendanceResponse>,
          ({int userID, String year, String month})
        > {
  FetchEmployeeAttendancesDataFamily._()
    : super(
        retry: null,
        name: r'fetchEmployeeAttendancesDataProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchEmployeeAttendancesDataProvider call({
    required int userID,
    required String year,
    required String month,
  }) => FetchEmployeeAttendancesDataProvider._(
    argument: (userID: userID, year: year, month: month),
    from: this,
  );

  @override
  String toString() => r'fetchEmployeeAttendancesDataProvider';
}

@ProviderFor(fetchEmployeeLeaveSummaryData)
final fetchEmployeeLeaveSummaryDataProvider =
    FetchEmployeeLeaveSummaryDataFamily._();

final class FetchEmployeeLeaveSummaryDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<LeaveSummaryResponse>,
          LeaveSummaryResponse,
          FutureOr<LeaveSummaryResponse>
        >
    with
        $FutureModifier<LeaveSummaryResponse>,
        $FutureProvider<LeaveSummaryResponse> {
  FetchEmployeeLeaveSummaryDataProvider._({
    required FetchEmployeeLeaveSummaryDataFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'fetchEmployeeLeaveSummaryDataProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchEmployeeLeaveSummaryDataHash();

  @override
  String toString() {
    return r'fetchEmployeeLeaveSummaryDataProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<LeaveSummaryResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LeaveSummaryResponse> create(Ref ref) {
    final argument = this.argument as int;
    return fetchEmployeeLeaveSummaryData(ref, userID: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchEmployeeLeaveSummaryDataProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchEmployeeLeaveSummaryDataHash() =>
    r'b9a7822c12071e680fb988e58ed2abaa8798e027';

final class FetchEmployeeLeaveSummaryDataFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<LeaveSummaryResponse>, int> {
  FetchEmployeeLeaveSummaryDataFamily._()
    : super(
        retry: null,
        name: r'fetchEmployeeLeaveSummaryDataProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchEmployeeLeaveSummaryDataProvider call({required int userID}) =>
      FetchEmployeeLeaveSummaryDataProvider._(argument: userID, from: this);

  @override
  String toString() => r'fetchEmployeeLeaveSummaryDataProvider';
}

@ProviderFor(fetchEmployeeWfhRequestData)
final fetchEmployeeWfhRequestDataProvider =
    FetchEmployeeWfhRequestDataFamily._();

final class FetchEmployeeWfhRequestDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProfileWfhRequestsResponse>,
          ProfileWfhRequestsResponse,
          FutureOr<ProfileWfhRequestsResponse>
        >
    with
        $FutureModifier<ProfileWfhRequestsResponse>,
        $FutureProvider<ProfileWfhRequestsResponse> {
  FetchEmployeeWfhRequestDataProvider._({
    required FetchEmployeeWfhRequestDataFamily super.from,
    required ({int userID, String status, int pageNo}) super.argument,
  }) : super(
         retry: null,
         name: r'fetchEmployeeWfhRequestDataProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchEmployeeWfhRequestDataHash();

  @override
  String toString() {
    return r'fetchEmployeeWfhRequestDataProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<ProfileWfhRequestsResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ProfileWfhRequestsResponse> create(Ref ref) {
    final argument = this.argument as ({int userID, String status, int pageNo});
    return fetchEmployeeWfhRequestData(
      ref,
      userID: argument.userID,
      status: argument.status,
      pageNo: argument.pageNo,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchEmployeeWfhRequestDataProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchEmployeeWfhRequestDataHash() =>
    r'2275e2bbbb9b1556daf8c5acf36664b2db22d25f';

final class FetchEmployeeWfhRequestDataFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<ProfileWfhRequestsResponse>,
          ({int userID, String status, int pageNo})
        > {
  FetchEmployeeWfhRequestDataFamily._()
    : super(
        retry: null,
        name: r'fetchEmployeeWfhRequestDataProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchEmployeeWfhRequestDataProvider call({
    required int userID,
    required String status,
    required int pageNo,
  }) => FetchEmployeeWfhRequestDataProvider._(
    argument: (userID: userID, status: status, pageNo: pageNo),
    from: this,
  );

  @override
  String toString() => r'fetchEmployeeWfhRequestDataProvider';
}
