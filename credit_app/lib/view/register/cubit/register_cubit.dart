import 'dart:typed_data';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bloc/bloc.dart';
import 'package:credit_app/helper/auth.dart';
import 'package:credit_app/models/account.dart';
import 'package:credit_app/utility/toast.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
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

  void initCubit() {
    emit(state.copyWith(
        fullname: '',
        address: '',
        username: '',
        password: '',
        isLoading: false,
        isShow: false,
        base64Image: null));
  }

  Future<void> registerAccount(
      {required BuildContext context,
      required String fullname,
      required String address,
      required String username,
      required String password,
      Uint8List? img}) async {
    emit(state.copyWith(isLoading: true));
    Future.delayed(
      const Duration(seconds: 2),
      () {
        final accountBox = Hive.box('account');
        var uuid = const Uuid();

        accountBox.add(Account(
            fullname: fullname,
            address: address,
            username: username,
            password: password,
            userId: uuid.v1(),
            imageBase64: img));
        showSnackBar(
            context: context,
            title: 'Success',
            message: 'Successfully Registered!',
            contentType: ContentType.success);

        emit(state.copyWith(isLoading: false, base64Image: img));
      },
    );
  }

  Future<void> setImage({required Uint8List base64Image}) async {
    emit(state.copyWith(isLoading: true));
    emit(state.copyWith(isLoading: false, base64Image: base64Image));
  }

  Future<void> getImage() async {
    emit(state.copyWith(
        base64Image: GetIt.I<AuthHelper>().account?.imageBase64));
  }

  void toggleIsShow() {
    emit(state.copyWith(isShow: !state.isShow));
  }
}
