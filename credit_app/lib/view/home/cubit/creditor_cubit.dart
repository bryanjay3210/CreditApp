import 'package:bloc/bloc.dart';
import 'package:credit_app/models/creditor.dart';
import 'package:credit_app/utility/logger.dart';
import 'package:credit_app/utility/toast.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

part 'creditor_state.dart';

class CreditorCubit extends Cubit<CreditorState> {
  CreditorCubit()
      : super(const CreditorState(isLoading: false, creditorList: []));

  void addCreditor({required String fullname, required BuildContext context}) {
    final box = Hive.box('creditor');

    box.add(Creditor(fullname: fullname));
    logThis(text: box.length.toString());
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
      creditorList.add(cred);
    }
    logThis(text: box.length.toString());
    emit(state.copyWith(isLoading: false, creditorList: creditorList));
  }
}
