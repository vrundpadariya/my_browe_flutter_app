import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

import '../../provider/url_provider.dart';

Widget mywebview() {
  return Builder(builder: (context) {
    return InAppWebView(
      pullToRefreshController:
          Provider.of<UrlProvider>(context).urlModel.pullToRefreshController,
      onWebViewCreated: (controller) {
        Provider.of<UrlProvider>(context, listen: false)
            .urlModel
            .inAppWebViewController = controller;
      },
      onLoadStart: (controller, url) {
        Provider.of<UrlProvider>(context, listen: false)
            .urlModel
            .inAppWebViewController = controller;
        Provider.of<UrlProvider>(context, listen: false).urlModel.urlBookmark =
            url.toString();
      },
      onLoadStop: (controller, url) async {
        await Provider.of<UrlProvider>(context, listen: false)
            .urlModel
            .pullToRefreshController
            ?.endRefreshing();
      },
      initialUrlRequest: URLRequest(
        url: Uri.parse(Provider.of<UrlProvider>(context).urlModel.url),
      ),
    );
  });
}
