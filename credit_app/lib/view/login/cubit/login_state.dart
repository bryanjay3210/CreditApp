part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({required this.isLoading});

  final bool isLoading;

  LoginState copyWith({bool? isLoading}) {
    return LoginState(isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object?> get props => [isLoading];
}
