import 'package:bloc/bloc.dart';
import 'package:credit_app/helper/auth.dart';
import 'package:credit_app/models/creditor.dart';
import 'package:credit_app/utility/toast.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'creditor_state.dart';

class CreditorCubit extends Cubit<CreditorState> {
  CreditorCubit()
      : super(const CreditorState(isLoading: false, creditorList: []));

  void addCreditor({required String fullname, required BuildContext context}) {
    final box = Hive.box('creditor');
    var uuid = const Uuid();
    box.add(Creditor(
        fullname: fullname,
        userId: GetIt.I<AuthHelper>().userId,
        creditorId: uuid.v1(),
        totalBalance: 0));
    getCreditor();
    context.pop();
    showToast(text: 'Success!');
  }

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
