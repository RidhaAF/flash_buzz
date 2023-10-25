import 'package:flash_buzz/app/presentation/widgets/default_app_bar.dart';
import 'package:flash_buzz/app/utils/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebViewPage extends StatefulWidget {
  final String title;
  final String url;
  const NewsWebViewPage({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  State<NewsWebViewPage> createState() => _NewsWebViewPageState();
}

class _NewsWebViewPageState extends State<NewsWebViewPage> {
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..enableZoom(true)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: WebViewWidget(controller: _webViewController),
    );
  }

  PreferredSizeWidget _appBar() {
    return DefaultAppBar(
      title: widget.title,
      actions: [
        _refreshButton(),
      ],
    );
  }

  Widget _refreshButton() {
    return IconButton(
      onPressed: () => _webViewController.reload(),
      tooltip: 'Refresh',
      icon: Icon(
        Icons.refresh,
        color: whiteColor,
      ),
    );
  }
}
