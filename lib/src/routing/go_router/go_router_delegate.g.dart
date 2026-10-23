// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'go_router_delegate.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(goRouterDelegate)
final goRouterDelegateProvider = GoRouterDelegateProvider._();

final class GoRouterDelegateProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  GoRouterDelegateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'goRouterDelegateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$goRouterDelegateHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return goRouterDelegate(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$goRouterDelegateHash() => r'25a1ceddb04d9d98ae3a2cc8596adf779b3d8d27';
