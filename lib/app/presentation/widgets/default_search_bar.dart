import 'package:flash_buzz/app/utils/constants/app_constant.dart';
import 'package:flash_buzz/app/utils/helpers/dark_mode_helper.dart';
import 'package:flutter/material.dart';

class DefaultSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final Function? onChanged;
  final Function? onPressed;
  const DefaultSearchBar({
    super.key,
    @required this.controller,
    @required this.focusNode,
    this.hintText,
    @required this.onChanged,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: SearchBar(
        controller: controller,
        focusNode: focusNode,
        hintText: hintText ?? 'Search...',
        leading: Icon(
          Icons.search_rounded,
          color: controller!.text.isNotEmpty
              ? (DarkModeHelper.isDarkMode(context) ? whiteColor : blackColor)
              : (DarkModeHelper.isDarkMode(context) ? mutedColor : mutedColor),
        ),
        trailing: controller!.text.isNotEmpty
            ? [
                IconButton(
                  onPressed: () => onPressed!(),
                  tooltip: 'Clear',
                  icon: const Icon(Icons.clear_rounded),
                ),
              ]
            : null,
        onChanged: (value) => onChanged!(value),
      ),
    );
  }
}
