// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_dashboard_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(newDashboardRepository)
final newDashboardRepositoryProvider = NewDashboardRepositoryProvider._();

final class NewDashboardRepositoryProvider
    extends
        $FunctionalProvider<
          NewDashboardRepository,
          NewDashboardRepository,
          NewDashboardRepository
        >
    with $Provider<NewDashboardRepository> {
  NewDashboardRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'newDashboardRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$newDashboardRepositoryHash();

  @$internal
  @override
  $ProviderElement<NewDashboardRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NewDashboardRepository create(Ref ref) {
    return newDashboardRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NewDashboardRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NewDashboardRepository>(value),
    );
  }
}

String _$newDashboardRepositoryHash() =>
    r'88ae6e92e5037b6bca0190de43ebba53a9bd0a53';

@ProviderFor(fetchDashboardAttendedOverview)
final fetchDashboardAttendedOverviewProvider =
    FetchDashboardAttendedOverviewFamily._();

final class FetchDashboardAttendedOverviewProvider
    extends
        $FunctionalProvider<
          AsyncValue<AttendanceOverviewResponse>,
          AttendanceOverviewResponse,
          FutureOr<AttendanceOverviewResponse>
        >
    with
        $FutureModifier<AttendanceOverviewResponse>,
        $FutureProvider<AttendanceOverviewResponse> {
  FetchDashboardAttendedOverviewProvider._({
    required FetchDashboardAttendedOverviewFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'fetchDashboardAttendedOverviewProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchDashboardAttendedOverviewHash();

  @override
  String toString() {
    return r'fetchDashboardAttendedOverviewProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<AttendanceOverviewResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AttendanceOverviewResponse> create(Ref ref) {
    final argument = this.argument as String?;
    return fetchDashboardAttendedOverview(ref, date: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchDashboardAttendedOverviewProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchDashboardAttendedOverviewHash() =>
    r'54c1a59c4f3d306b5bae29bbee65f31a106e4afe';

final class FetchDashboardAttendedOverviewFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<AttendanceOverviewResponse>,
          String?
        > {
  FetchDashboardAttendedOverviewFamily._()
    : super(
        retry: null,
        name: r'fetchDashboardAttendedOverviewProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchDashboardAttendedOverviewProvider call({String? date}) =>
      FetchDashboardAttendedOverviewProvider._(argument: date, from: this);

  @override
  String toString() => r'fetchDashboardAttendedOverviewProvider';
}

@ProviderFor(fetchTotalEmployeeData)
final fetchTotalEmployeeDataProvider = FetchTotalEmployeeDataFamily._();

final class FetchTotalEmployeeDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<TotalEmployeeResponse>,
          TotalEmployeeResponse,
          FutureOr<TotalEmployeeResponse>
        >
    with
        $FutureModifier<TotalEmployeeResponse>,
        $FutureProvider<TotalEmployeeResponse> {
  FetchTotalEmployeeDataProvider._({
    required FetchTotalEmployeeDataFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'fetchTotalEmployeeDataProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchTotalEmployeeDataHash();

  @override
  String toString() {
    return r'fetchTotalEmployeeDataProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<TotalEmployeeResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<TotalEmployeeResponse> create(Ref ref) {
    final argument = this.argument as String?;
    return fetchTotalEmployeeData(ref, date: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchTotalEmployeeDataProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchTotalEmployeeDataHash() =>
    r'b099b001816a012555e3b60d32eafd5155635f9c';

final class FetchTotalEmployeeDataFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<TotalEmployeeResponse>, String?> {
  FetchTotalEmployeeDataFamily._()
    : super(
        retry: null,
        name: r'fetchTotalEmployeeDataProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchTotalEmployeeDataProvider call({String? date}) =>
      FetchTotalEmployeeDataProvider._(argument: date, from: this);

  @override
  String toString() => r'fetchTotalEmployeeDataProvider';
}
