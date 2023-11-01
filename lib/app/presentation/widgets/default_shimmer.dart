import 'package:flash_buzz/app/utils/constants/app_constant.dart';
import 'package:flash_buzz/app/utils/helpers/dark_mode_helper.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DefaultShimmer extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadiusGeometry? borderRadius;
  const DefaultShimmer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: borderRadius == null
          ? _shimmer(context)
          : _shimmerWithBorderRadius(context),
    );
  }

  Widget _shimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: DarkModeHelper.isDarkMode(context) ? greyColor : mutedColor,
      highlightColor:
          DarkModeHelper.isDarkMode(context) ? mutedColor : lightGreyColor,
      child: Container(
        color: DarkModeHelper.isDarkMode(context) ? mutedColor : lightGreyColor,
      ),
    );
  }

  Widget _shimmerWithBorderRadius(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius!,
      child: _shimmer(context),
    );
  }
}
