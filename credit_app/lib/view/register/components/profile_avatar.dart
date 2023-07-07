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
            child: Icon(Icons.person, color: Colors.red, size: 40),
          ),
        ],
      ),
    );
  }
}
