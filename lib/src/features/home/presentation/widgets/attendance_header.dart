import 'package:flutter/material.dart';
import 'package:hr_app/src/utils/extensions.dart';
import 'package:hr_app/src/utils/gap.dart';

import '../../../../utils/colors.dart';

class AttendanceHeader extends StatelessWidget {
  const AttendanceHeader({
    super.key,
    required this.currentTime,
  });

  final DateTime currentTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          currentTime.greeting,
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w600,
            color: kSecondaryOlive,
          ),
        ),

        10.vGap,

        Text(
          currentTime.formattedFullDate,
          style: const TextStyle(
            fontSize: 18,
            color: kSecondaryOlive,
          ),
        ),
      ],
    );
  }
}