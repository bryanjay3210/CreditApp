import 'package:credit_app/utility/const.dart';
import 'package:credit_app/view/register/cubit/register_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class RegisterContainer extends StatefulWidget {
  const RegisterContainer({super.key});

  @override
  State<RegisterContainer> createState() => _RegisterContainerState();
}

class _RegisterContainerState extends State<RegisterContainer> {
  final fullnameCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final registerKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 210, 20, 10),
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
                  Text(
                    'Register',
                    style:
                        GoogleFonts.montserrat(color: Colors.red, fontSize: 18),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: fullnameCtrl,
                    decoration: const InputDecoration(
                        hintText: 'Fullname',
                        prefixIcon: Icon(CupertinoIcons.person_alt)),
                    validator: (value) =>
                        value!.isEmpty ? 'Fullname is required' : null,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: addressCtrl,
                    decoration: const InputDecoration(
                        hintText: 'Address',
                        prefixIcon: Icon(CupertinoIcons.location_solid)),
                    validator: (value) =>
                        value!.isEmpty ? 'Address is required' : null,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: usernameCtrl,
                    decoration: const InputDecoration(
                        hintText: 'Username',
                        prefixIcon: Icon(CupertinoIcons.person_alt)),
                    validator: (value) =>
                        value!.isEmpty ? 'username is required' : null,
                  ),
                  // const SizedBox(height: 10),
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
                  const SizedBox(height: 20),
                  state.isLoading
                      ? Center(
                          child: LoadingAnimationWidget.staggeredDotsWave(
                              color: kDefaultColor, size: 40),
                        )
                      : Container(
                          width: double.infinity,
                          color: kDefaultColor,
                          child: TextButton(
                              onPressed: () {
                                if (registerKey.currentState!.validate()) {
                                  context
                                      .read<RegisterCubit>()
                                      .registerAccount(
                                          fullname: fullnameCtrl.text,
                                          address: addressCtrl.text,
                                          username: usernameCtrl.text,
                                          password: passwordCtrl.text)
                                      .then((value) {
                                    fullnameCtrl.clear();
                                    addressCtrl.clear();
                                    usernameCtrl.clear();
                                    passwordCtrl.clear();
                                    context.pop();
                                  });
                                }
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    color: kDefaultColor,
                    child: TextButton(
                        onPressed: () => context.pop(),
                        child: const Text(
                          'Cancel',
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
