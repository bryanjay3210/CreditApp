import 'dart:typed_data';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bloc/bloc.dart';
import 'package:credit_app/helper/auth.dart';
import 'package:credit_app/models/account.dart';
import 'package:credit_app/routes/route_constant.dart';
import 'package:credit_app/utility/toast.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState(isShow: false));

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

  Future<void> updateProfile(
      {required BuildContext context,
      required String? password,
      required Uint8List imageBase64}) async {
    final accountBox = Hive.box('account');
    var accountList = accountBox.values.toList();
    var account = accountList
        .where((element) => element.userId == GetIt.I<AuthHelper>().userId)
        .first as Account;
    account.password = password ?? GetIt.I<AuthHelper>().account!.password;
    account.imageBase64 = imageBase64;
    account.save();
    showSnackBar(
        context: context,
        title: 'Success',
        message: 'Profile is up to date!',
        contentType: ContentType.success);
  }

  void toggleIsShow({required bool value}) {
    emit(state.copyWith(isShow: value));
  }
}
