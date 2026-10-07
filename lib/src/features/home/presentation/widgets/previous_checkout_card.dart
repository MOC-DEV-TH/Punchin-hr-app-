import 'package:flutter/material.dart';

import '../../../../common_widgets/common_button.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/gap.dart';

class PreviousCheckoutCard extends StatelessWidget {
  const PreviousCheckoutCard({
    super.key,
    required this.onAddCheckout,
  });

  final VoidCallback onAddCheckout;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8F8),
        border: Border.all(
          color: Colors.redAccent,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Text(
            'Incomplete checkout yesterday',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kSecondaryOlive,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),

          8.vGap,

          const Text(
            'Please add yesterday checkout to continue check-in today.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kGreyColor,
              fontSize: 12,
            ),
          ),

          18.vGap,

          SizedBox(
            width: double.infinity,
            child: CommonButton(
              containerVPadding: 10,
              text: 'Add Yesterday Checkout',
              buttonTextColor: Colors.white,
              bgColor: Colors.green,
              borderColor: kPrimaryColor,
              onTap: onAddCheckout,
            ),
          ),
        ],
      ),
    );
  }
}