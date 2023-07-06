import 'package:credit_app/routes/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utility/const.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 250, 20, 10),
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 450,
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
              'Login',
              style: GoogleFonts.montserrat(color: Colors.red, fontSize: 18),
            ),
            const SizedBox(height: 30),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Username'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              color: kDefaultColor,
              child: TextButton(
                  onPressed: () {
                    context.pushNamed(RouteConstants.dashboard);
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            const SizedBox(height: 10),
            const Text('or'),
            IconButton(
                onPressed: () {},
                icon: const Column(
                  children: [
                    Icon(
                      Icons.fingerprint,
                      size: 30,
                    ),
                    Text('Fingerprint Login')
                  ],
                )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Not yet registered? '),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Click here',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
