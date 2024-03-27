import 'package:credit_app/view/profile/components/profile_container.dart';
import 'package:credit_app/view/profile/components/profile_header.dart';
import 'package:credit_app/view/profile/cubit/profile_cubit.dart';
import 'package:credit_app/view/register/components/profile_avatar.dart';
import 'package:credit_app/view/register/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<ProfileCubit>().initProfile();
    context.read<RegisterCubit>().initAccount();
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
