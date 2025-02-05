import 'package:flutter/material.dart';

import '../setting.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget child;

  const AppScaffold({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: true,
        top: false,
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: LAYOUT_HORIZON_PADDING),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(0, 53, 129, 1),
                    Color.fromRGBO(76, 106, 255, 1),
                  ],
                ),
              ),
              child: Scaffold(
                appBar: AppBar(
                  title: Text(title),
                ),
                body: child,
              )),
        ));
  }
}
