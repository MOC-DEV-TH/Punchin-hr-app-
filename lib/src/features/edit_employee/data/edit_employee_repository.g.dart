// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_employee_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(editEmployeeRepository)
final editEmployeeRepositoryProvider = EditEmployeeRepositoryProvider._();

final class EditEmployeeRepositoryProvider
    extends
        $FunctionalProvider<
          EditEmployeeRepository,
          EditEmployeeRepository,
          EditEmployeeRepository
        >
    with $Provider<EditEmployeeRepository> {
  EditEmployeeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'editEmployeeRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$editEmployeeRepositoryHash();

  @$internal
  @override
  $ProviderElement<EditEmployeeRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EditEmployeeRepository create(Ref ref) {
    return editEmployeeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EditEmployeeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EditEmployeeRepository>(value),
    );
  }
}

String _$editEmployeeRepositoryHash() =>
    r'163e94d7155dda8cd502ab44bdc868c35fb381f4';
