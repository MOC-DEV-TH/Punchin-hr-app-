import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import 'package:hr_app/src/common_widgets/admin_custom_app_bar_view.dart';
import 'package:hr_app/src/common_widgets/clock_out_restricte_bottom_sheet.dart';
import 'package:hr_app/src/common_widgets/clock_out_successful_dialog.dart';
import 'package:hr_app/src/common_widgets/custom_drawer.dart';

import 'package:hr_app/src/features/home/controller/check_in_controller.dart';
import 'package:hr_app/src/features/home/controller/check_out_controller.dart';
import 'package:hr_app/src/features/home/data/home_repository.dart';

import 'package:hr_app/src/network/api_constants.dart';

import 'package:hr_app/src/utils/async_value_ui.dart';
import 'package:hr_app/src/utils/colors.dart';
import 'package:hr_app/src/utils/dimens.dart';
import 'package:hr_app/src/utils/extensions.dart';
import 'package:hr_app/src/utils/gap.dart';
import 'package:hr_app/src/utils/strings.dart';

import '../../../common_widgets/choose_wfh_location_dialog.dart';
import '../../../common_widgets/clock_out_confirm_bottom_sheet.dart';
import '../../../common_widgets/clock_out_not_allow_dialog.dart';
import '../../../common_widgets/custom_toolbar_with_logo.dart';
import '../../../common_widgets/error_retry_view.dart';

import '../../../services/location_service.dart';
import '../../../utils/secure_storage.dart';

import '../controller/yesterday_checkout_controller.dart';

import '../model/attendance_status_response.dart';
import '../model/user_address_response.dart';
import '../model/work_location.dart';

import '../service/attendance_helper.dart';

import 'add_yesterday_checkout_page.dart';

import 'widgets/attendance_action_buttons.dart';
import 'widgets/attendance_header.dart';
import 'widgets/attendance_loading_overlay.dart';
import 'widgets/previous_checkout_card.dart';
import 'widgets/today_attendance_section.dart';
import 'widgets/work_location_selector.dart';

class EmployeeHomePage extends ConsumerStatefulWidget {
  const EmployeeHomePage({super.key});

  @override
  ConsumerState<EmployeeHomePage> createState() {
    return _EmployeeHomePageState();
  }
}

class _EmployeeHomePageState extends ConsumerState<EmployeeHomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  WorkLocation? _selectedLocation;

  bool _isShowLoadingView = false;

  bool _isSubmittingCheckOut = false;

  bool _isAttendanceStatusLoading = false;

  String currentTimezone = 'UTC';

  AttendanceStatusResponse? _attendanceStatus;

  int? _currentUserId;

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: kSecondaryColor),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadInitialData();
    });
  }

  /// ===========================================================
  /// INITIAL DATA
  /// ===========================================================

  Future<void> _loadInitialData() async {
    try {
      await ref.read(homeRepositoryProvider).fetchEmployeeAddresses();

      currentTimezone = await FlutterTimezoneExtension.getCurrentTimezone();

      final user = await ref.read(secureStorageProvider).getUser();

      _currentUserId = user?.id;

      await _loadLatestAttendanceStatus();

      debugPrint('TimeZone >>> $currentTimezone');

      debugPrint('Current user ID >>> $_currentUserId');

      if (!mounted) {
        return;
      }

      setState(() {});
    } catch (error, stackTrace) {
      debugPrint('Initial data error: $error');

      debugPrintStack(stackTrace: stackTrace);
    }
  }

  /// ===========================================================
  /// ATTENDANCE STATUS
  /// ===========================================================

  Future<void> _loadLatestAttendanceStatus() async {
    if (!mounted) {
      return;
    }

    setState(() {
      _isAttendanceStatusLoading = true;
    });

    try {
      final result =
          await ref.read(homeRepositoryProvider).fetchLatestAttendanceStatus();

      final statusData = result.data;

      final statusDate = statusData?.date;

      final isIncompletePreviousAttendance =
          statusData != null &&
          AttendanceHelper.isPreviousDate(statusDate) &&
          statusData.isCheckedOut == false;

      if (!mounted) {
        return;
      }

      setState(() {
        _attendanceStatus = isIncompletePreviousAttendance ? result : null;
      });

      if (statusDate != null) {
        debugPrint(
          'Latest attendance date >>> '
          '${AttendanceHelper.formatDate(statusDate)}',
        );

        debugPrint(
          'Is incomplete previous attendance >>> '
          '$isIncompletePreviousAttendance',
        );
      }
    } catch (error, stackTrace) {
      debugPrint('Attendance status error: $error');

      debugPrintStack(stackTrace: stackTrace);

      if (!mounted) {
        return;
      }

      setState(() {
        _attendanceStatus = null;
      });
    } finally {
      if (mounted) {
        setState(() {
          _isAttendanceStatusLoading = false;
        });
      }
    }
  }

  void _clearPreviousAttendanceStatus() {
    if (!mounted) {
      return;
    }

    setState(() {
      _attendanceStatus = null;

      _isAttendanceStatusLoading = false;
    });
  }

  /// ===========================================================
  /// AFTER CHECK-IN
  /// ===========================================================

  Future<void> _afterSuccessfulCheckIn() async {
    _clearPreviousAttendanceStatus();

    await _refreshAttendance();

    if (!mounted) {
      return;
    }

    await _loadLatestAttendanceStatus();
  }

  /// ===========================================================
  /// WORK LOCATION
  /// ===========================================================

  void _changeWorkLocation(WorkLocation location) {
    if (!mounted) {
      return;
    }

    setState(() {
      _selectedLocation = location;
    });
  }

  /// ===========================================================
  /// REFRESH ATTENDANCE
  /// ===========================================================

  Future<void> _refreshAttendance() async {
    ref.invalidate(fetchAttendanceDataProvider);

    try {
      await ref.read(fetchAttendanceDataProvider.future);

      debugPrint('Attendance refreshed successfully');
    } catch (error, stackTrace) {
      debugPrint('Attendance refresh error: $error');

      debugPrintStack(stackTrace: stackTrace);
    }
  }

  /// ===========================================================
  /// LOADING
  /// ===========================================================

  void _setLoading(bool value) {
    if (!mounted) {
      return;
    }

    setState(() {
      _isShowLoadingView = value;
    });
  }

  /// ===========================================================
  /// REMOTE LOGIN
  /// ===========================================================

  bool _isRemoteLoginAllowed() {
    final value = GetStorage().read(SecureDataList.isRemoteLogin.name);

    return value?.toString() == '1';
  }

  /// ===========================================================
  /// LOCATION PERMISSION
  /// ===========================================================

  Future<bool> _ensureLocationReady({
    required String errorTitle,
    required String permissionMessage,
  }) async {
    final serviceEnabled = await LocationService.isLocationServiceEnabled();

    if (!serviceEnabled) {
      if (mounted) {
        context.showErrorDialog('Please enable location services.', errorTitle);
      }

      return false;
    }

    var permission = await LocationService.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await LocationService.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      if (mounted) {
        context.showErrorDialog(
          'Location permission is permanently denied. '
          'Please enable it from your phone settings.',
          errorTitle,
        );
      }

      return false;
    }

    if (permission == LocationPermission.denied) {
      if (mounted) {
        context.showErrorDialog(permissionMessage, errorTitle);
      }

      return false;
    }

    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  /// ===========================================================
  /// CHECK-IN TAP
  /// ===========================================================

  Future<void> _handleCheckInTap({
    required WorkLocation? selectedLocation,
    required List<AddressVO> addresses,
    required double? officeLatitude,
    required double? officeLongitude,
    required int? allowedDistance,
  }) async {
    if (selectedLocation == null) {
      if (!mounted) {
        return;
      }

      context.showErrorSnackBar(
        'Please select a check-in type: '
        'Office or Work From Home.',
      );

      return;
    }

    if (selectedLocation == WorkLocation.workFromHome) {
      await _handleWorkFromHomeCheckIn(
        addresses: addresses,
        allowDistanceRadius: allowedDistance,
      );

      return;
    }

    await _handleOfficeCheckIn(
      lat: officeLatitude,
      long: officeLongitude,
      allowDistanceRadius: allowedDistance,
    );
  }

  /// ===========================================================
  /// OFFICE CHECK-IN
  /// ===========================================================

  Future<void> _handleOfficeCheckIn({
    required double? lat,
    required double? long,
    required int? allowDistanceRadius,
  }) async {
    if (_isShowLoadingView) {
      return;
    }

    _setLoading(true);

    try {
      final isRemoteAllowed = _isRemoteLoginAllowed();

      debugPrint(
        'RemoteLoginStatus >>> '
        '$isRemoteAllowed',
      );

      // Remote login does not require
      // GPS/radius validation.
      if (isRemoteAllowed) {
        await _submitOfficeCheckIn();

        return;
      }

      if (lat == null || long == null) {
        if (mounted) {
          context.showErrorDialog(
            'Office location is not configured correctly.',
            'Check-In Failed',
          );
        }

        return;
      }

      if (allowDistanceRadius == null || allowDistanceRadius <= 0) {
        if (mounted) {
          context.showErrorDialog(
            'The allowed office check-in distance '
                'is not configured.',
            'Check-In Failed',
          );
        }

        return;
      }

      final locationReady = await _ensureLocationReady(
        errorTitle: 'Check-In Failed',
        permissionMessage:
            'Location permission is required '
            'to check in from the office.',
      );

      if (!locationReady || !mounted) {
        return;
      }

      final isWithinRadius = await LocationService.isWithinOfficeRadius(
        lat,
        long,
        allowDistanceRadius.toDouble(),
      );

      debugPrint(
        'Office Check-In '
        'IsWithinRadius >>> '
        '$isWithinRadius',
      );

      if (!isWithinRadius) {
        if (!mounted) {
          return;
        }

        context.showErrorDialog(
          'You must be within the allowed '
              'office distance to check in.',
          'Check-In Failed',
        );

        return;
      }

      await _submitOfficeCheckIn();
    } catch (error, stackTrace) {
      debugPrint('Office check-in error: $error');

      debugPrintStack(stackTrace: stackTrace);

      if (!mounted) {
        return;
      }

      context.showErrorDialog(
        'Something went wrong while checking in.',
        'Check-In Failed',
      );
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _submitOfficeCheckIn() async {
    final success = await ref
        .read(checkInControllerProvider.notifier)
        .checkIn(type: kTypeOffice, currentTimezone: currentTimezone);

    if (!mounted) {
      return;
    }

    if (success) {
      await _afterSuccessfulCheckIn();
    }
  }

  /// ===========================================================
  /// WFH CHECK-IN
  /// ===========================================================

  Future<void> _handleWorkFromHomeCheckIn({
    required List<AddressVO> addresses,
    required int? allowDistanceRadius,
  }) async {
    if (_isShowLoadingView || ref.read(checkInControllerProvider).isLoading) {
      return;
    }

    // Show location chooser first.
    // GPS permission is requested only when necessary.
    final selectedAddressId = await showWfhLocationDialog(
      context,
      addresses: addresses,
    );

    if (selectedAddressId == null || !mounted) {
      return;
    }

    _setLoading(true);

    try {
      // =========================================
      // WORK FROM SOMEWHERE
      // =========================================
      //
      // -1 means Work From Somewhere.
      // No GPS validation is required.
      if (selectedAddressId == -1) {
        final success = await ref
            .read(checkInControllerProvider.notifier)
            .checkIn(
              type: kTypeWorkFromSomewhere,
              addressId: null,
              currentTimezone: currentTimezone,
            );

        if (!mounted) {
          return;
        }

        if (success) {
          await _afterSuccessfulCheckIn();
        }

        return;
      }

      // =========================================
      // SAVED WFH ADDRESS
      // =========================================

      final selectedAddress = _findAddressById(addresses, selectedAddressId);

      if (selectedAddress == null) {
        if (mounted) {
          context.showErrorDialog(
            'The selected address was not found.',
            'Check-In Failed',
          );
        }

        return;
      }

      final selectedLatitude = double.tryParse(
        selectedAddress.lat?.trim() ?? '',
      );

      final selectedLongitude = double.tryParse(
        selectedAddress.long?.trim() ?? '',
      );

      if (selectedLatitude == null || selectedLongitude == null) {
        if (mounted) {
          context.showErrorDialog(
            'The selected address does not have '
                'a valid location.',
            'Check-In Failed',
          );
        }

        return;
      }

      if (allowDistanceRadius == null || allowDistanceRadius <= 0) {
        if (mounted) {
          context.showErrorDialog(
            'The allowed WFH check-in distance '
                'is not configured.',
            'Check-In Failed',
          );
        }

        return;
      }

      final locationReady = await _ensureLocationReady(
        errorTitle: 'Check-In Failed',
        permissionMessage:
            'Location permission is required '
            'to verify your WFH address.',
      );

      if (!locationReady || !mounted) {
        return;
      }

      final isWithinSelectedAddress =
          await LocationService.isWithinOfficeRadius(
            selectedLatitude,
            selectedLongitude,
            allowDistanceRadius.toDouble(),
          );

      if (!isWithinSelectedAddress) {
        if (!mounted) {
          return;
        }

        context.showErrorDialog(
          'You must be within '
              '$allowDistanceRadius km of '
              '${selectedAddress.addressName ?? 'the selected address'} '
              'to check in.',
          'Outside WFH Location',
        );

        return;
      }

      final success = await ref
          .read(checkInControllerProvider.notifier)
          .checkIn(
            type: kTypeWfh,
            addressId: selectedAddress.id,
            currentTimezone: currentTimezone,
          );

      if (!mounted) {
        return;
      }

      if (success) {
        await _afterSuccessfulCheckIn();
      }
    } catch (error, stackTrace) {
      debugPrint('WFH check-in error: $error');

      debugPrintStack(stackTrace: stackTrace);

      if (!mounted) {
        return;
      }

      context.showErrorDialog(
        'Something went wrong while '
            'checking your location.',
        'Check-In Failed',
      );
    } finally {
      _setLoading(false);
    }
  }

  AddressVO? _findAddressById(
    List<AddressVO> addresses,
    int selectedAddressId,
  ) {
    for (final address in addresses) {
      if (address.id == selectedAddressId) {
        return address;
      }
    }

    return null;
  }

  /// ===========================================================
  /// CHECK-OUT TAP
  /// ===========================================================

  Future<void> _handleCheckOutTap({
    required WorkLocation? workLocation,
    required String clockInText,
    required String clockOutText,
    required String periodText,
    required double? officeLatitude,
    required double? officeLongitude,
    required int? allowedLogoutDistance,
  }) async {
    if (workLocation == null) {
      if (!mounted) {
        return;
      }

      context.showErrorSnackBar('Unable to identify today\'s work location.');

      return;
    }

    await showClockOutConfirmBottomSheet(
      context,
      clockInText: clockInText,
      clockOutText: clockOutText,
      periodText: periodText,
      onConfirm: () async {
        // WFH checkout currently
        // does not require GPS validation.
        if (workLocation == WorkLocation.workFromHome) {
          await _performCheckOut();

          return;
        }

        await _handleOfficeCheckOut(
          lat: officeLatitude,
          long: officeLongitude,
          allowDistanceRadius: allowedLogoutDistance,
        );
      },
    );
  }

  /// ===========================================================
  /// OFFICE CHECK-OUT
  /// ===========================================================

  Future<void> _handleOfficeCheckOut({
    required double? lat,
    required double? long,
    required int? allowDistanceRadius,
  }) async {
    if (_isShowLoadingView || _isSubmittingCheckOut) {
      return;
    }

    _setLoading(true);

    try {
      final isRemoteAllowed = _isRemoteLoginAllowed();

      if (isRemoteAllowed) {
        await _performCheckOut();

        return;
      }

      if (lat == null || long == null) {
        if (mounted) {
          context.showErrorDialog(
            'Office location is not configured correctly.',
            'Check-Out Failed',
          );
        }

        return;
      }

      if (allowDistanceRadius == null || allowDistanceRadius <= 0) {
        if (mounted) {
          context.showErrorDialog(
            'The allowed office check-out distance '
                'is not configured.',
            'Check-Out Failed',
          );
        }

        return;
      }

      final locationReady = await _ensureLocationReady(
        errorTitle: 'Check-Out Failed',
        permissionMessage:
            'Location permission is required '
            'to check out from the office.',
      );

      if (!locationReady || !mounted) {
        return;
      }

      final isWithinRadius = await LocationService.isWithinOfficeRadius(
        lat,
        long,
        allowDistanceRadius.toDouble(),
      );

      debugPrint(
        'Office Check-Out '
        'IsWithinRadius >>> '
        '$isWithinRadius',
      );

      // User is outside office radius.
      // Allow checkout with a reason.
      if (!isWithinRadius) {
        if (!mounted) {
          return;
        }

        await showClockOutNotAllowedDialog(
          context,
          onUnderstand: () {
            showClockOutRestrictedBottomSheet(
              context,
              onSubmit: (clockOutReason) async {
                await _performCheckOut(reason: clockOutReason);
              },
            );
          },
        );

        return;
      }

      await _performCheckOut();
    } catch (error, stackTrace) {
      debugPrint('Office check-out error: $error');

      debugPrintStack(stackTrace: stackTrace);

      if (!mounted) {
        return;
      }

      context.showErrorDialog(
        'Something went wrong while checking out.',
        'Check-Out Failed',
      );
    } finally {
      _setLoading(false);
    }
  }

  /// ===========================================================
  /// CHECK-OUT API
  /// ===========================================================

  Future<bool> _submitCheckOut({String? reason}) async {
    if (_isSubmittingCheckOut) {
      return false;
    }

    if (mounted) {
      setState(() {
        _isSubmittingCheckOut = true;
      });
    } else {
      _isSubmittingCheckOut = true;
    }

    try {
      final success = await ref
          .read(checkOutControllerProvider.notifier)
          .checkOut(reason: reason);

      debugPrint(
        'Check-out controller result >>> '
        '$success',
      );

      if (!success) {
        return false;
      }

      await _refreshAttendance();

      return true;
    } catch (error, stackTrace) {
      debugPrint('Check-out submit error: $error');

      debugPrintStack(stackTrace: stackTrace);

      return false;
    } finally {
      if (mounted) {
        setState(() {
          _isSubmittingCheckOut = false;
        });
      } else {
        _isSubmittingCheckOut = false;
      }
    }
  }

  Future<void> _performCheckOut({String? reason}) async {
    if (_isSubmittingCheckOut) {
      return;
    }

    final success = await _submitCheckOut(reason: reason);

    if (!mounted) {
      return;
    }

    await _showCheckOutResult(success: success);
  }

  Future<void> _showCheckOutResult({required bool success}) async {
    if (!mounted) {
      return;
    }

    if (success) {
      await showClockOutSuccessDialog(context);

      return;
    }

    context.showErrorDialog(
      'The check-out was not completed. '
          'Please try again.',
      'Check-Out Failed',
    );
  }

  /// ===========================================================
  /// PREVIOUS CHECKOUT
  /// ===========================================================

  Future<void> _openPreviousCheckout({
    required DateTime attendanceDate,
    required int userId,
  }) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (_) => AddYesterdayCheckoutPage(
              date: attendanceDate,
              onSave: ({required date, required checkoutTime}) async {
                return _saveYesterdayCheckout(
                  userId: userId,
                  checkoutTime: checkoutTime,
                  date: DateFormat('yyyy-MM-dd').format(date),
                );
              },
            ),
      ),
    );
  }

  Future<bool> _saveYesterdayCheckout({
    required int userId,
    required String checkoutTime,
    required String date,
  }) async {
    try {
      final success = await ref
          .read(yesterdayCheckoutControllerProvider.notifier)
          .updateYesterdayCheckout(
            userId: userId,
            time: checkoutTime,
            date: date,
          );

      if (!success) {
        return false;
      }

      await _refreshAttendance();

      if (!mounted) {
        return false;
      }

      await _loadLatestAttendanceStatus();

      return true;
    } catch (error, stackTrace) {
      debugPrint(
        'Save yesterday checkout error: '
        '$error',
      );

      debugPrintStack(stackTrace: stackTrace);

      return false;
    }
  }

  /// ===========================================================
  /// BUILD
  /// ===========================================================

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(yesterdayCheckoutControllerProvider, (
      _,
      state,
    ) {
      state.showAlertDialogOnError(context);
    });

    ref.listen<AsyncValue>(checkInControllerProvider, (_, state) {
      state.showAlertDialogOnError(context);
    });

    final addresses = ref.watch(employeeAddressesLocalProvider);

    final configState = ref.watch(fetchConfigDataProvider);

    final checkInState = ref.watch(checkInControllerProvider);

    final checkOutState = ref.watch(checkOutControllerProvider);

    final attendanceState = ref.watch(fetchAttendanceDataProvider);

    final yesterdayCheckoutState = ref.watch(
      yesterdayCheckoutControllerProvider,
    );

    final loginUserRole = ref.watch(getLoginUserRoleProvider).value;

    final isManagementUser =
        loginUserRole == kLoginUserRoleCeo ||
        loginUserRole == kLoginUserRoleDirector ||
        loginUserRole == kLoginUserRoleManager;

    final isLoading =
        _isShowLoadingView ||
        checkInState.isLoading ||
        checkOutState.isLoading ||
        yesterdayCheckoutState.isLoading ||
        _isSubmittingCheckOut;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kWhiteColor,

      appBar:
          isManagementUser
              ? const AdminCustomAppBarView(
                title: 'Check-in/out',
                isShowRightIcon: false,
              )
              : CustomToolbarWithLogo(
                onMenuTap: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                onSearchTap: () {},
                onNotificationTap: () {},
                showBadge: true,
              ),

      drawer: isManagementUser ? const SizedBox.shrink() : const CustomDrawer(),

      body: Stack(
        children: [
          configState.when(
            data: (configData) {
              return attendanceState.when(
                data: (attendanceData) {
                  final viewData = AttendanceHelper.buildHomeViewData(
                    attendanceData.data,
                  );

                  final todayDatum = viewData.todayAttendance;

                  final hasCheckedIn = viewData.hasCheckedIn;

                  final hasCheckedOut = viewData.hasCheckedOut;

                  final savedWorkLocation = viewData.savedWorkLocation;

                  final effectiveLocation =
                      savedWorkLocation ?? _selectedLocation;

                  /// ===============================
                  /// PREVIOUS ATTENDANCE
                  /// ===============================

                  final statusData = _attendanceStatus?.data;

                  final statusDate = statusData?.date;

                  final hasIncompletePreviousCheckout =
                      statusData != null &&
                      AttendanceHelper.isPreviousDate(statusDate) &&
                      statusData.isCheckedOut == false;

                  /// ===============================
                  /// OFFICE CONFIG
                  /// ===============================

                  final officeLatitude = double.tryParse(
                    configData.data?.businessUnit?.lat ?? '',
                  );

                  final officeLongitude = double.tryParse(
                    configData.data?.businessUnit?.long ?? '',
                  );

                  final allowedCheckInDistance = configData.data?.allowDistance;

                  final allowedCheckOutDistance =
                      configData.data?.allowLogoutDistance;

                  /// ===============================
                  /// LIVE CLOCK
                  /// ===============================

                  return StreamBuilder<DateTime>(
                    stream: Stream.periodic(
                      const Duration(seconds: 1),
                      (_) => DateTime.now(),
                    ),
                    initialData: DateTime.now(),
                    builder: (context, snapshot) {
                      final currentTime = snapshot.data ?? DateTime.now();

                      final workingPeriod = ref
                          .read(homeRepositoryProvider)
                          .computeWorkingPeriod(
                            todayDatum.attendances,
                            now: currentTime,
                          );

                      final clockInText = workingPeriod.clockInText;

                      final clockOutText = workingPeriod.clockOutText;

                      final periodText = workingPeriod.periodText;

                      return SafeArea(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 7,
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.all(kMarginLarge),
                                child: Center(
                                  child: Column(
                                    children: [
                                      20.vGap,

                                      // TITLE
                                      const Text(
                                        'Check In / Check Out',
                                        style: TextStyle(
                                          color: kSecondaryOlive,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      20.vGap,

                                      // WORK LOCATION
                                      WorkLocationSelector(
                                        selectedLocation: _selectedLocation,
                                        savedLocation: savedWorkLocation,
                                        onChanged: _changeWorkLocation,
                                      ),

                                      40.vGap,

                                      // HEADER
                                      AttendanceHeader(
                                        currentTime: currentTime,
                                      ),

                                      40.vGap,

                                      /// =================================
                                      /// PREVIOUS CHECKOUT / ACTION BUTTONS
                                      /// =================================
                                      if (_isAttendanceStatusLoading)
                                        const Padding(
                                          padding: EdgeInsets.all(24),
                                          child: CircularProgressIndicator(
                                            color: kPrimaryColor,
                                          ),
                                        )
                                      else if (hasIncompletePreviousCheckout &&
                                          statusData != null)
                                        PreviousCheckoutCard(
                                          onAddCheckout: () async {
                                            final attendanceDate =
                                                statusData.date;

                                            final userId =
                                                _currentUserId ??
                                                statusData.userId;

                                            if (attendanceDate == null ||
                                                userId == null) {
                                              debugPrint(
                                                'Previous attendance information was not found.',
                                              );

                                              return;
                                            }

                                            await _openPreviousCheckout(
                                              attendanceDate: attendanceDate,
                                              userId: userId,
                                            );
                                          },
                                        )
                                      else
                                        AttendanceActionButtons(
                                          hasCheckedIn: hasCheckedIn,
                                          hasCheckedOut: hasCheckedOut,
                                          isCheckingOut:
                                              _isSubmittingCheckOut ||
                                              checkOutState.isLoading,
                                          time: currentTime.time12h,

                                          /// =============================
                                          /// CHECK-IN
                                          /// =============================
                                          onCheckIn: () async {
                                            await _handleCheckInTap(
                                              selectedLocation:
                                                  _selectedLocation,
                                              addresses: addresses,
                                              officeLatitude: officeLatitude,
                                              officeLongitude: officeLongitude,
                                              allowedDistance:
                                                  allowedCheckInDistance,
                                            );
                                          },

                                          /// =============================
                                          /// CHECK-OUT
                                          /// =============================
                                          onCheckOut: () async {
                                            if (hasCheckedOut ||
                                                _isSubmittingCheckOut ||
                                                checkOutState.isLoading) {
                                              return;
                                            }

                                            await _handleCheckOutTap(
                                              workLocation: effectiveLocation,
                                              clockInText: clockInText,
                                              clockOutText: clockOutText,
                                              periodText: periodText,
                                              officeLatitude: officeLatitude,
                                              officeLongitude: officeLongitude,
                                              allowedLogoutDistance:
                                                  allowedCheckOutDistance,
                                            );
                                          },
                                        ),

                                      20.vGap,
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            /// =====================
                            /// TODAY ATTENDANCE
                            /// =====================
                            Expanded(
                              flex: 2,
                              child: TodayAttendanceSection(
                                todayDatum: todayDatum,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },

                loading:
                    () => const Center(
                      child: CircularProgressIndicator(color: kPrimaryColor),
                    ),

                error: (error, stackTrace) {
                  return ErrorRetryView(
                    title: 'Error loading attendance',
                    message: error.toString(),
                    onRetry: () {
                      ref.invalidate(fetchAttendanceDataProvider);

                      _loadLatestAttendanceStatus();
                    },
                  );
                },
              );
            },

            loading:
                () => const Center(
                  child: CircularProgressIndicator(color: kPrimaryColor),
                ),

            error: (error, stackTrace) {
              return ErrorRetryView(
                title: 'Error loading config',
                message: error.toString(),
                onRetry: () {
                  ref.invalidate(fetchConfigDataProvider);

                  _loadLatestAttendanceStatus();
                },
              );
            },
          ),

          AttendanceLoadingOverlay(visible: isLoading),
        ],
      ),
    );
  }
}
