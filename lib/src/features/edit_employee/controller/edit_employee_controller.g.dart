// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_employee_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EditEmployeeController)
final editEmployeeControllerProvider = EditEmployeeControllerProvider._();

final class EditEmployeeControllerProvider
    extends $AsyncNotifierProvider<EditEmployeeController, void> {
  EditEmployeeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'editEmployeeControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$editEmployeeControllerHash();

  @$internal
  @override
  EditEmployeeController create() => EditEmployeeController();
}

String _$editEmployeeControllerHash() =>
    r'9723a33fa0abe4300dd11a1341bbcdd900790268';

abstract class _$EditEmployeeController extends $AsyncNotifier<void> {
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
