import 'package:credit_app/routes/route_constant.dart';
import 'package:credit_app/view/login/cubit/login_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../utility/const.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({
    super.key,
  });

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 250, 20, 30),
      child: Form(
        key: loginKey,
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Container(
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
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Text(
                    'Login',
                    style:
                        GoogleFonts.montserrat(color: Colors.red, fontSize: 18),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: usernameCtrl,
                    decoration: const InputDecoration(
                        hintText: 'Username',
                        prefixIcon: Icon(CupertinoIcons.person_alt)),
                    validator: (value) =>
                        value!.isEmpty ? 'Username is required' : null,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: passwordCtrl,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(CupertinoIcons.padlock_solid),
                        suffix: IconButton(
                            onPressed: () => context
                                .read<LoginCubit>()
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
                                if (loginKey.currentState!.validate()) {
                                  context.read<LoginCubit>().authenticate(
                                      username: usernameCtrl.text,
                                      password: passwordCtrl.text,
                                      context: context);
                                }
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                  const SizedBox(height: 10),
                  const Text('or'),
                  IconButton(
                      onPressed: () {},
                      icon: const Column(
                        children: [
                          Icon(
                            Icons.fingerprint,
                            size: 30,
                          ),
                          Text('Fingerprint Login')
                        ],
                      )),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Not yet registered? '),
                      GestureDetector(
                        onTap: () => context.pushNamed(RouteConstants.register),
                        child: const Text(
                          'Click here',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
