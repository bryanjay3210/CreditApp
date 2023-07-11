import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({super.key});

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(
            height: 170,
          ),
          CircleAvatar(
            radius: 40,
            child: Icon(CupertinoIcons.person_alt, color: Colors.red, size: 40),
          ),
        ],
      ),
    );
  }
}
