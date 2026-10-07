import 'package:intl/intl.dart';

import '../../../network/api_constants.dart';

import '../model/attendance_response.dart';
import '../model/home_view_data.dart';
import '../model/work_location.dart';

class AttendanceHelper {
  AttendanceHelper._();

  /// ===========================================================
  /// DATE
  /// ===========================================================

  static String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static bool isToday(DateTime? date) {
    if (date == null) {
      return false;
    }

    return formatDate(date) == formatDate(DateTime.now());
  }

  static bool isPreviousDate(DateTime? date) {
    if (date == null) {
      return false;
    }

    final today = DateTime.now();

    final todayOnly = DateTime(
      today.year,
      today.month,
      today.day,
    );

    final dateOnly = DateTime(
      date.year,
      date.month,
      date.day,
    );

    return dateOnly.isBefore(todayOnly);
  }

  /// ===========================================================
  /// TODAY ATTENDANCE
  /// ===========================================================

  static AttendanceDataVO findTodayAttendance(
      List<AttendanceDataVO> records,
      ) {
    return records.firstWhere(
          (record) => isToday(record.date),
      orElse: () {
        return AttendanceDataVO(
          date: null,
          attendances: [],
        );
      },
    );
  }

  /// ===========================================================
  /// CHECK-IN / CHECK-OUT
  /// ===========================================================

  static bool hasCheckedIn(
      AttendanceDataVO attendance,
      ) {
    return attendance.attendances.isNotEmpty;
  }

  static bool hasValidCheckOut(dynamic checkOut) {
    final value = checkOut?.toString().trim();

    return value != null &&
        value.isNotEmpty &&
        value.toLowerCase() != 'null';
  }

  static bool hasCheckedOut(
      AttendanceDataVO attendance,
      ) {
    return attendance.attendances.any(
          (item) => hasValidCheckOut(item.checkOut),
    );
  }

  /// ===========================================================
  /// WORK LOCATION
  /// ===========================================================

  static String normalizeWorkLocation(
      String? value,
      ) {
    return value
        ?.trim()
        .toLowerCase()
        .replaceAll('-', '_')
        .replaceAll(' ', '_') ??
        '';
  }

  static bool isOffice(
      String? value,
      ) {
    final normalized =
    normalizeWorkLocation(value);

    return normalized == 'office' ||
        normalized ==
            normalizeWorkLocation(
              kTypeOffice,
            );
  }

  static bool isWorkFromHome(
      String? value,
      ) {
    final normalized =
    normalizeWorkLocation(value);

    return normalized == 'wfh' ||
        normalized == 'work_from_home' ||
        normalized == 'workfromhome' ||
        normalized == 'work_from_somewhere' ||
        normalized == 'workfromsomewhere' ||
        normalized ==
            normalizeWorkLocation(
              kTypeWfh,
            ) ||
        normalized ==
            normalizeWorkLocation(
              kTypeWorkFromSomewhere,
            );
  }

  static WorkLocation? getSavedWorkLocation(
      List<Attendance> attendances,
      ) {
    for (final attendance in attendances.reversed) {
      final workLocation =
          attendance.workLocation;

      if (isOffice(workLocation)) {
        return WorkLocation.office;
      }

      if (isWorkFromHome(workLocation)) {
        return WorkLocation.workFromHome;
      }
    }

    return null;
  }

  /// ===========================================================
  /// HOME VIEW DATA
  /// ===========================================================

  static HomeViewData buildHomeViewData(
      List<AttendanceDataVO> records,
      ) {
    final todayAttendance =
    findTodayAttendance(records);

    final checkedIn =
    hasCheckedIn(todayAttendance);

    final checkedOut =
    hasCheckedOut(todayAttendance);

    final savedWorkLocation =
    checkedIn
        ? getSavedWorkLocation(
      todayAttendance.attendances,
    )
        : null;

    return HomeViewData(
      todayAttendance: todayAttendance,
      hasCheckedIn: checkedIn,
      hasCheckedOut: checkedOut,
      savedWorkLocation: savedWorkLocation,
    );
  }
}