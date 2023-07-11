part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({required this.isLoading, required this.isShow});

  final bool isLoading;
  final bool isShow;

  LoginState copyWith({bool? isLoading, bool? isShow}) {
    return LoginState(
        isLoading: isLoading ?? this.isLoading, isShow: isShow ?? this.isShow);
  }

  @override
  List<Object?> get props => [isLoading, isShow];
}
