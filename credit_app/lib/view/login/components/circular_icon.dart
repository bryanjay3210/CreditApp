import 'package:credit_app/utility/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 260,
          ),
          CircleAvatar(
            radius: 40,
            child:
                Icon(CupertinoIcons.person_alt, color: kPrimaryColor, size: 40),
          ),
        ],
      ),
    );
  }
}
