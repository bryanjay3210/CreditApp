import 'package:credit_app/view/register/components/profile_avatar.dart';
import 'package:credit_app/view/register/components/register_container.dart';
import 'package:credit_app/view/register/components/register_header.dart';
import 'package:credit_app/view/register/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    context.read<RegisterCubit>().initCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            RegisterHeader(),
            RegisterContainer(),
            ProfileAvatar(height: 240),
          ],
        ),
      ),
    );
  }
}
