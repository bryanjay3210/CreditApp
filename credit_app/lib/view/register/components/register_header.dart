import 'package:credit_app/utility/const.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegisterHeader extends StatefulWidget {
  const RegisterHeader({super.key});

  @override
  State<RegisterHeader> createState() => _RegisterHeaderState();
}

class _RegisterHeaderState extends State<RegisterHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 10), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Lottie.asset('assets/registration.json')
          ],
        ),
      ),
    );
  }
}
