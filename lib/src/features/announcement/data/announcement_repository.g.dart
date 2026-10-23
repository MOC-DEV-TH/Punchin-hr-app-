// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(announcementRepository)
final announcementRepositoryProvider = AnnouncementRepositoryProvider._();

final class AnnouncementRepositoryProvider
    extends
        $FunctionalProvider<
          AnnouncementRepository,
          AnnouncementRepository,
          AnnouncementRepository
        >
    with $Provider<AnnouncementRepository> {
  AnnouncementRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'announcementRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$announcementRepositoryHash();

  @$internal
  @override
  $ProviderElement<AnnouncementRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AnnouncementRepository create(Ref ref) {
    return announcementRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AnnouncementRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AnnouncementRepository>(value),
    );
  }
}

String _$announcementRepositoryHash() =>
    r'e2c9727bf75729ab35c6e9baac1649ff1d129f25';

@ProviderFor(fetchAnnouncements)
final fetchAnnouncementsProvider = FetchAnnouncementsFamily._();

final class FetchAnnouncementsProvider
    extends
        $FunctionalProvider<
          AsyncValue<AnnouncementResponse>,
          AnnouncementResponse,
          FutureOr<AnnouncementResponse>
        >
    with
        $FutureModifier<AnnouncementResponse>,
        $FutureProvider<AnnouncementResponse> {
  FetchAnnouncementsProvider._({
    required FetchAnnouncementsFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'fetchAnnouncementsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchAnnouncementsHash();

  @override
  String toString() {
    return r'fetchAnnouncementsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<AnnouncementResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AnnouncementResponse> create(Ref ref) {
    final argument = this.argument as int?;
    return fetchAnnouncements(ref, businessUnitId: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAnnouncementsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchAnnouncementsHash() =>
    r'761b36f94c1f923ff6b8860c3a790e4c995c576a';

final class FetchAnnouncementsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<AnnouncementResponse>, int?> {
  FetchAnnouncementsFamily._()
    : super(
        retry: null,
        name: r'fetchAnnouncementsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchAnnouncementsProvider call({int? businessUnitId}) =>
      FetchAnnouncementsProvider._(argument: businessUnitId, from: this);

  @override
  String toString() => r'fetchAnnouncementsProvider';
}

@ProviderFor(fetchAnnouncementDetailByID)
final fetchAnnouncementDetailByIDProvider =
    FetchAnnouncementDetailByIDFamily._();

final class FetchAnnouncementDetailByIDProvider
    extends
        $FunctionalProvider<
          AsyncValue<AnnouncementDetailResponse>,
          AnnouncementDetailResponse,
          FutureOr<AnnouncementDetailResponse>
        >
    with
        $FutureModifier<AnnouncementDetailResponse>,
        $FutureProvider<AnnouncementDetailResponse> {
  FetchAnnouncementDetailByIDProvider._({
    required FetchAnnouncementDetailByIDFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'fetchAnnouncementDetailByIDProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchAnnouncementDetailByIDHash();

  @override
  String toString() {
    return r'fetchAnnouncementDetailByIDProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<AnnouncementDetailResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AnnouncementDetailResponse> create(Ref ref) {
    final argument = this.argument as int;
    return fetchAnnouncementDetailByID(ref, announcementID: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchAnnouncementDetailByIDProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchAnnouncementDetailByIDHash() =>
    r'282d2e79cba90bdfa9cedbd72598a6657ef608d9';

final class FetchAnnouncementDetailByIDFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<AnnouncementDetailResponse>, int> {
  FetchAnnouncementDetailByIDFamily._()
    : super(
        retry: null,
        name: r'fetchAnnouncementDetailByIDProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchAnnouncementDetailByIDProvider call({required int announcementID}) =>
      FetchAnnouncementDetailByIDProvider._(
        argument: announcementID,
        from: this,
      );

  @override
  String toString() => r'fetchAnnouncementDetailByIDProvider';
}
