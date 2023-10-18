import 'package:flutter/material.dart';

class DefaultImageLoadingBuilder extends StatelessWidget {
  final Widget child;
  final ImageChunkEvent? loadingProgress;
  const DefaultImageLoadingBuilder({
    super.key,
    required this.child,
    this.loadingProgress,
  });

  @override
  Widget build(BuildContext context) {
    return loadingProgress == null
        ? child
        : const SizedBox(
            width: 96,
            height: 64,
            child: CircularProgressIndicator.adaptive(),
          );
  }
}
