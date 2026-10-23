// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_no_token.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dioNoToken)
final dioNoTokenProvider = DioNoTokenProvider._();

final class DioNoTokenProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  DioNoTokenProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioNoTokenProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioNoTokenHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dioNoToken(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioNoTokenHash() => r'c0b865b6815fe907ee70883233bd4c05a1b9eb64';
