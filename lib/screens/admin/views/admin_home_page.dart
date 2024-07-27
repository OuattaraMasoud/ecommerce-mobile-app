import 'package:e_commerce_project/common/commons.dart';
import 'package:e_commerce_project/common/constant.dart';
import 'package:e_commerce_project/constants.dart';
import 'package:e_commerce_project/screens/admin/categories/views/admin_add_category.dart';
import 'package:e_commerce_project/screens/admin/products/views.dart';
import 'package:e_commerce_project/screens/admin/subcategories/views/add_new_subCategory_page.dart';
import 'package:e_commerce_project/screens/auth/auth_bloc/auth_bloc.dart';
import 'package:e_commerce_project/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminHomePage extends StatefulWidget {
  static const routeName = 'AdminHomePageView';
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: const SizedBox(),
        leadingWidth: 0,
        centerTitle: true,
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              var shouldLogout = await showPlatformDialog<bool>(
                context: context,
                builder: (_) => PlatformAlertDialog(
                  title: const Text('Confirmation'),
                  content: const Text(
                      'Voulez vous vraiment vous déconnecter de Shoppy ?'),
                  actions: <Widget>[
                    PlatformDialogAction(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text(
                        'Non',
                        style: TextStyle(color: Color(0xFF7B61FF)),
                      ),
                    ),
                    PlatformDialogAction(
                      onPressed: () => Navigator.of(context).pop(true),
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
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: SizedBox(
          height: 0.4.sh,
          child: GridView.count(
            childAspectRatio: 1.2,
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
            crossAxisCount: 2,
            crossAxisSpacing: 18.h,
            mainAxisSpacing: 18.w,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.white
                        : const Color(0XFF26282A),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.grey[350]!
                            : const Color.fromARGB(255, 26, 47, 29),
                        blurRadius: 5.0, // soften the shadow
                        spreadRadius: 5.0, //extend the shadow
                        offset: const Offset(
                          2.0, // Move to right 2  horizontally
                          2.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Hero(
                        tag: "2",
                        child: Image.asset(
                          'assets/images/products.png',
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? null
                                  : Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Produits",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: 16.sp,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? primaryColor
                                    : kWhiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Gerer les produits',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? kGrayColor.withOpacity(0.7)
                                    : Colors.white54,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                onTap: () async {
                  locator<NavigationService>()
                      .navigateTo(ProductListPage.routeName);
                },
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.white
                        : const Color(0XFF26282A),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.grey[350]!
                            : const Color.fromARGB(255, 26, 47, 29),
                        blurRadius: 5.0, // soften the shadow
                        spreadRadius: 5.0, //extend the shadow
                        offset: const Offset(
                          2.0, // Move to right 5  horizontally
                          2.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Hero(
                        tag: "3",
                        child: Image.asset(
                          'assets/images/category.png',
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? null
                                  : Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Catégories",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: 16.sp,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? primaryColor
                                    : kWhiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Gerer les catégories',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? kGrayColor.withOpacity(0.7)
                                    : Colors.white54,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                onTap: () async {
                  locator<NavigationService>()
                      .navigateTo(AdminAddNewCategoryPage.routeName);
                },
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.white
                        : const Color(0XFF26282A),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.grey[350]!
                            : const Color.fromARGB(255, 26, 47, 29),
                        blurRadius: 5.0, // soften the shadow
                        spreadRadius: 5.0, //extend the shadow
                        offset: const Offset(
                          2.0, // Move to right 5  horizontally
                          2.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Hero(
                        tag: "4",
                        child: Image.asset(
                          'assets/images/subcategory.png',
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? null
                                  : Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Sous-catégories",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: 16.sp,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? primaryColor
                                    : kWhiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Gérer les sous-catégories',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? kGrayColor.withOpacity(0.7)
                                    : Colors.white54,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                onTap: () async {
                  locator<NavigationService>()
                      .navigateTo(AddNewSubCategoryPage.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
