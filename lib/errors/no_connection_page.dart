import 'package:flutter/material.dart';

import '../common/commons.dart';

class NoConnectionPage extends StatelessWidget {
  static const routeName = "NoConnectionPageView";
  const NoConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/1_No Connection.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 100,
            left: 30,
            child: TextButton(
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                foregroundColor: const WidgetStatePropertyAll(Colors.white),
              ),
              onPressed: () {
                locator<NavigationService>().pop();
              },
              child: Text("Réessayer".toUpperCase()),
            ),
          )
        ],
      ),
    );
  }
}
