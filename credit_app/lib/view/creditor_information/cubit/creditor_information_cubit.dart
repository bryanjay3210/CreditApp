import 'dart:typed_data';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bloc/bloc.dart';
import 'package:credit_app/enum/gender.dart';
import 'package:credit_app/helper/auth.dart';
import 'package:credit_app/helper/creditor.dart';
import 'package:credit_app/models/creditor.dart';
import 'package:credit_app/utility/toast.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'creditor_information_state.dart';

class CreditorInformationCubit extends Cubit<CreditorInformationState> {
  CreditorInformationCubit()
      : super(const CreditorInformationState(
            gender: Gender.Male, isLoading: false, base64Image: null));

  void initData() {
    emit(state.copyWith(
        isLoading: false, base64Image: null, gender: Gender.Male));
  }

  Future<void> addCreditor(
      {required String fullname,
      required String address,
      required String contactNo,
      required String emailAddress,
      required BuildContext context}) async {
    emit(state.copyWith(isLoading: true));
    Future.delayed(
      const Duration(seconds: 2),
      () {
        final box = Hive.box('creditor');
        var uuid = const Uuid();
        box.add(Creditor(
            fullname: fullname,
            userId: GetIt.I<AuthHelper>().userId,
            creditorId: uuid.v1(),
            totalBalance: 0,
            gender: state.gender.toString(),
            address: address,
            contactNo: contactNo,
            emailAddress: emailAddress,
            base64Image: GetIt.I<CreditorHelper>().base64Image));
        showSnackBar(
            context: context,
            title: 'Success',
            message: 'Creditor has been added!',
            contentType: ContentType.success);
        emit(state.copyWith(isLoading: false, base64Image: null));
        GetIt.I<CreditorHelper>().base64Image = null;
        context.pop();
      },
    );
  }

  void changeGender(Gender gender) {
    emit(state.copyWith(gender: gender));
  }

  Future<void> setImage({required Uint8List base64Image}) async {
    emit(state.copyWith(isLoading: true));
    emit(state.copyWith(isLoading: false, base64Image: base64Image));
    GetIt.I<CreditorHelper>().base64Image = base64Image;
  }
}
