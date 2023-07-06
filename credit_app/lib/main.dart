import 'package:credit_app/bootstrap.dart';
import 'package:credit_app/routes/app_routes.dart';
import 'package:credit_app/utility/const.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bootstrap().getItRegister();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Credit App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: kDefaultColor,
          ),
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)),
      debugShowCheckedModeBanner: false,
      routeInformationParser:
          GetIt.I<AppRoutes>().routes.routeInformationParser,
      routerDelegate: GetIt.I<AppRoutes>().routes.routerDelegate,
    );
  }
}
