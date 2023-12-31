import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: const Color(0xffE13245),
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
            SizedBox(
                height: 160,
                width: 200,
                child: Image.asset('assets/credit.png')),
            Text(
              'Welcome to Credit App!',
              style: GoogleFonts.montserrat(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
