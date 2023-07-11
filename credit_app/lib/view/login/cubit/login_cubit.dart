import 'package:bloc/bloc.dart';
import 'package:credit_app/models/account.dart';
import 'package:credit_app/routes/route_constant.dart';
import 'package:credit_app/utility/toast.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState(isLoading: false, isShow: false));

  Future<void> authenticate(
      {required String username,
      required String password,
      required BuildContext context}) async {
    emit(state.copyWith(isLoading: true));

    final box = Hive.box('account');
    var accountList = box.values.toList();

    for (var ds in accountList) {
      Account acct = ds as Account;
      if (acct.username == username && acct.password == password) {
        context.replaceNamed(RouteConstants.dashboard);
      } else {
        showToast(text: 'Invalid username & password!');
      }
    }
    emit(state.copyWith(isLoading: false));
  }

  void toggleIsShow({required bool value}) {
    emit(state.copyWith(isShow: value));
  }
}
