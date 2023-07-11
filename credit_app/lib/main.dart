import 'package:credit_app/bootstrap.dart';
import 'package:credit_app/routes/app_routes.dart';
import 'package:credit_app/view/login/cubit/login_cubit.dart';
import 'package:credit_app/view/register/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bootstrap().initializeHive();
  Bootstrap().getItRegister();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterCubit>(
          create: (BuildContext context) => RegisterCubit(),
        ),
        BlocProvider<LoginCubit>(
          create: (BuildContext context) => LoginCubit(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Credit App',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.red,
            ),
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.white,
            textTheme:
                GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)),
        debugShowCheckedModeBanner: false,
        routeInformationParser:
            GetIt.I<AppRoutes>().routes.routeInformationParser,
        routerDelegate: GetIt.I<AppRoutes>().routes.routerDelegate,
      ),
    );
  }
}
