// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_employee_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddNewEmployeeController)
final addNewEmployeeControllerProvider = AddNewEmployeeControllerProvider._();

final class AddNewEmployeeControllerProvider
    extends $AsyncNotifierProvider<AddNewEmployeeController, void> {
  AddNewEmployeeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addNewEmployeeControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addNewEmployeeControllerHash();

  @$internal
  @override
  AddNewEmployeeController create() => AddNewEmployeeController();
}

String _$addNewEmployeeControllerHash() =>
    r'8e76bc26a53b68886936e9f175c7146d7db27686';

abstract class _$AddNewEmployeeController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
