import 'package:credit_app/routes/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: ElevatedButton(
                  onPressed: () => context.pushNamed(RouteConstants.login),
                  child: const Text('Logout')),
            )),
      ),
    );
  }
}
