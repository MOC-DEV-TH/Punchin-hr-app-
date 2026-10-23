// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_wfh_request_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EmployeeWfhRequestController)
final employeeWfhRequestControllerProvider =
    EmployeeWfhRequestControllerProvider._();

final class EmployeeWfhRequestControllerProvider
    extends $AsyncNotifierProvider<EmployeeWfhRequestController, void> {
  EmployeeWfhRequestControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'employeeWfhRequestControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$employeeWfhRequestControllerHash();

  @$internal
  @override
  EmployeeWfhRequestController create() => EmployeeWfhRequestController();
}

String _$employeeWfhRequestControllerHash() =>
    r'312976f5d10cceea4b91afc03ee9c4e372fc7f33';

abstract class _$EmployeeWfhRequestController extends $AsyncNotifier<void> {
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
