import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/url_provider.dart';

Widget myControls() {
  return Builder(builder: (context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Provider.of<UrlProvider>(context, listen: false).goBack();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 35,
          ),
        ),
        IconButton(
          onPressed: () {
            Provider.of<UrlProvider>(context, listen: false).goHome();
          },
          icon: const Icon(
            Icons.home_outlined,
            size: 35,
          ),
        ),
        IconButton(
          onPressed: () {
            Provider.of<UrlProvider>(context, listen: false).addBookmark();
          },
          icon: const Icon(
            Icons.bookmark_add_outlined,
            size: 35,
          ),
        ),
        IconButton(
          onPressed: () {
            Provider.of<UrlProvider>(context, listen: false).reload();
          },
          icon: const Icon(
            Icons.refresh,
            size: 35,
          ),
        ),
        IconButton(
          onPressed: () {
            Provider.of<UrlProvider>(context, listen: false).goForward();
          },
          icon: const Icon(
            Icons.arrow_forward_ios,
            size: 35,
          ),
        ),
      ],
    );
  });
}
