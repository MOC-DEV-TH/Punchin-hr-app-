// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secure_storage.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(secureStorage)
final secureStorageProvider = SecureStorageProvider._();

final class SecureStorageProvider
    extends $FunctionalProvider<SecureStorage, SecureStorage, SecureStorage>
    with $Provider<SecureStorage> {
  SecureStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'secureStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$secureStorageHash();

  @$internal
  @override
  $ProviderElement<SecureStorage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SecureStorage create(Ref ref) {
    return secureStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SecureStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SecureStorage>(value),
    );
  }
}

String _$secureStorageHash() => r'fdcf97f384e865e3e2cf8e4544c72da0d2bda7df';

@ProviderFor(getAuthStatus)
final getAuthStatusProvider = GetAuthStatusProvider._();

final class GetAuthStatusProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  GetAuthStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAuthStatusProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAuthStatusHash();

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    return getAuthStatus(ref);
  }
}

String _$getAuthStatusHash() => r'001f2ab518999019f3cf8a0b8b072cf32c9134a8';

@ProviderFor(getLoginUserRole)
final getLoginUserRoleProvider = GetLoginUserRoleProvider._();

final class GetLoginUserRoleProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  GetLoginUserRoleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getLoginUserRoleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getLoginUserRoleHash();

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    return getLoginUserRole(ref);
  }
}

String _$getLoginUserRoleHash() => r'a7dfdb34fd35bc9e3e0729d2ab95971348a28368';

@ProviderFor(getRemoteLoginStatus)
final getRemoteLoginStatusProvider = GetRemoteLoginStatusProvider._();

final class GetRemoteLoginStatusProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  GetRemoteLoginStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getRemoteLoginStatusProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getRemoteLoginStatusHash();

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    return getRemoteLoginStatus(ref);
  }
}

String _$getRemoteLoginStatusHash() =>
    r'808a241ed225f95fc816585bac2e314cc13b24b7';

@ProviderFor(getUserData)
final getUserDataProvider = GetUserDataProvider._();

final class GetUserDataProvider
    extends $FunctionalProvider<AsyncValue<UserVO?>, UserVO?, FutureOr<UserVO?>>
    with $FutureModifier<UserVO?>, $FutureProvider<UserVO?> {
  GetUserDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getUserDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getUserDataHash();

  @$internal
  @override
  $FutureProviderElement<UserVO?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<UserVO?> create(Ref ref) {
    return getUserData(ref);
  }
}

String _$getUserDataHash() => r'c2a0ae5b1642bb8865c9f4b3d2c1b1f440d337b3';

@ProviderFor(getLeaveTypes)
final getLeaveTypesProvider = GetLeaveTypesProvider._();

final class GetLeaveTypesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<LeaveTypeVO>?>,
          List<LeaveTypeVO>?,
          FutureOr<List<LeaveTypeVO>?>
        >
    with
        $FutureModifier<List<LeaveTypeVO>?>,
        $FutureProvider<List<LeaveTypeVO>?> {
  GetLeaveTypesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getLeaveTypesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getLeaveTypesHash();

  @$internal
  @override
  $FutureProviderElement<List<LeaveTypeVO>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<LeaveTypeVO>?> create(Ref ref) {
    return getLeaveTypes(ref);
  }
}

String _$getLeaveTypesHash() => r'dd119a384c283177968065a75307172ab027d6d1';

@ProviderFor(employeeDropdownLocal)
final employeeDropdownLocalProvider = EmployeeDropdownLocalProvider._();

final class EmployeeDropdownLocalProvider
    extends
        $FunctionalProvider<
          AsyncValue<EmployeeDropdownVO?>,
          EmployeeDropdownVO?,
          FutureOr<EmployeeDropdownVO?>
        >
    with
        $FutureModifier<EmployeeDropdownVO?>,
        $FutureProvider<EmployeeDropdownVO?> {
  EmployeeDropdownLocalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'employeeDropdownLocalProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$employeeDropdownLocalHash();

  @$internal
  @override
  $FutureProviderElement<EmployeeDropdownVO?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<EmployeeDropdownVO?> create(Ref ref) {
    return employeeDropdownLocal(ref);
  }
}

String _$employeeDropdownLocalHash() =>
    r'2e9f410363a7eb56b779385081e257e602ceb555';

@ProviderFor(countriesLocal)
final countriesLocalProvider = CountriesLocalProvider._();

final class CountriesLocalProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<IDNameVO>>,
          List<IDNameVO>,
          FutureOr<List<IDNameVO>>
        >
    with $FutureModifier<List<IDNameVO>>, $FutureProvider<List<IDNameVO>> {
  CountriesLocalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'countriesLocalProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$countriesLocalHash();

  @$internal
  @override
  $FutureProviderElement<List<IDNameVO>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<IDNameVO>> create(Ref ref) {
    return countriesLocal(ref);
  }
}

String _$countriesLocalHash() => r'9aeaf785e909372be9cefebfe951d233b4d94a51';

@ProviderFor(businessUnitsLocal)
final businessUnitsLocalProvider = BusinessUnitsLocalProvider._();

final class BusinessUnitsLocalProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<IDNameVO>>,
          List<IDNameVO>,
          FutureOr<List<IDNameVO>>
        >
    with $FutureModifier<List<IDNameVO>>, $FutureProvider<List<IDNameVO>> {
  BusinessUnitsLocalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'businessUnitsLocalProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$businessUnitsLocalHash();

  @$internal
  @override
  $FutureProviderElement<List<IDNameVO>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<IDNameVO>> create(Ref ref) {
    return businessUnitsLocal(ref);
  }
}

String _$businessUnitsLocalHash() =>
    r'54d820beec8cc73e49a8665aafef5b285c802bdd';

@ProviderFor(departmentsLocal)
final departmentsLocalProvider = DepartmentsLocalProvider._();

final class DepartmentsLocalProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<IDNameVO>>,
          List<IDNameVO>,
          FutureOr<List<IDNameVO>>
        >
    with $FutureModifier<List<IDNameVO>>, $FutureProvider<List<IDNameVO>> {
  DepartmentsLocalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'departmentsLocalProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$departmentsLocalHash();

  @$internal
  @override
  $FutureProviderElement<List<IDNameVO>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<IDNameVO>> create(Ref ref) {
    return departmentsLocal(ref);
  }
}

String _$departmentsLocalHash() => r'6a9883a8ccebe5d0b7146da1bb73536ff08c4561';

@ProviderFor(positionsLocal)
final positionsLocalProvider = PositionsLocalProvider._();

final class PositionsLocalProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<IDNameVO>>,
          List<IDNameVO>,
          FutureOr<List<IDNameVO>>
        >
    with $FutureModifier<List<IDNameVO>>, $FutureProvider<List<IDNameVO>> {
  PositionsLocalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'positionsLocalProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$positionsLocalHash();

  @$internal
  @override
  $FutureProviderElement<List<IDNameVO>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<IDNameVO>> create(Ref ref) {
    return positionsLocal(ref);
  }
}

String _$positionsLocalHash() => r'96c480acc0811976a8e41f5e01f4935bdb97e5fd';

@ProviderFor(rolesLocal)
final rolesLocalProvider = RolesLocalProvider._();

final class RolesLocalProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<IDNameVO>>,
          List<IDNameVO>,
          FutureOr<List<IDNameVO>>
        >
    with $FutureModifier<List<IDNameVO>>, $FutureProvider<List<IDNameVO>> {
  RolesLocalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rolesLocalProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rolesLocalHash();

  @$internal
  @override
  $FutureProviderElement<List<IDNameVO>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<IDNameVO>> create(Ref ref) {
    return rolesLocal(ref);
  }
}

String _$rolesLocalHash() => r'b96a6b8c1369eb2e6000f4d1e56fe4fb0434f028';

@ProviderFor(employeeTypesLocal)
final employeeTypesLocalProvider = EmployeeTypesLocalProvider._();

final class EmployeeTypesLocalProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<IDNameVO>>,
          List<IDNameVO>,
          FutureOr<List<IDNameVO>>
        >
    with $FutureModifier<List<IDNameVO>>, $FutureProvider<List<IDNameVO>> {
  EmployeeTypesLocalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'employeeTypesLocalProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$employeeTypesLocalHash();

  @$internal
  @override
  $FutureProviderElement<List<IDNameVO>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<IDNameVO>> create(Ref ref) {
    return employeeTypesLocal(ref);
  }
}

String _$employeeTypesLocalHash() =>
    r'c5503cfc248f932822adb0b80a4201d09c5a9e27';

@ProviderFor(businessUnitsAllLocal)
final businessUnitsAllLocalProvider = BusinessUnitsAllLocalProvider._();

final class BusinessUnitsAllLocalProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BusinessUnitVO>>,
          List<BusinessUnitVO>,
          FutureOr<List<BusinessUnitVO>>
        >
    with
        $FutureModifier<List<BusinessUnitVO>>,
        $FutureProvider<List<BusinessUnitVO>> {
  BusinessUnitsAllLocalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'businessUnitsAllLocalProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$businessUnitsAllLocalHash();

  @$internal
  @override
  $FutureProviderElement<List<BusinessUnitVO>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<BusinessUnitVO>> create(Ref ref) {
    return businessUnitsAllLocal(ref);
  }
}

String _$businessUnitsAllLocalHash() =>
    r'3f17a4e98feeebdda9ca0e236653d79fd26705be';

@ProviderFor(employeeAddressesLocal)
final employeeAddressesLocalProvider = EmployeeAddressesLocalProvider._();

final class EmployeeAddressesLocalProvider
    extends
        $FunctionalProvider<List<AddressVO>, List<AddressVO>, List<AddressVO>>
    with $Provider<List<AddressVO>> {
  EmployeeAddressesLocalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'employeeAddressesLocalProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$employeeAddressesLocalHash();

  @$internal
  @override
  $ProviderElement<List<AddressVO>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<AddressVO> create(Ref ref) {
    return employeeAddressesLocal(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<AddressVO> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<AddressVO>>(value),
    );
  }
}

String _$employeeAddressesLocalHash() =>
    r'a2100fde8dea3ea80a54cf6c19f9c1f2c9b5f7ad';

@ProviderFor(getCheckInDate)
final getCheckInDateProvider = GetCheckInDateProvider._();

final class GetCheckInDateProvider
    extends $FunctionalProvider<String?, String?, String?>
    with $Provider<String?> {
  GetCheckInDateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCheckInDateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCheckInDateHash();

  @$internal
  @override
  $ProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String? create(Ref ref) {
    return getCheckInDate(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$getCheckInDateHash() => r'd1830cede94f6a15fefec256a4dbc58220a5e874';

@ProviderFor(getUserId)
final getUserIdProvider = GetUserIdProvider._();

final class GetUserIdProvider extends $FunctionalProvider<int?, int?, int?>
    with $Provider<int?> {
  GetUserIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getUserIdProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getUserIdHash();

  @$internal
  @override
  $ProviderElement<int?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int? create(Ref ref) {
    return getUserId(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$getUserIdHash() => r'1919d4a4a663ec43cf4c1cfb757670d7427cafbc';
