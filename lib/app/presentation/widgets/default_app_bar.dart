import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final TextStyle? style;
  final Color? backgroundColor;
  final bool? centerTitle;
  final double? elevation;
  final Brightness? statusBarBrightness;
  const DefaultAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.flexibleSpace,
    this.style,
    this.backgroundColor,
    this.centerTitle,
    this.elevation,
    this.statusBarBrightness,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title ?? '',
          style: style != null ? style! : null,
          textScaleFactor: 1.0,
        ),
        leading: leading,
        actions: actions,
        flexibleSpace: flexibleSpace,
        backgroundColor: backgroundColor,
        centerTitle: centerTitle,
        elevation: elevation ?? 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: statusBarBrightness ?? Brightness.dark,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
