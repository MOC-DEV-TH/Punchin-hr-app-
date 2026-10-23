// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_leaves_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EmployeeLeavesController)
final employeeLeavesControllerProvider = EmployeeLeavesControllerProvider._();

final class EmployeeLeavesControllerProvider
    extends $AsyncNotifierProvider<EmployeeLeavesController, void> {
  EmployeeLeavesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'employeeLeavesControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$employeeLeavesControllerHash();

  @$internal
  @override
  EmployeeLeavesController create() => EmployeeLeavesController();
}

String _$employeeLeavesControllerHash() =>
    r'32a10cff7efb842e4942ec8f7bb8df4cddbeb635';

abstract class _$EmployeeLeavesController extends $AsyncNotifier<void> {
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
