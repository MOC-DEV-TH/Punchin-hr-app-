import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_app/src/utils/colors.dart';
import 'package:hr_app/src/utils/dimens.dart';

class AdminCustomAppBarView extends StatelessWidget
    implements PreferredSizeWidget {

  final String title;
  final Color? bgColor;
  final VoidCallback? onTap;
  final VoidCallback? onTapEdit;
  final VoidCallback? onBackPressed;
  final bool isShowRightIcon;
  final bool? isShowEditIcon;

  const AdminCustomAppBarView({
    super.key,
    required this.title,
    this.bgColor,
    this.onTap,
    this.onBackPressed,
    required this.isShowRightIcon,
    this.isShowEditIcon,
    this.onTapEdit,
  });

  void _handleBack(BuildContext context) {
    if (onBackPressed != null) {
      onBackPressed!();
      return;
    }

    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      leadingWidth: 40,
      backgroundColor: bgColor ?? kSecondaryColor,
      toolbarHeight: 40,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: kGreyColor,
          height: 0.3,
        ),
      ),
      title: Row(
        children: [
          InkWell(
            onTap: () => _handleBack(context),
            child: const Icon(
              Icons.keyboard_backspace,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: kTextRegular18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          if (isShowRightIcon)
            InkWell(
              onTap: onTap,
              child: const Icon(Icons.more_vert),
            ),
          if (isShowEditIcon == true)
            InkWell(
              onTap: onTapEdit,
              child: const Icon(
                Icons.edit_note_rounded,
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}