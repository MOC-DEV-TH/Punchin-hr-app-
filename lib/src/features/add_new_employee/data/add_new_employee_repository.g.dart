// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_employee_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(addNewEmployeeRepository)
final addNewEmployeeRepositoryProvider = AddNewEmployeeRepositoryProvider._();

final class AddNewEmployeeRepositoryProvider
    extends
        $FunctionalProvider<
          AddNewEmployeeRepository,
          AddNewEmployeeRepository,
          AddNewEmployeeRepository
        >
    with $Provider<AddNewEmployeeRepository> {
  AddNewEmployeeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addNewEmployeeRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addNewEmployeeRepositoryHash();

  @$internal
  @override
  $ProviderElement<AddNewEmployeeRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AddNewEmployeeRepository create(Ref ref) {
    return addNewEmployeeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddNewEmployeeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddNewEmployeeRepository>(value),
    );
  }
}

String _$addNewEmployeeRepositoryHash() =>
    r'41edd785e1f7150fc4704a24ff2c56d5f75c655d';
