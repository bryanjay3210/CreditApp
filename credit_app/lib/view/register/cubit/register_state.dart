part of 'register_cubit.dart';

class RegisterState extends Equatable {
  const RegisterState(
      {required this.fullname,
      required this.address,
      required this.username,
      required this.password,
      required this.isLoading,
      required this.isShow});

  final String fullname;
  final String address;
  final String username;
  final String password;
  final bool isLoading;
  final bool isShow;

  RegisterState copyWith(
      {String? fullname,
      String? address,
      String? username,
      String? password,
      bool? isLoading,
      bool? isShow}) {
    return RegisterState(
        fullname: fullname ?? this.fullname,
        address: address ?? this.address,
        username: username ?? this.username,
        password: password ?? this.password,
        isLoading: isLoading ?? this.isLoading,
        isShow: isShow ?? this.isShow);
  }

  @override
  List<Object?> get props =>
      [fullname, address, username, password, isLoading, isShow];
}
