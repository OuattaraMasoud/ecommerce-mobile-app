import 'package:e_commerce_project/constants.dart';
import 'package:flutter/material.dart';

import 'components/prederence_list_tile.dart';

class PreferencesScreen extends StatelessWidget {
  static const routeName = 'PreferencesScreennView';

  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cookie preferences"),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Rénitialiser"),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding),
        child: Column(
          children: [
            PreferencesListTile(
              titleText: "Analytics",
              subtitleTxt:
                  "Analytics cookies help us improve our application by collecting and reporting info on how you use it. They collect information in a way that does not directly identify anyone.",
              isActive: true,
              press: () {},
            ),
            const Divider(height: defaultPadding * 2),
            PreferencesListTile(
              titleText: "Personnalisation",
              subtitleTxt:
                  "Les cookies de personnalisation collectent des informations sur votre utilisation de cette application afin d'afficher un contenu et une expérience qui vous intéressent.",
              isActive: false,
              press: () {},
            ),
            const Divider(height: defaultPadding * 2),
            PreferencesListTile(
              titleText: "Marketing",
              subtitleTxt:
                  "Les cookies de marketing collectent des informations sur votre utilisation de cette application et d'autres applications pour permettre l'affichage d'annonces et d'autres marketings plus pertinents pour vous.",
              isActive: false,
              press: () {},
            ),
            const Divider(height: defaultPadding * 2),
            PreferencesListTile(
              titleText: "Cookies de réseaux sociaux",
              subtitleTxt:
                  "Ces cookies sont définis par une gamme de services de médias sociaux que nous avons ajoutés au site pour vous permettre de partager notre contenu avec vos amis et vos réseaux.",
              isActive: false,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
