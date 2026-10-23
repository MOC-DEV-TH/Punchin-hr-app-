// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yesterday_checkout_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(YesterdayCheckoutController)
final yesterdayCheckoutControllerProvider =
    YesterdayCheckoutControllerProvider._();

final class YesterdayCheckoutControllerProvider
    extends $AsyncNotifierProvider<YesterdayCheckoutController, void> {
  YesterdayCheckoutControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'yesterdayCheckoutControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$yesterdayCheckoutControllerHash();

  @$internal
  @override
  YesterdayCheckoutController create() => YesterdayCheckoutController();
}

String _$yesterdayCheckoutControllerHash() =>
    r'fc0a74f6bdc5035bfacb8ab8214363714bbc4837';

abstract class _$YesterdayCheckoutController extends $AsyncNotifier<void> {
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
