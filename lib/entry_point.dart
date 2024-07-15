import 'package:animations/animations.dart';
import 'package:e_commerce_project/common/commons.dart';
import 'package:e_commerce_project/constants.dart';
import 'package:e_commerce_project/screens/notification/view/views.dart';
import 'package:e_commerce_project/screens/search/views/search_screen.dart';
import 'package:e_commerce_project/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'screens/bookmark/views/views.dart';
import 'screens/checkout/views/views.dart';
import 'screens/discover/views/views.dart';
import 'screens/home/views/views.dart';
import 'screens/profile/views/views.dart';

class EntryPoint extends StatefulWidget {
  static const routeName = 'EntryPointView';
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  final List _pages = const [
    HomeScreen(),
    DiscoverScreen(),
    BookmarkScreen(),
    // EmptyCartScreen(), // if Cart is empty
    CartScreen(),
    ProfileScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SvgPicture svgIcon(String src, {Color? color}) {
      return SvgPicture.asset(
        src,
        height: 24,
      );
    }

    return Scaffold(
      appBar: AppBar(
        // pinned: true,
        // floating: true,
        // snap: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: const SizedBox(),
        leadingWidth: 0,
        centerTitle: false,
        title: Text(
          'Shoppy',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              locator<NavigationService>().navigateTo(SearchScreen.routeName);
            },
            icon: SvgPicture.asset(
              "assets/icons/Search.svg",
              height: 24,
            ),
          ),
          IconButton(
            onPressed: () {
              locator<NavigationService>()
                  .navigateTo(NotificationsScreen.routeName);
            },
            icon: SvgPicture.asset(
              "assets/icons/Notification.svg",
              height: 24,
            ),
          ),
        ],
      ),
      // body: _pages[_currentIndex],
      body: PageTransitionSwitcher(
        duration: defaultDuration,
        transitionBuilder: (child, animation, secondAnimation) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondAnimation,
            child: child,
          );
        },
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: defaultPadding / 2),
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : const Color(0xFF101015),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            if (index != _currentIndex) {
              setState(() {
                _currentIndex = index;
              });
            }
          },
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : const Color(0xFF101015),
          type: BottomNavigationBarType.fixed,
          // selectedLabelStyle: TextStyle(color: primaryColor),
          selectedFontSize: 12,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopify_sharp),
              activeIcon: Icon(
                Icons.shopify_sharp,
              ),
              label: "Shop",
            ),
            BottomNavigationBarItem(
              icon: svgIcon("assets/icons/Category.svg"),
              activeIcon:
                  svgIcon("assets/icons/Category.svg", color: primaryColor),
              label: "Discover",
            ),
            BottomNavigationBarItem(
              icon: svgIcon("assets/icons/Bookmark.svg"),
              activeIcon:
                  svgIcon("assets/icons/Bookmark.svg", color: primaryColor),
              label: "Bookmark",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              activeIcon: Icon(
                Icons.shopping_bag_outlined,
              ),
              label: "Panier",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              activeIcon: Icon(
                Icons.account_circle_outlined,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
