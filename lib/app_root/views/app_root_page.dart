import 'package:e_commerce_project/home/views/views.dart';
import 'package:e_commerce_project/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRootPage extends StatefulWidget {
  static const String routeName = "AppRootView";
  const AppRootPage({Key? key}) : super(key: key);

  @override
  State<AppRootPage> createState() => _AppRootPageState();
}

class _AppRootPageState extends State<AppRootPage> with WidgetsBindingObserver {
  int _currentIndex = 0;
  late List<Widget> _homePages;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initHomePages(context);
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  void _initHomePages(BuildContext context) {
    _homePages = [
      const HomePage(),
      const HomePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: IndexedStack(
          index: _currentIndex,
          children: _homePages,
        ),

        // ClipRRect(
        //       borderRadius: const BorderRadius.all(Radius.circular(35)),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedFontSize: 11,
          selectedFontSize: 13,
          iconSize: 28.sp,
          enableFeedback: true,
          backgroundColor: Colors.grey,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Accueil',
            ),
          ],
        ));
  }

  // @override
  // Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
  //   switch (state) {
  //     case AppLifecycleState.resumed:
  //       locator<GlobalAppCubit>().lockScreen();
  //       break;
  //     case AppLifecycleState.inactive:
  //     case AppLifecycleState.paused:
  //     case AppLifecycleState.detached:
  //       locator<GlobalAppCubit>().lockScreen();
  //       break;
  //   }
  // }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
