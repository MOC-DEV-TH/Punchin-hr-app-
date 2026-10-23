// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holiday_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(holidayRepository)
final holidayRepositoryProvider = HolidayRepositoryProvider._();

final class HolidayRepositoryProvider
    extends
        $FunctionalProvider<
          HolidayRepository,
          HolidayRepository,
          HolidayRepository
        >
    with $Provider<HolidayRepository> {
  HolidayRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'holidayRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$holidayRepositoryHash();

  @$internal
  @override
  $ProviderElement<HolidayRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  HolidayRepository create(Ref ref) {
    return holidayRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HolidayRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HolidayRepository>(value),
    );
  }
}

String _$holidayRepositoryHash() => r'8f76ea9f1e22b89cfd614af385dd00a65fddec7b';

@ProviderFor(fetchHolidays)
final fetchHolidaysProvider = FetchHolidaysFamily._();

final class FetchHolidaysProvider
    extends
        $FunctionalProvider<
          AsyncValue<HolidayResponse>,
          HolidayResponse,
          FutureOr<HolidayResponse>
        >
    with $FutureModifier<HolidayResponse>, $FutureProvider<HolidayResponse> {
  FetchHolidaysProvider._({
    required FetchHolidaysFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'fetchHolidaysProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchHolidaysHash();

  @override
  String toString() {
    return r'fetchHolidaysProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<HolidayResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<HolidayResponse> create(Ref ref) {
    final argument = this.argument as int?;
    return fetchHolidays(ref, businessUnitId: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchHolidaysProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchHolidaysHash() => r'9a8626d9dbf7fda0bf1473a655642e3d4e1a1a89';

final class FetchHolidaysFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<HolidayResponse>, int?> {
  FetchHolidaysFamily._()
    : super(
        retry: null,
        name: r'fetchHolidaysProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchHolidaysProvider call({int? businessUnitId}) =>
      FetchHolidaysProvider._(argument: businessUnitId, from: this);

  @override
  String toString() => r'fetchHolidaysProvider';
}
