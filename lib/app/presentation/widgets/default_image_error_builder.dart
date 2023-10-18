import 'package:flash_buzz/app/utils/constants/app_constant.dart';
import 'package:flutter/material.dart';

class DefaultImageErrorBuilder extends StatelessWidget {
  const DefaultImageErrorBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 64,
      color: Colors.grey,
      child: Icon(
        Icons.error_outline_rounded,
        color: whiteColor,
      ),
    );
  }
}
