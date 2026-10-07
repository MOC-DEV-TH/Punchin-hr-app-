import 'package:flutter/material.dart';

import '../../../../common_widgets/time_tracking_table.dart';
import '../../../../utils/colors.dart';
import '../../model/attendance_response.dart';

class TodayAttendanceSection extends StatelessWidget {
  const TodayAttendanceSection({
    super.key,
    required this.todayDatum,
  });

  final AttendanceDataVO todayDatum;

  @override
  Widget build(BuildContext context) {
    if (todayDatum.date == null) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: kSoftYellow,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: TimeTrackingTable(
          isFromHomePage: true,
          records: [todayDatum],
        ),
      ),
    );
  }
}