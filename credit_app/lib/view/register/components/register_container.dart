import 'package:credit_app/utility/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterContainer extends StatefulWidget {
  const RegisterContainer({super.key});

  @override
  State<RegisterContainer> createState() => _RegisterContainerState();
}

class _RegisterContainerState extends State<RegisterContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 210, 20, 10),
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 500,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              'Register',
              style: GoogleFonts.montserrat(color: Colors.red, fontSize: 18),
            ),
            const SizedBox(height: 30),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Fullname',
                  prefixIcon: Icon(CupertinoIcons.person_alt)),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Address',
                  prefixIcon: Icon(CupertinoIcons.location_solid)),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Username',
                  prefixIcon: Icon(CupertinoIcons.person_alt)),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(CupertinoIcons.padlock_solid)),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              color: kDefaultColor,
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              color: kDefaultColor,
              child: TextButton(
                  onPressed: () => context.pop(),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
