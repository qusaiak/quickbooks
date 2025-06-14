import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/authentication/presentation/pages/forgot_password_page.dart';
import '../../features/authentication/presentation/pages/login_page.dart';
import '../../features/authentication/presentation/pages/register_page.dart';
import '../../features/authentication/presentation/pages/reset_password_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../injection_container.dart';
import 'route_animation.dart';

abstract class AppRouter {
  //
  static const kOnboardingPage = '/onboarding';
  static const kLoginPage = '/login';
  static const kRegisterPage = '/register';
  static const kForgotPasswordPage = 'forgot_password';
  static const kResetPasswordPage = 'reset_password';

  //
  static const kHomePage = '/home';
  static const kSearchPage = '/search';
  static const kBookingsPage = '/bookings';
  static const kCalendarPage = '/calendar';


  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorHome =
  GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _rootNavigatorSearch =
  GlobalKey<NavigatorState>(debugLabel: 'shellSearch');
  static final _rootNavigatorBookings =
  GlobalKey<NavigatorState>(debugLabel: 'shellBookings');
  static final _rootNavigatorCalendar =
  GlobalKey<NavigatorState>(debugLabel: 'shellCalendar');

  static bool _splashScreenShown = false;

  static final router = GoRouter(
    debugLogDiagnostics: true,
    observers: [
      MyNavigatorObserver(),
    ],
    initialLocation: '/',
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          _splashScreenShown = true;
          return const MaterialPage(child: SplashPage());
        },
      ),
      GoRoute(
        path: kOnboardingPage,
        pageBuilder: (context, state) {
          _splashScreenShown = true;
          return const MaterialPage(child: OnboardingPage());
        },
      ),
      GoRoute(
        path: kLoginPage,
        pageBuilder: (context, state) {
          _splashScreenShown = true;
          return const MaterialPage(child: LoginPage());
        },
        routes: [
          GoRoute(
            path: kForgotPasswordPage,
            pageBuilder: (context, state) => slideTransitionHorizontal(
              const ForgotPasswordPage(),
            ),
            routes: [
              GoRoute(
                path: "$kResetPasswordPage/:gsm",
                pageBuilder: (context, state) => slideTransitionHorizontal(
                  ResetPasswordPage(state.pathParameters['gsm'].toString()),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: kRegisterPage,
        pageBuilder: (context, state) =>
            slideTransitionHorizontal(const RegisterPage()),
      ),
      // StatefulShellRoute.indexedStack(
      //   builder: (context, state, navigationShell) {
      //     return BasePage(
      //       navigationShell: navigationShell,
      //     );
      //   },
      //   branches: <StatefulShellBranch>[
      //     // Branch Home
      //     StatefulShellBranch(
      //       navigatorKey: _rootNavigatorHome,
      //       routes: [
      //         // GoRoute(
      //         //   path: kHomePage,
      //         //   pageBuilder: (context, state) => slideTransitionHorizontal(
      //         //     HomePage(
      //         //       key: state.pageKey,
      //         //     ),
      //         //   ),
      //         // ),
      //       ],
      //     ),
      //
      //     // Branch Search
      //     StatefulShellBranch(
      //       navigatorKey: _rootNavigatorSearch,
      //       routes: [
      //         GoRoute(
      //           path: kSearchPage,
      //           pageBuilder: (context, state) => slideTransitionHorizontal(
      //             SearchPage(
      //               key: state.pageKey,
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //
      //     // Branch Bookings
      //     StatefulShellBranch(
      //       navigatorKey: _rootNavigatorBookings,
      //       routes: [
      //         GoRoute(
      //           path: kBookingsPage,
      //           pageBuilder: (context, state) => slideTransitionHorizontal(
      //             BookingsPage(
      //               key: state.pageKey,
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //
      //     // Branch Calendar
      //     StatefulShellBranch(
      //       navigatorKey: _rootNavigatorCalendar,
      //       routes: [
      //         GoRoute(
      //           path: kCalendarPage,
      //           pageBuilder: (context, state) => slideTransitionHorizontal(
      //             CalendarPage(
      //               key: state.pageKey,
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    ],
    redirect: (context, state) {
      debugPrint(state.fullPath);
      if (!_splashScreenShown) {
        return null;
      }
      if (isOnboarding == 'No data found!') {
        return kOnboardingPage;
      }
      if (sessionId == 'No data found!' && state.fullPath == kHomePage) {
        return kLoginPage;
      }
      return null;
    },
  );

  static String returnFullPath() {
    return AppRouter.router.state.fullPath!;
  }
}

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('did push route $route');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('did pop route $route');
  }
}
