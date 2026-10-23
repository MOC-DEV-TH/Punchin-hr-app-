// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_dashboard_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(adminDashboardRepository)
final adminDashboardRepositoryProvider = AdminDashboardRepositoryProvider._();

final class AdminDashboardRepositoryProvider
    extends
        $FunctionalProvider<
          AdminDashboardRepository,
          AdminDashboardRepository,
          AdminDashboardRepository
        >
    with $Provider<AdminDashboardRepository> {
  AdminDashboardRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'adminDashboardRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$adminDashboardRepositoryHash();

  @$internal
  @override
  $ProviderElement<AdminDashboardRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AdminDashboardRepository create(Ref ref) {
    return adminDashboardRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AdminDashboardRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AdminDashboardRepository>(value),
    );
  }
}

String _$adminDashboardRepositoryHash() =>
    r'b3a2150e8b5eb08217a92c5e13a1581336d2ad39';

@ProviderFor(fetchBusinessUnits)
final fetchBusinessUnitsProvider = FetchBusinessUnitsProvider._();

final class FetchBusinessUnitsProvider
    extends
        $FunctionalProvider<
          AsyncValue<BusinessUnitResponse>,
          BusinessUnitResponse,
          FutureOr<BusinessUnitResponse>
        >
    with
        $FutureModifier<BusinessUnitResponse>,
        $FutureProvider<BusinessUnitResponse> {
  FetchBusinessUnitsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchBusinessUnitsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchBusinessUnitsHash();

  @$internal
  @override
  $FutureProviderElement<BusinessUnitResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<BusinessUnitResponse> create(Ref ref) {
    return fetchBusinessUnits(ref);
  }
}

String _$fetchBusinessUnitsHash() =>
    r'329e0861939607f539552a4351b2444fa405bb1d';

@ProviderFor(fetchAdminDashboardData)
final fetchAdminDashboardDataProvider = FetchAdminDashboardDataFamily._();

final class FetchAdminDashboardDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<AdminDashboardResponse>,
          AdminDashboardResponse,
          FutureOr<AdminDashboardResponse>
        >
    with
        $FutureModifier<AdminDashboardResponse>,
        $FutureProvider<AdminDashboardResponse> {
  FetchAdminDashboardDataProvider._({
    required FetchAdminDashboardDataFamily super.from,
    required ({int businessUnitId, String date}) super.argument,
  }) : super(
         retry: null,
         name: r'fetchAdminDashboardDataProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchAdminDashboardDataHash();

  @override
  String toString() {
    return r'fetchAdminDashboardDataProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<AdminDashboardResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AdminDashboardResponse> create(Ref ref) {
    final argument = this.argument as ({int businessUnitId, String date});
    return fetchAdminDashboardData(
      ref,
      businessUnitId: argument.businessUnitId,
      date: argument.date,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAdminDashboardDataProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchAdminDashboardDataHash() =>
    r'e13832fa9a3fca8154681f7841b7eb10a7600be6';

final class FetchAdminDashboardDataFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<AdminDashboardResponse>,
          ({int businessUnitId, String date})
        > {
  FetchAdminDashboardDataFamily._()
    : super(
        retry: null,
        name: r'fetchAdminDashboardDataProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchAdminDashboardDataProvider call({
    required int businessUnitId,
    required String date,
  }) => FetchAdminDashboardDataProvider._(
    argument: (businessUnitId: businessUnitId, date: date),
    from: this,
  );

  @override
  String toString() => r'fetchAdminDashboardDataProvider';
}
