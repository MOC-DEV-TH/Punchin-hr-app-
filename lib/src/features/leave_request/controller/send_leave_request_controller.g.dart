// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_leave_request_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SendLeaveRequestController)
final sendLeaveRequestControllerProvider =
    SendLeaveRequestControllerProvider._();

final class SendLeaveRequestControllerProvider
    extends $AsyncNotifierProvider<SendLeaveRequestController, void> {
  SendLeaveRequestControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sendLeaveRequestControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sendLeaveRequestControllerHash();

  @$internal
  @override
  SendLeaveRequestController create() => SendLeaveRequestController();
}

String _$sendLeaveRequestControllerHash() =>
    r'6e36f7c0bfda67b82252c07f91047419e70301ff';

abstract class _$SendLeaveRequestController extends $AsyncNotifier<void> {
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
