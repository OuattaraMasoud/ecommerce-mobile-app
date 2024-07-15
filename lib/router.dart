import 'package:e_commerce_project/entry_point.dart';
import 'package:e_commerce_project/screens/auth/views/views.dart';
import 'package:e_commerce_project/screens/mens/views/views.dart';
import 'package:e_commerce_project/screens/product/views/view.dart';
import 'package:e_commerce_project/screens/search/views/views.dart';
import 'package:flutter/material.dart';

import 'app_root/views/views.dart';
import 'errors/no_connection_page.dart';
import 'home/views/views.dart';
import 'screens/address/views/views.dart';
import 'screens/bookmark/views/views.dart';
import 'screens/checkout/views/views.dart';
import 'screens/discover/views/views.dart';
import 'screens/home/views/views.dart';
import 'screens/kids/views/views.dart';
import 'screens/notification/view/views.dart';
import 'screens/on_sale/views/views.dart';
import 'screens/onbording/views/views.dart';
import 'screens/order/views/views.dart';
import 'screens/preferences/views/views.dart';
import 'screens/profile/views/views.dart';
import 'screens/reviews/view/views.dart';
import 'screens/user_info/views/views.dart';
import 'screens/wallet/views/views.dart';

const appRootPage = AppRootPage();
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePage.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const HomePage(),
          useDefaultPageRoute: true);
    case LoginScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const LoginScreen(),
          useDefaultPageRoute: true);
    case SignUpScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const SignUpScreen(),
          useDefaultPageRoute: true);
    case PasswordRecoveryScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const PasswordRecoveryScreen(),
          useDefaultPageRoute: true);
    case OnBordingScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const OnBordingScreen(),
          useDefaultPageRoute: true);

    case AddressesScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const AddressesScreen(),
          useDefaultPageRoute: true);
    case BookmarkScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const BookmarkScreen(),
          useDefaultPageRoute: true);
    case CartScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const CartScreen(),
          useDefaultPageRoute: true);
    case DiscoverScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const DiscoverScreen(),
          useDefaultPageRoute: true);
    case HomeScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const HomeScreen(),
          useDefaultPageRoute: true);
    case KidsScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const KidsScreen(),
          useDefaultPageRoute: true);
    case EnableNotificationScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const EnableNotificationScreen(),
          useDefaultPageRoute: true);
    case NoNotificationScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const NoNotificationScreen(),
          useDefaultPageRoute: true);
    case NotificationOptionsScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const NotificationOptionsScreen(),
          useDefaultPageRoute: true);
    case NotificationsScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const NotificationsScreen(),
          useDefaultPageRoute: true);
    case OnSaleScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const OnSaleScreen(),
          useDefaultPageRoute: true);
    case OrdersScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const OrdersScreen(),
          useDefaultPageRoute: true);
    case PreferencesScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const PreferencesScreen(),
          useDefaultPageRoute: true);
    case AddedToCartMessageScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const AddedToCartMessageScreen(),
          useDefaultPageRoute: true);
    case LocationPermissonStoreAvailabilityScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const LocationPermissonStoreAvailabilityScreen(),
          useDefaultPageRoute: true);
    case ProductBuyNowScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const ProductBuyNowScreen(),
          useDefaultPageRoute: true);
    case ProductDetailsScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: ProductDetailsScreen(
              productDetailsScreenArgument:
                  settings.arguments as ProductDetailsScreenArgument),
          useDefaultPageRoute: true);
    case ProductReturnsScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const ProductReturnsScreen(),
          useDefaultPageRoute: true);
    case ProfileScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const ProfileScreen(),
          useDefaultPageRoute: true);
    case SearchScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const SearchScreen(),
          useDefaultPageRoute: true);
    case UserInfoScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const UserInfoScreen(),
          useDefaultPageRoute: true);
    case EmptyWalletScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const EmptyWalletScreen(),
          useDefaultPageRoute: true);
    case WalletScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const WalletScreen(),
          useDefaultPageRoute: true);
    case ProductReviewsScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const ProductReviewsScreen(),
          useDefaultPageRoute: true);
    case MensScreen.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const MensScreen(),
          useDefaultPageRoute: true);
    case EntryPoint.routeName:
      return _getPageRoute(
          routeName: settings.name!,
          viewToShow: const EntryPoint(),
          useDefaultPageRoute: true);

    case NoConnectionPage.routeName:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const NoConnectionPage(),
        useDefaultPageRoute: true,
      );

    default:
      return noRouteDefinedPage(settings);
  }
}

MaterialPageRoute noRouteDefinedPage(RouteSettings settings) {
  return MaterialPageRoute(
      builder: (_) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
            ),
            body: Center(child: Text('No route defined for ${settings.name}')),
          ));
}

PageRoute _getPageRoute({
  required String routeName,
  required Widget viewToShow,
  bool useDefaultPageRoute = false,
  bool? fullScreenDialog = false,
}) {
  if (useDefaultPageRoute) {
    return MaterialPageRoute(
      builder: (context) => viewToShow,
      settings: RouteSettings(
        name: routeName,
      ),
      fullscreenDialog: fullScreenDialog ?? false,
    );
  }
  return MaterialPageRoute(
    builder: (context) => viewToShow,
    settings: RouteSettings(name: routeName),
    fullscreenDialog: fullScreenDialog ?? false,
  );
}
