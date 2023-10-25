import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OpenInWebView {
  static void news(
    BuildContext context, {
    required String title,
    required String url,
  }) {
    context.pushNamed(
      'news-web-view',
      pathParameters: {
        'title': title,
        'url': url,
      },
    );
  }
}
