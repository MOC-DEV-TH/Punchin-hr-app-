// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkInCheckOut_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(checkInCheckOutRepository)
final checkInCheckOutRepositoryProvider = CheckInCheckOutRepositoryProvider._();

final class CheckInCheckOutRepositoryProvider
    extends
        $FunctionalProvider<
          CheckInCheckOutRepository,
          CheckInCheckOutRepository,
          CheckInCheckOutRepository
        >
    with $Provider<CheckInCheckOutRepository> {
  CheckInCheckOutRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkInCheckOutRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkInCheckOutRepositoryHash();

  @$internal
  @override
  $ProviderElement<CheckInCheckOutRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CheckInCheckOutRepository create(Ref ref) {
    return checkInCheckOutRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CheckInCheckOutRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CheckInCheckOutRepository>(value),
    );
  }
}

String _$checkInCheckOutRepositoryHash() =>
    r'e8d3810948e45b4cdf820cae4f0cfd197e97b6d5';
