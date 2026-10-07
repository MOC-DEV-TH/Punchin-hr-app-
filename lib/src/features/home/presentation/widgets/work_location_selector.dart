import 'package:flutter/material.dart';
import 'package:hr_app/src/utils/gap.dart';

import '../../../../common_widgets/common_button.dart';
import '../../../../utils/colors.dart';
import '../../model/work_location.dart';

class WorkLocationSelector extends StatelessWidget {
  const WorkLocationSelector({
    super.key,
    required this.selectedLocation,
    required this.savedLocation,
    required this.onChanged,
  });

  final WorkLocation? selectedLocation;
  final WorkLocation? savedLocation;
  final ValueChanged<WorkLocation> onChanged;

  bool get isLocked => savedLocation != null;

  @override
  Widget build(BuildContext context) {
    final effectiveLocation =
        savedLocation ?? selectedLocation;

    final disableWfh =
        isLocked &&
            savedLocation == WorkLocation.office;

    final disableOffice =
        isLocked &&
            savedLocation == WorkLocation.workFromHome;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: CommonButton(
            containerVPadding: 10,
            text: 'Work From Home',
            buttonTextColor: disableWfh
                ? kGreyColor
                : kSecondaryOlive,
            bgColor:
            effectiveLocation ==
                WorkLocation.workFromHome
                ? kPrimaryColor
                : kWhiteColor,
            borderColor: disableWfh
                ? kGreyColor
                : kPrimaryColor,
            onTap: disableWfh
                ? null
                : () {
              onChanged(
                WorkLocation.workFromHome,
              );
            },
          ),
        ),

        20.vGap,

        SizedBox(
          width: double.infinity,
          child: CommonButton(
            containerVPadding: 10,
            text: 'Office',
            buttonTextColor: disableOffice
                ? kGreyColor
                : kSecondaryOlive,
            bgColor:
            effectiveLocation ==
                WorkLocation.office
                ? kPrimaryColor
                : kWhiteColor,
            borderColor: disableOffice
                ? kGreyColor
                : kPrimaryColor,
            onTap: disableOffice
                ? null
                : () {
              onChanged(
                WorkLocation.office,
              );
            },
          ),
        ),

        if (isLocked) ...[
          12.vGap,
          Text(
            savedLocation == WorkLocation.office
                ? 'Today\'s work location: Office'
                : 'Today\'s work location: Work From Home',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: kSecondaryOlive,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ],
    );
  }
}