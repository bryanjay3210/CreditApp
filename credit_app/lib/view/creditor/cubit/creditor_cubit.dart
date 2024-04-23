import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bloc/bloc.dart';
import 'package:credit_app/helper/auth.dart';
import 'package:credit_app/models/creditor.dart';
import 'package:credit_app/utility/toast.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

part 'creditor_state.dart';

class CreditorCubit extends Cubit<CreditorState> {
  CreditorCubit()
      : super(const CreditorState(
            isLoading: false, inSearch: false, creditorList: []));

  Future<void> getCreditor() async {
    emit(state.copyWith(isLoading: true, creditorList: []));
    List<Creditor> creditorList = [];
    final box = Hive.box('creditor');
    for (var ds in box.values.toList()) {
      Creditor cred = ds as Creditor;
      if (cred.userId == GetIt.I<AuthHelper>().userId) {
        creditorList.add(cred);
      }
    }
    emit(state.copyWith(isLoading: false, creditorList: creditorList));
  }

  Future<void> deleteCreditor(
      {required creditorId, required BuildContext context}) async {
    var creditor = Hive.box('creditor')
        .values
        .toList()
        .where((element) => element.creditorId == creditorId)
        .first;
    creditor.delete();
    showSnackBar(
        context: context,
        title: 'Success',
        message: 'Successfully deleted!',
        contentType: ContentType.success);
  }

  void toogleSearch({required bool value}) {
    emit(state.copyWith(inSearch: value));
  }

  Future<void> searchCreditor(String value) async {
    emit(state.copyWith(creditorList: [], isLoading: true));
    List<Creditor> creditorList = [];
    final box = Hive.box('creditor');
    var creditors = box.values.toList().where((element) => element.fullname
        .toString()
        .toLowerCase()
        .contains(value.toLowerCase()));
    for (var ds in creditors) {
      Creditor cred = ds as Creditor;
      if (cred.userId == GetIt.I<AuthHelper>().userId) {
        creditorList.add(cred);
      }
    }
    emit(state.copyWith(isLoading: false, creditorList: creditorList));
  }
}
