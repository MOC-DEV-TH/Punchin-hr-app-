// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_list_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(employeeListRepository)
final employeeListRepositoryProvider = EmployeeListRepositoryProvider._();

final class EmployeeListRepositoryProvider
    extends
        $FunctionalProvider<
          EmployeeListRepository,
          EmployeeListRepository,
          EmployeeListRepository
        >
    with $Provider<EmployeeListRepository> {
  EmployeeListRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'employeeListRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$employeeListRepositoryHash();

  @$internal
  @override
  $ProviderElement<EmployeeListRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EmployeeListRepository create(Ref ref) {
    return employeeListRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EmployeeListRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EmployeeListRepository>(value),
    );
  }
}

String _$employeeListRepositoryHash() =>
    r'46f4453c07d9b3ffdb85316894e694a7b33e6781';

@ProviderFor(fetchEmployeeListData)
final fetchEmployeeListDataProvider = FetchEmployeeListDataFamily._();

final class FetchEmployeeListDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<EmployeeListResponse>,
          EmployeeListResponse,
          FutureOr<EmployeeListResponse>
        >
    with
        $FutureModifier<EmployeeListResponse>,
        $FutureProvider<EmployeeListResponse> {
  FetchEmployeeListDataProvider._({
    required FetchEmployeeListDataFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'fetchEmployeeListDataProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchEmployeeListDataHash();

  @override
  String toString() {
    return r'fetchEmployeeListDataProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<EmployeeListResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<EmployeeListResponse> create(Ref ref) {
    final argument = this.argument as int;
    return fetchEmployeeListData(ref, pageNo: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchEmployeeListDataProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchEmployeeListDataHash() =>
    r'a35c7953b7e077270eb91cd06fa4c27066155a34';

final class FetchEmployeeListDataFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<EmployeeListResponse>, int> {
  FetchEmployeeListDataFamily._()
    : super(
        retry: null,
        name: r'fetchEmployeeListDataProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchEmployeeListDataProvider call({required int pageNo}) =>
      FetchEmployeeListDataProvider._(argument: pageNo, from: this);

  @override
  String toString() => r'fetchEmployeeListDataProvider';
}

@ProviderFor(searchEmployeeListData)
final searchEmployeeListDataProvider = SearchEmployeeListDataFamily._();

final class SearchEmployeeListDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<EmployeeListResponse>,
          EmployeeListResponse,
          FutureOr<EmployeeListResponse>
        >
    with
        $FutureModifier<EmployeeListResponse>,
        $FutureProvider<EmployeeListResponse> {
  SearchEmployeeListDataProvider._({
    required SearchEmployeeListDataFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'searchEmployeeListDataProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$searchEmployeeListDataHash();

  @override
  String toString() {
    return r'searchEmployeeListDataProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<EmployeeListResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<EmployeeListResponse> create(Ref ref) {
    final argument = this.argument as String;
    return searchEmployeeListData(ref, query: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchEmployeeListDataProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchEmployeeListDataHash() =>
    r'a0f9dfdf27a401f3747cbde14cd7142a8a006e18';

final class SearchEmployeeListDataFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<EmployeeListResponse>, String> {
  SearchEmployeeListDataFamily._()
    : super(
        retry: null,
        name: r'searchEmployeeListDataProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SearchEmployeeListDataProvider call({required String query}) =>
      SearchEmployeeListDataProvider._(argument: query, from: this);

  @override
  String toString() => r'searchEmployeeListDataProvider';
}
