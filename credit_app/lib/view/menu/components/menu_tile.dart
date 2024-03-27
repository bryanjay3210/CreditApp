import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MenuTile extends StatelessWidget {
  final Color tileColor;
  final String title;
  final String? description;
  final VoidCallback func;
  final String lottieUrl;
  const MenuTile({
    super.key,
    required this.tileColor,
    required this.title,
    required this.func,
    this.description,
    required this.lottieUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        decoration: BoxDecoration(
          color: tileColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 180,
              child: Lottie.asset(lottieUrl),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
