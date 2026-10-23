// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CheckInController)
final checkInControllerProvider = CheckInControllerProvider._();

final class CheckInControllerProvider
    extends $AsyncNotifierProvider<CheckInController, void> {
  CheckInControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkInControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkInControllerHash();

  @$internal
  @override
  CheckInController create() => CheckInController();
}

String _$checkInControllerHash() => r'1e7f97c6cc64b482072bba43c43bb1f341bc5d95';

abstract class _$CheckInController extends $AsyncNotifier<void> {
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
