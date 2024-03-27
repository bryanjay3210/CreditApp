import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bloc/bloc.dart';
import 'package:credit_app/helper/auth.dart';
import 'package:credit_app/models/account.dart';
import 'package:credit_app/routes/route_constant.dart';
import 'package:credit_app/utility/toast.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
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
    Future.delayed(
      const Duration(seconds: 2),
      () {
        try {
          final accountBox = Hive.box('account');
          var accountList = accountBox.values.toList();
          var acct = accountList
              .where((element) => element.username == username)
              .first as Account;
          if (acct.username == username && acct.password == password) {
            GetIt.I<AuthHelper>().userId = acct.userId;
            GetIt.I<AuthHelper>().account = acct;
            context.pushNamed(RouteConstants.dashboard);
          } else {
            showSnackBar(
                context: context,
                title: 'Error',
                message: 'Invalid username or password!',
                contentType: ContentType.failure);
          }
        } catch (e) {
          showSnackBar(
              context: context,
              title: 'Warning',
              message: 'User is not yet register!',
              contentType: ContentType.warning);
          emit(state.copyWith(isLoading: false));
        }
        emit(state.copyWith(isLoading: false));
      },
    );
  }

  void toggleIsShow({required bool value}) {
    emit(state.copyWith(isShow: value));
  }
}
