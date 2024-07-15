import 'dart:io';

import 'package:e_commerce_project/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../services/services.dart';

simpleAppBar(
  BuildContext context, {
  Widget? title,
  bool automaticallyImplyLeading = false,
  bool showDefaultLeading = false,
  Widget? leading,
  bool? sholdShowActionButtons = true,
  List<Widget>? appBarActions,
  List<Widget>? additionalAppBarActions,
}) =>
    AppBar(
      backgroundColor: Colors.transparent,
      title: title,
      automaticallyImplyLeading: automaticallyImplyLeading,
      elevation: 0,
      leading: showDefaultLeading
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 35.0.w,
                color: Colors.grey.shade800,
              ),
              onPressed: () {
                locator<NavigationService>().pop();
              },
            )
          : leading,
      actions: appBarActions ??
          [
            ...additionalAppBarActions != null &&
                    additionalAppBarActions.isNotEmpty
                ? additionalAppBarActions
                : [],
          ],
      shadowColor: Colors.transparent,
    );

// Widget defaultMoreButtonMaterialPopupContent(
//   BuildContext context,
// ) {
//   return BlocBuilder<LoginBloc, LoginState>(
//     builder: (context, loginState) {
//       return Padding(
//         padding: EdgeInsets.only(bottom: 30.0.h),
//         child: Column(
//           children: [
//             Container(
//               margin: EdgeInsets.only(top: 5.h, bottom: 15.h),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: 40.w,
//                     height: 6.h,
//                     decoration: BoxDecoration(
//                         color: Colors.grey[400],
//                         borderRadius: BorderRadius.circular(6)),
//                   ),
//                 ],
//               ),
//             ),
//             loginState.user != null
//                 ? Padding(
//                     padding: EdgeInsets.only(left: 16.0.w),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         AutoSizeText(
//                           'Vous êtes connecté en tant que : ${loginState.user!.phoneNumber}',
//                           maxLines: 1,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 18.0.sp,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 : const SizedBox(),
//             Divider(height: 20.h, thickness: 2.h),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 15.0.w),
//               child: Column(children: [
//                 ListTile(
//                   dense: true,
//                   title: Row(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(right: 10.w),
//                         child: Icon(
//                           Icons.notifications,
//                           color: Theme.of(context).textTheme.bodyText1!.color,
//                           size: 24.w,
//                         ),
//                       ),
//                       Text(
//                         'Mes notifications',
//                         style: TextStyle(fontSize: 16.sp),
//                       ),
//                     ],
//                   ),
//                   onTap: (() async {
//                     locator<NavigationService>()
//                         .navigateTo(NotificationsPage.routeName);
//                   }),
//                 ),
//                 ListTile(
//                   dense: true,
//                   title: Row(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(right: 10.w),
//                         child: Icon(
//                           Theme.of(context).brightness == Brightness.dark
//                               ? Icons.sunny
//                               : Icons.nightlight_round_rounded,
//                           color: Theme.of(context).textTheme.bodyText1!.color,
//                           size: 24.w,
//                         ),
//                       ),
//                       Text(
//                         Theme.of(context).brightness == Brightness.dark
//                             ? 'Changer le thème en clair'
//                             : 'Changer le thème en sombre',
//                         style: TextStyle(fontSize: 16.sp),
//                       ),
//                     ],
//                   ),
//                   onTap: () {
//                     var themeToApply =
//                         Theme.of(context).brightness == Brightness.dark
//                             ? ThemeMode.light
//                             : ThemeMode.dark;
//                     locator<LocalStorageService>().themeMode = themeToApply;
//                     context.read<ThemeCubit>().onChangeTheme(themeToApply);
//                     locator<NavigationService>().pop();
//                   },
//                 ),
//                 ListTile(
//                   dense: true,
//                   title: Row(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(right: 10.w),
//                         child: Icon(
//                           Icons.star_half,
//                           color: Colors.yellow[800],
//                           size: 24.w,
//                         ),
//                       ),
//                       Text(
//                         'Noter l\'application Faso Loto',
//                         style: TextStyle(fontSize: 16.sp),
//                       ),
//                     ],
//                   ),
//                   onTap: () {
//                     locator<NavigationService>().pop();
//                     rateApp(context, locator<RateMyApp>(),
//                         onGoodRating: ((rateMyApp) => rateMyApp.launchStore()));
//                   },
//                 ),
//                 ListTile(
//                   dense: true,
//                   onTap: () async {
//                     PackageInfo? packageInfo = await PackageInfo.fromPlatform();
//                     locator<NavigationService>().pop();
//                     // ignore: use_build_context_synchronously
//                     await showPlatformDialog<bool>(
//                       context: context,
//                       builder: (_) => PlatformAlertDialog(
//                         title: Column(
//                           children: [
//                             Text(
//                               packageInfo.appName,
//                               style: Theme.of(_).textTheme.headlineSmall,
//                             ),
//                             Text(
//                               '${packageInfo.version} - ${packageInfo.buildNumber}',
//                               style: Theme.of(_).textTheme.bodyMedium,
//                             ),
//                           ],
//                         ),
//                         content: SizedBox(
//                           height: 0.3.sh,
//                           child: Column(
//                             children: <Widget>[
//                               Text(
//                                 'Faso Loto est une application mise à la disposition de la population Burkinabè par la Loterie Nationale du Burkina.',
//                                 style: Theme.of(_).textTheme.bodyLarge,
//                               ),
//                               SizedBox(
//                                 height: 30.h,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Flexible(
//                                     child: GestureDetector(
//                                       child: Text(
//                                         "Application développée par KREEZUS, spécialiste en développement d'applications Web et Mobile.",
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                           fontSize: 12.sp,
//                                           fontWeight: FontWeight.w500,
//                                           color: Theme.of(_)
//                                               .textTheme
//                                               .caption!
//                                               .color,
//                                           decoration: TextDecoration.underline,
//                                         ),
//                                       ),
//                                       onTap: () async {
//                                         await launchUrl(Uri.parse(''),
//                                             mode:
//                                                 LaunchMode.externalApplication);
//                                       },
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         actions: [
//                           TextButton(
//                             child: const Text('Fermer'),
//                             onPressed: () {
//                               locator<NavigationService>().pop();
//                             },
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                   title: Row(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(right: 10.w),
//                         child: Icon(
//                           Icons.help_outline,
//                           color: Theme.of(context).textTheme.bodyText1!.color,
//                           size: 24.w,
//                         ),
//                       ),
//                       Text(
//                         'A propos de Faso Loto ...',
//                         style: TextStyle(fontSize: 16.sp),
//                       ),
//                     ],
//                   ),
//                 ),
//                 ListTile(
//                   dense: true,
//                   onTap: () async {
//                     var shouldLogout = await showPlatformDialog<bool>(
//                       context: context,
//                       builder: (_) => PlatformAlertDialog(
//                         title: const Text('Confirmation'),
//                         content: const Text(
//                             'Voulez vous vraiment vous déconnecter de Faso Loto ?'),
//                         actions: <Widget>[
//                           PlatformDialogAction(
//                             onPressed: () => Navigator.of(context).pop(false),
//                             child: const Text('Non'),
//                           ),
//                           PlatformDialogAction(
//                             onPressed: () => Navigator.of(context).pop(true),
//                             child: const Text(
//                               'Se déconnecter',
//                               style: TextStyle(color: Colors.red),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                     if (shouldLogout != null && shouldLogout) {
//                       context.read<LoginBloc>().add(const LogoutEvent());
//                     }
//                     locator<NavigationService>().pop();
//                   },
//                   title: Row(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(right: 10.w),
//                         child: Icon(
//                           Icons.logout,
//                           color: Colors.red,
//                           size: 24.w,
//                         ),
//                       ),
//                       Text(
//                         'Se déconnecter',
//                         style: TextStyle(
//                           color: Colors.red,
//                           fontSize: 16.sp,
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ]),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }

// Widget defaultMoreButtonCupertinoSheetContent(BuildContext context) {
//   return BlocBuilder<LoginBloc, LoginState>(
//     builder: (context, loginState) {
//       return CupertinoActionSheet(
//         title: Text(
//           'Vous êtes connecté en tant que : ${loginState.user!.phoneNumber}',
//           style: TextStyle(
//             fontSize: 18.0.sp,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         actions: [
//           CupertinoActionSheetAction(
//             isDestructiveAction: false,
//             onPressed: () {
//               var themeToApply = Theme.of(context).brightness == Brightness.dark
//                   ? ThemeMode.light
//                   : ThemeMode.dark;
//               locator<LocalStorageService>().themeMode = themeToApply;
//               context.read<ThemeCubit>().onChangeTheme(themeToApply);
//               locator<NavigationService>().pop();
//             },
//             child: Row(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(right: 10.w),
//                   child: Icon(
//                     Theme.of(context).brightness == Brightness.dark
//                         ? Icons.sunny
//                         : Icons.nightlight_round_rounded,
//                     color: Theme.of(context).textTheme.bodyText1!.color,
//                     size: 24.w,
//                   ),
//                 ),
//                 Text(
//                   Theme.of(context).brightness == Brightness.dark
//                       ? 'Changer le thème en clair'
//                       : 'Changer le thème en sombre',
//                   style: TextStyle(fontSize: 16.sp),
//                 ),
//               ],
//             ),
//           ),
//           CupertinoActionSheetAction(
//             isDestructiveAction: false,
//             onPressed: () {
//               locator<NavigationService>().pop();
//               rateApp(context, locator<RateMyApp>(),
//                   onGoodRating: ((rateMyApp) => rateMyApp.launchStore()));
//             },
//             child: Row(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(right: 10.w),
//                   child: Icon(
//                     Icons.star_half,
//                     color: Colors.yellow[800],
//                     size: 24.w,
//                   ),
//                 ),
//                 Text(
//                   'Noter l\'application Faso Loto',
//                   style: TextStyle(fontSize: 16.sp),
//                 ),
//               ],
//             ),
//           ),
//           CupertinoActionSheetAction(
//             isDestructiveAction: false,
//             onPressed: () async {
//               PackageInfo? packageInfo = await PackageInfo.fromPlatform();
//               locator<NavigationService>().pop();
//               // ignore: use_build_context_synchronously
//               await showPlatformDialog<bool>(
//                 context: context,
//                 builder: (_) => PlatformAlertDialog(
//                   title: Column(
//                     children: [
//                       Text(
//                         packageInfo.appName,
//                         style: Theme.of(_).textTheme.headlineSmall,
//                       ),
//                       Text(
//                         '${packageInfo.version} - ${packageInfo.buildNumber}',
//                         style: Theme.of(_).textTheme.bodyMedium,
//                       ),
//                     ],
//                   ),
//                   content: SizedBox(
//                     height: 0.3.sh,
//                     child: Column(
//                       children: <Widget>[
//                         Text(
//                           'Faso Loto est une application mise à la disposition de la population Burkinabè par la Loterie Nationale du Burkina.',
//                           style: Theme.of(_).textTheme.bodyLarge,
//                         ),
//                         SizedBox(
//                           height: 30.h,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Flexible(
//                               child: GestureDetector(
//                                 child: Text(
//                                   "Application développée par KREEZUS, spécialiste en développement d'applications Web et Mobile.",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.w500,
//                                     color: Theme.of(_).textTheme.caption!.color,
//                                     decoration: TextDecoration.underline,
//                                   ),
//                                 ),
//                                 onTap: () async {
//                                   await launchUrl(Uri.parse(''),
//                                       mode: LaunchMode.externalApplication);
//                                 },
//                               ),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   actions: [
//                     TextButton(
//                       child: const Text('Fermer'),
//                       onPressed: () {
//                         locator<NavigationService>().pop();
//                       },
//                     ),
//                   ],
//                 ),
//               );
//             },
//             child: Row(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(right: 10.w),
//                   child: Icon(
//                     Icons.help_outline,
//                     size: 30.w,
//                     color: Theme.of(context).textTheme.bodyMedium!.color,
//                   ),
//                 ),
//                 Text(
//                   'A propos de Faso Loto ...',
//                   style: TextStyle(fontSize: 16.sp),
//                 ),
//               ],
//             ),
//           ),
//           CupertinoActionSheetAction(
//             isDestructiveAction: true,
//             onPressed: () async {
//               var shouldLogout = await showPlatformDialog<bool>(
//                 context: context,
//                 builder: (_) => PlatformAlertDialog(
//                   title: const Text('Confirmation'),
//                   content: const Text(
//                       'Voulez vous vraiment vous déconnecter de Faso Loto ?'),
//                   actions: <Widget>[
//                     PlatformDialogAction(
//                       onPressed: () => Navigator.of(context).pop(false),
//                       child: const Text('Non'),
//                     ),
//                     PlatformDialogAction(
//                       onPressed: () => Navigator.of(context).pop(true),
//                       child: const Text(
//                         'Se déconnecter',
//                         style: TextStyle(color: Colors.red),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//               if (shouldLogout != null && shouldLogout) {
//                 locator<LocalStorageService>().logOut();
//                 context.read<LoginBloc>().add(const LogoutEvent());
//               }
//             },
//             child: Row(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(right: 10.w),
//                   child: Icon(
//                     Icons.logout,
//                     color: Colors.red,
//                     size: 30.w,
//                   ),
//                 ),
//                 Text(
//                   'Se déconnecter',
//                   style: TextStyle(fontSize: 16.sp),
//                 ),
//               ],
//             ),
//           )
//         ],
//         cancelButton: CupertinoActionSheetAction(
//           child: const Text('Annuler'),
//           onPressed: () {
//             locator<NavigationService>().pop();
//           },
//         ),
//       );
//     },
//   );
// }
