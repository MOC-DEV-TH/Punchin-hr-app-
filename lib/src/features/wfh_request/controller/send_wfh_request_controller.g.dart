// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_wfh_request_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SendWfhRequestController)
final sendWfhRequestControllerProvider = SendWfhRequestControllerProvider._();

final class SendWfhRequestControllerProvider
    extends $AsyncNotifierProvider<SendWfhRequestController, void> {
  SendWfhRequestControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sendWfhRequestControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sendWfhRequestControllerHash();

  @$internal
  @override
  SendWfhRequestController create() => SendWfhRequestController();
}

String _$sendWfhRequestControllerHash() =>
    r'808fd04d811a700c9342ec263a3e96753d7648e1';

abstract class _$SendWfhRequestController extends $AsyncNotifier<void> {
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
