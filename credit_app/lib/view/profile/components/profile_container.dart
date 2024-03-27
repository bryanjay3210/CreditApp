import 'package:credit_app/helper/auth.dart';
import 'package:credit_app/utility/const.dart';
import 'package:credit_app/view/profile/cubit/profile_cubit.dart';
import 'package:credit_app/view/register/cubit/register_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ProfileContainer extends StatefulWidget {
  const ProfileContainer({super.key});

  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  final fullnameCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final registerKey = GlobalKey<FormState>();

  @override
  void initState() {
    fullnameCtrl.text = GetIt.I<AuthHelper>().account!.fullname;
    addressCtrl.text = GetIt.I<AuthHelper>().account!.address;
    usernameCtrl.text = GetIt.I<AuthHelper>().account!.username;
    passwordCtrl.text = GetIt.I<AuthHelper>().account!.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 250, 20, 10),
      child: Form(
        key: registerKey,
        child: Container(
          padding: const EdgeInsets.all(20),
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
          child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return Column(
                children: [
                  const SizedBox(height: 30),
                  TextFormField(
                    readOnly: true,
                    controller: fullnameCtrl,
                    decoration: const InputDecoration(
                        hintText: 'Name',
                        prefixIcon: Icon(CupertinoIcons.person_alt)),
                    validator: (value) =>
                        value!.isEmpty ? 'Name is required' : null,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    readOnly: true,
                    controller: addressCtrl,
                    decoration: const InputDecoration(
                        hintText: 'Address',
                        prefixIcon: Icon(CupertinoIcons.location_solid)),
                    validator: (value) =>
                        value!.isEmpty ? 'Address is required' : null,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    readOnly: true,
                    controller: usernameCtrl,
                    decoration: const InputDecoration(
                        hintText: 'Username',
                        prefixIcon: Icon(CupertinoIcons.person_alt)),
                    validator: (value) =>
                        value!.isEmpty ? 'username is required' : null,
                  ),
                  TextFormField(
                    controller: passwordCtrl,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(CupertinoIcons.padlock_solid),
                        suffix: IconButton(
                            onPressed: () => context
                                .read<RegisterCubit>()
                                .toggleIsShow(value: !state.isShow),
                            icon: Icon(state.isShow
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined))),
                    validator: (value) =>
                        value!.isEmpty ? 'Password is required' : null,
                    obscureText: !state.isShow ? true : false,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    color: kPrimaryColor,
                    child: TextButton(
                        onPressed: () => context
                            .read<ProfileCubit>()
                            .updateProfile(
                                context: context,
                                password: passwordCtrl.text,
                                imageBase64: state.base64Image!),
                        child: const Text(
                          'Update Profile',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    color: kPrimaryColor,
                    child: TextButton(
                        onPressed: () =>
                            context.read<ProfileCubit>().logout(context),
                        child: const Text(
                          'Logout',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
