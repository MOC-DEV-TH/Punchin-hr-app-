// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(homeRepository)
final homeRepositoryProvider = HomeRepositoryProvider._();

final class HomeRepositoryProvider
    extends $FunctionalProvider<HomeRepository, HomeRepository, HomeRepository>
    with $Provider<HomeRepository> {
  HomeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeRepositoryHash();

  @$internal
  @override
  $ProviderElement<HomeRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HomeRepository create(Ref ref) {
    return homeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeRepository>(value),
    );
  }
}

String _$homeRepositoryHash() => r'29e398f1f8843bc28c6e5def3e007fe733f2ba23';

@ProviderFor(fetchAttendanceData)
final fetchAttendanceDataProvider = FetchAttendanceDataProvider._();

final class FetchAttendanceDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<AttendanceResponse>,
          AttendanceResponse,
          FutureOr<AttendanceResponse>
        >
    with
        $FutureModifier<AttendanceResponse>,
        $FutureProvider<AttendanceResponse> {
  FetchAttendanceDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchAttendanceDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchAttendanceDataHash();

  @$internal
  @override
  $FutureProviderElement<AttendanceResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AttendanceResponse> create(Ref ref) {
    return fetchAttendanceData(ref);
  }
}

String _$fetchAttendanceDataHash() =>
    r'aae4fc2b443bc2f3fcaa2768e8ec734c38f7fbfe';

@ProviderFor(fetchConfigData)
final fetchConfigDataProvider = FetchConfigDataProvider._();

final class FetchConfigDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<ConfigResponse>,
          ConfigResponse,
          FutureOr<ConfigResponse>
        >
    with $FutureModifier<ConfigResponse>, $FutureProvider<ConfigResponse> {
  FetchConfigDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchConfigDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchConfigDataHash();

  @$internal
  @override
  $FutureProviderElement<ConfigResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ConfigResponse> create(Ref ref) {
    return fetchConfigData(ref);
  }
}

String _$fetchConfigDataHash() => r'25976a193d86e9d149d20116e900bef54d2f8d8e';

@ProviderFor(fetchEmployeeDashboard)
final fetchEmployeeDashboardProvider = FetchEmployeeDashboardFamily._();

final class FetchEmployeeDashboardProvider
    extends
        $FunctionalProvider<
          AsyncValue<EmployeeDashboardResponse>,
          EmployeeDashboardResponse,
          FutureOr<EmployeeDashboardResponse>
        >
    with
        $FutureModifier<EmployeeDashboardResponse>,
        $FutureProvider<EmployeeDashboardResponse> {
  FetchEmployeeDashboardProvider._({
    required FetchEmployeeDashboardFamily super.from,
    required ({int year, int month}) super.argument,
  }) : super(
         retry: null,
         name: r'fetchEmployeeDashboardProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchEmployeeDashboardHash();

  @override
  String toString() {
    return r'fetchEmployeeDashboardProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<EmployeeDashboardResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<EmployeeDashboardResponse> create(Ref ref) {
    final argument = this.argument as ({int year, int month});
    return fetchEmployeeDashboard(
      ref,
      year: argument.year,
      month: argument.month,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchEmployeeDashboardProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchEmployeeDashboardHash() =>
    r'e6e30b9ed07692cddf64222ab8e10599db3ac49b';

final class FetchEmployeeDashboardFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<EmployeeDashboardResponse>,
          ({int year, int month})
        > {
  FetchEmployeeDashboardFamily._()
    : super(
        retry: null,
        name: r'fetchEmployeeDashboardProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchEmployeeDashboardProvider call({
    required int year,
    required int month,
  }) => FetchEmployeeDashboardProvider._(
    argument: (year: year, month: month),
    from: this,
  );

  @override
  String toString() => r'fetchEmployeeDashboardProvider';
}

@ProviderFor(fetchAttendanceConfigData)
final fetchAttendanceConfigDataProvider = FetchAttendanceConfigDataProvider._();

final class FetchAttendanceConfigDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<AttendanceConfigResponse>,
          AttendanceConfigResponse,
          FutureOr<AttendanceConfigResponse>
        >
    with
        $FutureModifier<AttendanceConfigResponse>,
        $FutureProvider<AttendanceConfigResponse> {
  FetchAttendanceConfigDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchAttendanceConfigDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchAttendanceConfigDataHash();

  @$internal
  @override
  $FutureProviderElement<AttendanceConfigResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AttendanceConfigResponse> create(Ref ref) {
    return fetchAttendanceConfigData(ref);
  }
}

String _$fetchAttendanceConfigDataHash() =>
    r'a3c77048eca8f022ef6503044ffb5e9272741067';
