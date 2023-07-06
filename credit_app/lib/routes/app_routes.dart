import 'package:credit_app/routes/route_constant.dart';
import 'package:credit_app/view/dashboard/dashboard.dart';
import 'package:credit_app/view/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        name: RouteConstants.login,
        path: '/',
        pageBuilder: (context, state) {
          return const CupertinoPage(child: LoginScreen());
        },
      ),
      GoRoute(
        name: RouteConstants.dashboard,
        path: '/dashboard',
        pageBuilder: (context, state) {
          return const CupertinoPage(child: DashboardScreen());
        },
      ),
    ],
    redirect: (context, state) async {
      return null;
      // bool isAuthenticated = false;
      // if (!isAuthenticated) {
      //   return state.namedLocation(RouteConstants.login);
      // }
    },
    // errorPageBuilder: (context, state) {
    //   // return NoTransitionPage(child: NotFoundPage());
    // },
  );
}
