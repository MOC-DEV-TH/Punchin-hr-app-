// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_out_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CheckOutController)
final checkOutControllerProvider = CheckOutControllerProvider._();

final class CheckOutControllerProvider
    extends $AsyncNotifierProvider<CheckOutController, void> {
  CheckOutControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkOutControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkOutControllerHash();

  @$internal
  @override
  CheckOutController create() => CheckOutController();
}

String _$checkOutControllerHash() =>
    r'366fe0df75d01ea11727d800dbab3fc7123c901f';

abstract class _$CheckOutController extends $AsyncNotifier<void> {
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
