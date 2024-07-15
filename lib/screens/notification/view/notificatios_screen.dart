import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationsScreen extends StatelessWidget {
  static const routeName = 'NotificationsScreenView';

  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/DotsV.svg",
              ),
            )
          ],
        ),
        body: Container());
  }
}
