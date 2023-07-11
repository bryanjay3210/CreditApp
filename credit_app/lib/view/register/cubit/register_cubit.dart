import 'package:bloc/bloc.dart';
import 'package:credit_app/models/account.dart';
import 'package:credit_app/utility/logger.dart';
import 'package:credit_app/utility/toast.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit()
      : super(const RegisterState(
            fullname: '',
            address: '',
            username: '',
            password: '',
            isLoading: false));

  Future<void> registerAccount({
    required String fullname,
    required String address,
    required String username,
    required String password,
  }) async {
    emit(state.copyWith(isLoading: true));
    final box = Hive.box('account');

    box.add(Account(
        fullname: fullname,
        address: address,
        username: username,
        password: password));

    showToast(text: 'Success!');

    logThis(text: box.length.toString());
    emit(state.copyWith(isLoading: false));
  }
}
