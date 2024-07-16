import 'package:e_commerce_project/components/list_tile/divider_list_tile.dart';
import 'package:e_commerce_project/constants.dart';
import 'package:e_commerce_project/screens/auth/auth_bloc/auth_bloc.dart';
import 'package:e_commerce_project/screens/notification/view/views.dart';
import 'package:e_commerce_project/screens/order/views/views.dart';
import 'package:e_commerce_project/screens/preferences/views/views.dart';
import 'package:e_commerce_project/screens/user_info/views/user_info_screen.dart';
import 'package:e_commerce_project/screens/wallet/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../services/services.dart';
import 'components/profile_card.dart';
import 'components/profile_menu_item_list_tile.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = 'ProfileScreenView';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool value = true;
  String notificationTrailingText = 'On';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          return authState.user != null
              ? ListView(
                  children: [
                    ProfileCard(
                      name:
                          "${authState.user!.firstName} ${authState.user!.lastName}",
                      email:
                          authState.user!.email ?? 'masoudouattara@gmail.com',
                      imageSrc:
                          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
                      press: () {
                        locator<NavigationService>()
                            .navigateTo(UserInfoScreen.routeName);
                      },
                    ),
                    Divider(
                      thickness: 0.75,
                      color: Colors.grey.shade800,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      child: Text(
                        "Compte",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    ProfileMenuListTile(
                      text: "Commandes",
                      svgSrc: "assets/icons/Order.svg",
                      press: () {
                        locator<NavigationService>()
                            .navigateTo(OrdersScreen.routeName);
                      },
                    ),

                    ProfileMenuListTile(
                      text: "Adresse",
                      svgSrc: "assets/icons/Address.svg",
                      press: () {
                        // locator<NavigationService>()
                        //     .navigateTo(AddressesScreen.routeName);
                      },
                    ),
                    ProfileMenuListTile(
                      text: "Paiements",
                      svgSrc: "assets/icons/card.svg",
                      press: () {
                        locator<NavigationService>()
                            .navigateTo(EmptyWalletScreen.routeName);
                      },
                    ),
                    ProfileMenuListTile(
                      text: "Porte-feuille",
                      svgSrc: "assets/icons/Wallet.svg",
                      press: () {
                        // locator<NavigationService>()
                        //     .navigateTo(WalletScreen.routeName);
                      },
                    ),
                    const SizedBox(height: defaultPadding),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                          vertical: defaultPadding / 2),
                      child: Text(
                        "Personnalisation",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    DividerListTileWithTrilingText(
                      svgSrc: "assets/icons/Notification.svg",
                      title: "Notifications",
                      trilingText: notificationTrailingText,
                      trailingWidget: Switch.adaptive(
                        value: value,
                        onChanged: (newValue) => setState(() {
                          value = newValue;
                          if (value == true) {
                            notificationTrailingText = "On";
                          } else {
                            notificationTrailingText = "Off";
                          }
                        }),
                      ),
                      press: () {
                        locator<NavigationService>()
                            .navigateTo(EnableNotificationScreen.routeName);
                      },
                    ),
                    ProfileMenuListTile(
                      text: "Préferences",
                      svgSrc: "assets/icons/Preferences.svg",
                      press: () {
                        locator<NavigationService>()
                            .navigateTo(PreferencesScreen.routeName);
                      },
                    ),
                    const SizedBox(height: defaultPadding),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                          vertical: defaultPadding / 2),
                      child: Text(
                        "Paramètres",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    ProfileMenuListTile(
                      text: "Langue",
                      svgSrc: "assets/icons/Language.svg",
                      press: () {},
                    ),
                    ProfileMenuListTile(
                      text: "Localisation",
                      svgSrc: "assets/icons/Location.svg",
                      press: () {},
                    ),
                    const SizedBox(height: defaultPadding),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                          vertical: defaultPadding / 2),
                      child: Text(
                        "Assistance & Support",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    ProfileMenuListTile(
                      text: "Aide",
                      svgSrc: "assets/icons/Help.svg",
                      press: () {},
                    ),
                    ProfileMenuListTile(
                      text: "FAQ",
                      svgSrc: "assets/icons/FAQ.svg",
                      press: () {},
                      isShowDivider: false,
                    ),
                    const SizedBox(height: defaultPadding),

                    // Log Out
                    ListTile(
                      onTap: () async {
                        var shouldLogout = await showPlatformDialog<bool>(
                          context: context,
                          builder: (_) => PlatformAlertDialog(
                            title: const Text('Confirmation'),
                            content: const Text(
                                'Voulez vous vraiment vous déconnecter de Shoppy ?'),
                            actions: <Widget>[
                              PlatformDialogAction(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text(
                                  'Non',
                                  style: TextStyle(color: Color(0xFF7B61FF)),
                                ),
                              ),
                              PlatformDialogAction(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text(
                                  'Se déconnecter',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        );
                        if (shouldLogout != null && shouldLogout) {
                          context.read<AuthBloc>().add(const LogoutEvent());
                        }
                      },
                      minLeadingWidth: 24,
                      leading: SvgPicture.asset(
                        "assets/icons/Logout.svg",
                        height: 24,
                        width: 24,
                      ),
                      title: const Text(
                        "Se deconnecter",
                        style: TextStyle(
                            color: errorColor, fontSize: 14, height: 1),
                      ),
                    )
                  ],
                )
              : SizedBox();
        },
      ),
    );
  }
}
