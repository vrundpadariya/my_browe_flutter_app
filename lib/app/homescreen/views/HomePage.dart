import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../asset/asset.dart';
import '../components/widgets/controls.dart';
import '../components/widgets/popupmenubutton.dart';
import '../components/widgets/textfield.dart';
import '../components/widgets/webview.dart';
import '../provider/connectivity_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Browser",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          actions: [
            mypopupmenuButton(),
          ],
        ),
        body: (Provider.of<ConnectivityProvider>(context)
                    .connectivityModel
                    .connectivityStatus ==
                "waiting")
            ? Center(
                child: Container(
                height: 300,
                width: double.infinity,
                decoration: myBoxDecoration(),
              ))
            : Column(
                children: [
                  Expanded(
                    flex: 25,
                    child: mywebview(),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            searchTextField(),
                            const SizedBox(
                              height: 2,
                            ),
                            myControls(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  BoxDecoration myBoxDecoration() => BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            Assets.noInternet,
          ),
        ),
      );
}
