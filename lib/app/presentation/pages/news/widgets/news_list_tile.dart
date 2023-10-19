import 'package:flash_buzz/app/presentation/widgets/default_image_error_builder.dart';
import 'package:flash_buzz/app/presentation/widgets/default_image_loading_builder.dart';
import 'package:flash_buzz/app/utils/constants/app_constant.dart';
import 'package:flash_buzz/app/utils/helpers/dark_mode_helper.dart';
import 'package:flutter/material.dart';

class NewsListTile extends StatelessWidget {
  final Widget? leading;
  final bool isLeadingImage;
  final String? leadingString;
  final Widget? title;
  final bool isTitleText;
  final String? titleString;
  final Widget? subtitle;
  final bool isSubtitleText;
  final String? subtitleString;
  final Widget? trailing;
  final bool isTrailingText;
  final String? trailingString;
  final void Function()? onTap;
  const NewsListTile({
    super.key,
    this.leading,
    this.isLeadingImage = false,
    this.leadingString,
    this.title,
    this.isTitleText = false,
    this.titleString,
    this.subtitle,
    this.isSubtitleText = false,
    this.subtitleString,
    this.trailing,
    this.isTrailingText = false,
    this.trailingString,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: isLeadingImage
          ? ClipRRect(
              borderRadius: BorderRadius.circular(defaultRadius),
              child: Image.network(
                leadingString ?? '',
                width: 96,
                height: 64,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) =>
                    DefaultImageLoadingBuilder(
                  loadingProgress: loadingProgress,
                  child: child,
                ),
                errorBuilder: (context, error, stackTrace) =>
                    const DefaultImageErrorBuilder(),
                cacheWidth: 96,
                cacheHeight: 64,
              ),
            )
          : leading,
      title: isTitleText
          ? Text(
              titleString ?? '',
              style: TextStyle(
                color: DarkModeHelper.isDarkMode(context)
                    ? whiteColor
                    : darkGreyColor,
                fontSize: subheadlineFS,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            )
          : title,
      subtitle: isSubtitleText
          ? Text(
              subtitleString ?? '',
              style: TextStyle(
                color: secondaryColor,
                fontSize: caption1FS,
              ),
            )
          : subtitle,
      trailing: isTrailingText
          ? Text(
              trailingString ?? '',
            )
          : trailing,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}
