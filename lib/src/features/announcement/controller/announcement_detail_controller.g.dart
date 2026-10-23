// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AnnouncementDetailController)
final announcementDetailControllerProvider =
    AnnouncementDetailControllerProvider._();

final class AnnouncementDetailControllerProvider
    extends $AsyncNotifierProvider<AnnouncementDetailController, void> {
  AnnouncementDetailControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'announcementDetailControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$announcementDetailControllerHash();

  @$internal
  @override
  AnnouncementDetailController create() => AnnouncementDetailController();
}

String _$announcementDetailControllerHash() =>
    r'ffc603f0eaf85b22462864e4dab0901c37a47e87';

abstract class _$AnnouncementDetailController extends $AsyncNotifier<void> {
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
