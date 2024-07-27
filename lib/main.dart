import 'dart:async';
import 'dart:io';

import 'package:e_commerce_project/firebase_options.dart';
import 'package:e_commerce_project/router.dart';
import 'package:e_commerce_project/screens/admin/repositories/product_repository.dart';
import 'package:e_commerce_project/screens/auth/auth_bloc/auth_bloc.dart';
import 'package:e_commerce_project/screens/onbording/views/views.dart';
import 'package:e_commerce_project/screens/product_list/product_list_bloc/product_list_bloc.dart';
import 'package:e_commerce_project/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/constant.dart';
import 'errors/no_connection_page.dart';
import 'global_app/global_app.dart';
import 'loader_overlay.dart';
import 'notification_service.dart';
import 'screens/auth/repositories/repositories.dart';
import 'services/services.dart';
import 'spin_kit_wave.dart';
import 'theme/cubit/theme_cubit.dart';
import 'theme/theme.dart';
import 'utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else if (Platform.isIOS) {
    await Firebase.initializeApp();
  }
  await setupLocator();

  if (kDebugMode) {
    Zone.root.runGuarded(() async {
      try {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
            .then((value) => runApp(_buildApp()));
      } catch (error, stackTrace) {
        logger.e('Uncaught error: $error, StackTrace: $stackTrace');
        locator<NavigationService>().replaceWith(NoConnectionPage.routeName);
      }
    });
    Bloc.observer = SimpleBlocObserver();
  } else {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
      (value) => runApp(
        _buildApp(),
      ),
    );
  }
}

Widget _buildApp() {
  return const EcommerceApp();
}

class EcommerceApp extends StatefulWidget {
  const EcommerceApp({Key? key}) : super(key: key);

  @override
  State<EcommerceApp> createState() => _EcommerceState();
}

class _EcommerceState extends State<EcommerceApp> {
  late final String? token;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const title = 'Shoppy';

    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthRepository>(
            create: (context) => locator<AuthRepository>(),
          ),
          RepositoryProvider<ProductRepository>(
            create: (context) => locator<ProductRepository>(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(create: (context) {
              var authBloc = AuthBloc();

              return authBloc;
            }),
            BlocProvider<ProductListBloc>(
              create: (context) => ProductListBloc(),
            ),
            BlocProvider<GlobalAppCubit>(
              create: (context) {
                return locator<GlobalAppCubit>();
              },
            ),
            BlocProvider(
              create: (context) {
                var defaultThemode = locator<LocalStorageService>().themeMode;
                switch (defaultThemode) {
                  case ThemeMode.system:
                    return ThemeCubit(ThemeSystem(
                        themeBrightness: Theme.of(context).brightness));
                  case ThemeMode.light:
                    return ThemeCubit(const ThemeLight());
                  case ThemeMode.dark:
                    return ThemeCubit(const ThemeDark());
                  default:
                    return ThemeCubit(const ThemeSystem());
                }
              },
            ),
          ],
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (_, themeState) {
              return ScreenUtilInit(
                // https://yesviz.com/devices/iphone-12-pro/
                designSize: const Size(390, 844), // based on Iphone 12 Pro
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (_, child) {
                  return GlobalLoaderOverlay(
                    useDefaultLoading: false,
                    overlayWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SpinKitWave(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? kPrimaryColor.withOpacity(0.95)
                                  : Colors.grey,
                          duration: const Duration(milliseconds: 900),
                          size: 0.2.sw,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          'Traitement en cours... Veuillez patienter SVP !',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    child: MaterialApp(
                      navigatorKey: locator<NavigationService>().navigationKey,
                      theme: Theme.of(context).brightness == Brightness.dark
                          ? darkTheme()
                          : lightTheme(),
                      darkTheme: darkTheme(),
                      themeMode: themeState.themeMode,
                      title: title,
                      debugShowCheckedModeBanner: false,
                      scaffoldMessengerKey: notificationServiceSnackBarKey,
                      onGenerateRoute: generateRoute,
                      initialRoute: OnBordingScreen.routeName,
                      builder: (context, child) {
                        return MultiBlocListener(
                          listeners: [
                            BlocListener<GlobalAppCubit, GlobalAppState>(
                              listener: (listenerContext, state) async {
                                if (state is GlobalAppLoadingStarted) {
                                  listenerContext.loaderOverlay.show();
                                } else {
                                  listenerContext.loaderOverlay.hide();
                                }
                              },
                            ),
                          ],
                          child: child ?? const CircularProgressIndicator(),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ));
  }
}
