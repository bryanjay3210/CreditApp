import 'package:credit_app/view/profile/components/profile_container.dart';
import 'package:credit_app/view/profile/components/profile_header.dart';
import 'package:credit_app/view/register/components/profile_avatar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              ProfileHeader(),
              ProfileContainer(),
              ProfileAvatar(
                height: 210,
              )
            ],
          ),
        ),
      ),
    );
  }
}
