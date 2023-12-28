import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/url_provider.dart';

Widget searchTextField() {
  return Builder(builder: (context) {
    return TextField(
      controller: Provider.of<UrlProvider>(context).urlModel.searchController,
      decoration: InputDecoration(
        hintText: "Search or type web address",
        border: const OutlineInputBorder(),
        suffixIcon: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                Provider.of<UrlProvider>(context, listen: false).search();
              },
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                Provider.of<UrlProvider>(context, listen: false)
                    .clearSearchValue();
              },
              icon: const Icon(Icons.clear),
            ),
          ],
        ),
      ),
    );
  });
}
