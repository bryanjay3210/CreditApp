import 'package:credit_app/utility/const.dart';
import 'package:credit_app/view/login/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const LoginScreen(),
    );
  }
}
