import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:sippy/router/app_route.dart';
import 'package:sippy/router/router_observer.dart';
import 'package:sippy/utils/locator.dart';
import 'package:sippy/utils/theme.dart';

void main() async{   
   WidgetsFlutterBinding.ensureInitialized();
      await locatorSetup();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
    static final appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return   ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        ensureScreenSize: true,
        builder: (context, child) {

          return OverlaySupport.global(
            child: MaterialApp(
              title: 'SIPPY',
              theme: AppTheme.light(material3: true),
              debugShowCheckedModeBanner: true,
              home: Builder(
                builder: (context) {
                  
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                        // textScaler: TextScaler.noScaling,
                        ),
                    child: Router(
                      routerDelegate: AutoRouterDelegate(
                        appRouter,
                        navigatorObservers: () => [
                          AppRouterObserver(),
                        ],
                      ),
                      routeInformationParser: appRouter.defaultRouteParser(),
                      routeInformationProvider: appRouter.routeInfoProvider(),
                      backButtonDispatcher: RootBackButtonDispatcher(),
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}

