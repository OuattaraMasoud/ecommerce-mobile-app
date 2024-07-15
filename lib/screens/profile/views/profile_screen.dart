import 'package:e_commerce_project/components/components.dart';
import 'package:e_commerce_project/components/list_tile/divider_list_tile.dart';
import 'package:e_commerce_project/constants.dart';
import 'package:e_commerce_project/screens/address/views/addresses_screen.dart';
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

class ProfileScreen extends StatelessWidget {
  static const routeName = 'ProfileScreenView';

  const ProfileScreen({super.key});

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
                      // proLableText: "Sliver",
                      // isPro: true, if the user is pro
                      press: () {
                        locator<NavigationService>()
                            .navigateTo(UserInfoScreen.routeName);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                          vertical: defaultPadding * 1.5),
                      child: GestureDetector(
                        onTap: () {},
                        child: const AspectRatio(
                          aspectRatio: 1.8,
                          child: NetworkImageWithLoader(
                              "https://i.imgur.com/dz0BBom.png"),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      child: Text(
                        "Account",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    ProfileMenuListTile(
                      text: "Orders",
                      svgSrc: "assets/icons/Order.svg",
                      press: () {
                        locator<NavigationService>()
                            .navigateTo(OrdersScreen.routeName);
                      },
                    ),
                    ProfileMenuListTile(
                      text: "Returns",
                      svgSrc: "assets/icons/Return.svg",
                      press: () {},
                    ),
                    ProfileMenuListTile(
                      text: "Wishlist",
                      svgSrc: "assets/icons/Wishlist.svg",
                      press: () {},
                    ),
                    ProfileMenuListTile(
                      text: "Addresses",
                      svgSrc: "assets/icons/Address.svg",
                      press: () {
                        locator<NavigationService>()
                            .navigateTo(AddressesScreen.routeName);
                      },
                    ),
                    ProfileMenuListTile(
                      text: "Payment",
                      svgSrc: "assets/icons/card.svg",
                      press: () {
                        locator<NavigationService>()
                            .navigateTo(EmptyWalletScreen.routeName);
                      },
                    ),
                    ProfileMenuListTile(
                      text: "Wallet",
                      svgSrc: "assets/icons/Wallet.svg",
                      press: () {
                        locator<NavigationService>()
                            .navigateTo(WalletScreen.routeName);
                      },
                    ),
                    const SizedBox(height: defaultPadding),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                          vertical: defaultPadding / 2),
                      child: Text(
                        "Personalization",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    DividerListTileWithTrilingText(
                      svgSrc: "assets/icons/Notification.svg",
                      title: "Notification",
                      trilingText: "Off",
                      press: () {
                        locator<NavigationService>()
                            .navigateTo(EnableNotificationScreen.routeName);
                      },
                    ),
                    ProfileMenuListTile(
                      text: "Preferences",
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
                        "Settings",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    ProfileMenuListTile(
                      text: "Language",
                      svgSrc: "assets/icons/Language.svg",
                      press: () {},
                    ),
                    ProfileMenuListTile(
                      text: "Location",
                      svgSrc: "assets/icons/Location.svg",
                      press: () {},
                    ),
                    const SizedBox(height: defaultPadding),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                          vertical: defaultPadding / 2),
                      child: Text(
                        "Help & Support",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    ProfileMenuListTile(
                      text: "Get Help",
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
                        "Log Out",
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
