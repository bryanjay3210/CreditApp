import 'package:credit_app/view/login/components/circular_icon.dart';
import 'package:credit_app/view/login/components/login_header.dart';
import 'package:flutter/material.dart';

import 'components/login_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              LoginHeader(),
              LoginContainer(),
              CircularIcon(),
            ],
          ),
        ),
      ),
    );
  }
}
