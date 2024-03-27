import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:credit_app/routes/route_constant.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState(image: null, isShow: false));

  void logout(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext dialogcontext) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are your sure your want to logout?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              dialogcontext.pop();
              dialogcontext.pushReplacementNamed(RouteConstants.login);
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () => dialogcontext.pop(),
            child: const Text('No'),
          ),
        ],
      ),
    );
  }

  void toggleIsShow({required bool value}) {
    emit(state.copyWith(isShow: value));
  }
}
