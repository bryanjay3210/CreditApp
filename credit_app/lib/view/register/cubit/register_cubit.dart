import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bloc/bloc.dart';
import 'package:credit_app/models/account.dart';
import 'package:credit_app/utility/toast.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit()
      : super(const RegisterState(
            fullname: '',
            address: '',
            username: '',
            password: '',
            isLoading: false,
            isShow: false));

  Future<void> registerAccount(
      {required BuildContext context,
      required String fullname,
      required String address,
      required String username,
      required String password,
      File? img}) async {
    emit(state.copyWith(isLoading: true));
    final box = Hive.box('account');
    var uuid = const Uuid();

    box.add(Account(
        fullname: fullname,
        address: address,
        username: username,
        password: password,
        userId: uuid.v1(),
        imageBase64: img?.readAsBytesSync()));
    showSnackBar(
        context: context,
        title: 'Success',
        message: 'Successfully Registered!',
        contentType: ContentType.success);

    emit(state.copyWith(isLoading: false));
  }

  void toggleIsShow({required bool value}) {
    emit(state.copyWith(isShow: value));
  }
}
