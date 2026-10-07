import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../../common_widgets/loading_view.dart';

class AttendanceLoadingOverlay extends StatelessWidget {
  const AttendanceLoadingOverlay({
    super.key,
    required this.visible,
  });

  final bool visible;

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return const SizedBox.shrink();
    }

    return Positioned.fill(
      child: Container(
        color: Colors.black38,
        child: const Center(
          child: LoadingView(
            indicatorColor: Colors.white,
            indicator: Indicator.ballRotate,
          ),
        ),
      ),
    );
  }
}