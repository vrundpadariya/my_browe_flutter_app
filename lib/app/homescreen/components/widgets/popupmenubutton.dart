import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/url_provider.dart';

Widget mypopupmenuButton() {
  return Builder(builder: (context) {
    return PopupMenuButton(
      constraints: const BoxConstraints.expand(height: 110, width: 250),
      offset: const Offset(10, 50),
      icon: const Icon(Icons.more_vert),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(Icons.bookmark_add_outlined),
              SizedBox(
                width: 25,
              ),
              Text("All BookMarks"),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 2,
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(Icons.laptop),
              SizedBox(
                width: 25,
              ),
              Text("Search Engine"),
            ],
          ),
        ),
      ],
      onSelected: (selectedOption) {
        Provider.of<UrlProvider>(context, listen: false)
            .urlModel
            .selectedOption = selectedOption;
        if (selectedOption == 1) {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.close,
                            ),
                            label: const Text(
                              "Dismiss",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: (Provider.of<UrlProvider>(context, listen: false)
                              .urlModel
                              .bookmarkPageName
                              .isNotEmpty)
                          ? ListView.builder(
                              itemCount: Provider.of<UrlProvider>(context)
                                  .urlModel
                                  .bookmarkPageName
                                  .length,
                              itemBuilder: (context, i) => ListTile(
                                onTap: () {
                                  Provider.of<UrlProvider>(context,
                                          listen: false)
                                      .loadUrl(i);
                                  Navigator.of(context).pop();
                                },
                                title: Text(Provider.of<UrlProvider>(context,
                                        listen: false)
                                    .urlModel
                                    .bookmarkPageName[i]),
                                subtitle: Text(Provider.of<UrlProvider>(context,
                                        listen: false)
                                    .urlModel
                                    .bookmarkPageUrl[i]),
                                trailing: IconButton(
                                  onPressed: () {
                                    Provider.of<UrlProvider>(context,
                                            listen: false)
                                        .removeBookmark(i);
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ),
                            )
                          : const Center(
                              child: Text("No any bookmarks yet..."),
                            ),
                    ),
                  ],
                ),
              );
            },
          );
        } else if (selectedOption == 2) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Search Engine",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RadioListTile(
                    title: const Text("Google"),
                    value: "https://www.google.com/",
                    groupValue: Provider.of<UrlProvider>(context).urlModel.url,
                    onChanged: (url) {
                      Provider.of<UrlProvider>(context, listen: false)
                          .urlModel
                          .url = url!;

                      Provider.of<UrlProvider>(context, listen: false)
                          .launchBrowser();
                      Navigator.of(context).pop();
                    },
                  ),
                  RadioListTile(
                    title: const Text("Yahoo"),
                    value: "https://www.yahoo.com/",
                    groupValue: Provider.of<UrlProvider>(context).urlModel.url,
                    onChanged: (url) {
                      Provider.of<UrlProvider>(context, listen: false)
                          .urlModel
                          .url = url!;

                      Provider.of<UrlProvider>(context, listen: false)
                          .launchBrowser();
                      Navigator.of(context).pop();
                    },
                  ),
                  RadioListTile(
                    title: const Text("Bing"),
                    value: "https://www.bing.com/",
                    groupValue: Provider.of<UrlProvider>(context).urlModel.url,
                    onChanged: (url) {
                      Provider.of<UrlProvider>(context, listen: false)
                          .urlModel
                          .url = url!;

                      Provider.of<UrlProvider>(context, listen: false)
                          .launchBrowser();
                      Navigator.of(context).pop();
                    },
                  ),
                  RadioListTile(
                    title: const Text("Duck Duck Go"),
                    value: "https://duckduckgo.com/",
                    groupValue: Provider.of<UrlProvider>(context).urlModel.url,
                    onChanged: (url) {
                      Provider.of<UrlProvider>(context, listen: false)
                          .urlModel
                          .url = url!;

                      Provider.of<UrlProvider>(context, listen: false)
                          .launchBrowser();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  });
}
