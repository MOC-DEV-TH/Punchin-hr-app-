import 'package:flutter/material.dart';

import '../../../../common_widgets/circle_button.dart';
import '../../../../utils/colors.dart';

class AttendanceActionButtons extends StatelessWidget {
  const AttendanceActionButtons({
    super.key,
    required this.hasCheckedIn,
    required this.hasCheckedOut,
    required this.isCheckingOut,
    required this.time,
    required this.onCheckIn,
    required this.onCheckOut,
  });

  final bool hasCheckedIn;
  final bool hasCheckedOut;
  final bool isCheckingOut;

  final String time;

  final VoidCallback onCheckIn;
  final VoidCallback onCheckOut;

  @override
  Widget build(BuildContext context) {
    final checkoutDisabled =
        hasCheckedOut || isCheckingOut;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!hasCheckedIn)
          CircleActionButton(
            onTap: onCheckIn,
            label: time,
            icon: Icons.login,
            backgroundColor: kEmeraldGreenColor,
          ),

        if (hasCheckedIn)
          CircleActionButton(
            onTap: () {
              if (checkoutDisabled) {
                return;
              }

              onCheckOut();
            },
            label: time,
            icon: Icons.logout,
            backgroundColor:
            checkoutDisabled
                ? kGreyColor
                : kSecondaryColor,
          ),
      ],
    );
  }
}