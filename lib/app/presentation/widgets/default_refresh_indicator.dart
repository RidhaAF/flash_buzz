import 'package:flash_buzz/app/utils/constants/app_constant.dart';
import 'package:flash_buzz/app/utils/helpers/dark_mode_helper.dart';
import 'package:flutter/material.dart';

class DefaultRefreshIndicator extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  const DefaultRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: onRefresh,
      backgroundColor:
          DarkModeHelper.isDarkMode(context) ? bgColorDark3 : bgColorLight2,
      child: child,
    );
  }
}
