import 'attendance_response.dart';
import 'work_location.dart';

class HomeViewData {
  const HomeViewData({
    required this.todayAttendance,
    required this.hasCheckedIn,
    required this.hasCheckedOut,
    required this.savedWorkLocation,
  });

  final AttendanceDataVO todayAttendance;

  final bool hasCheckedIn;

  final bool hasCheckedOut;

  final WorkLocation? savedWorkLocation;
}