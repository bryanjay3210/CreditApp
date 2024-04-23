import 'package:credit_app/routes/route_constant.dart';
import 'package:credit_app/view/adjustment/adjustment.dart';
import 'package:credit_app/view/credit/credit.dart';
import 'package:credit_app/view/creditor/creditor.dart';
import 'package:credit_app/view/creditor_information/creditor_information.dart';
import 'package:credit_app/view/drawer/drawer.dart';
import 'package:credit_app/view/login/login.dart';
import 'package:credit_app/view/menu/menu.dart';
import 'package:credit_app/view/register/register.dart';
import 'package:credit_app/view/transaction/transaction.dart';
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
          return const CupertinoPage(child: DrawerScreen());
        },
      ),
      GoRoute(
        name: RouteConstants.credit,
        path: '/credit',
        pageBuilder: (context, state) {
          return CupertinoPage(
              child: CreditScreen(
            creditorName: state.extra.toString(),
          ));
        },
      ),
      GoRoute(
        name: RouteConstants.creditor,
        path: '/creditor',
        pageBuilder: (context, state) {
          return const CupertinoPage(child: CreditorScreen());
        },
      ),
      GoRoute(
        name: RouteConstants.menu,
        path: '/menu',
        pageBuilder: (context, state) {
          return const CupertinoPage(child: MenuScreen());
        },
      ),
      GoRoute(
        name: RouteConstants.adjustment,
        path: '/adjustment',
        pageBuilder: (context, state) {
          return const CupertinoPage(child: AdjustmentScreen());
        },
      ),
      GoRoute(
        name: RouteConstants.register,
        path: '/register',
        pageBuilder: (context, state) {
          return const CupertinoPage(child: RegisterScreen());
        },
      ),
      GoRoute(
        name: RouteConstants.transactionHistory,
        path: '/transactionHistory',
        pageBuilder: (context, state) {
          return const CupertinoPage(child: TransactionHistoryScreen());
        },
      ),
      GoRoute(
        name: RouteConstants.creditorInformation,
        path: '/creditorInformation',
        pageBuilder: (context, state) {
          return const CupertinoPage(child: CreditorInformation());
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
