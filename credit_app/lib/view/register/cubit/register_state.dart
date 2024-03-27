part of 'register_cubit.dart';

class RegisterState extends Equatable {
  const RegisterState(
      {required this.fullname,
      required this.address,
      required this.username,
      required this.password,
      required this.isLoading,
      required this.isShow,
      this.base64Image});

  final String fullname;
  final String address;
  final String username;
  final String password;
  final bool isLoading;
  final bool isShow;
  final Uint8List? base64Image;

  RegisterState copyWith(
      {String? fullname,
      String? address,
      String? username,
      String? password,
      bool? isLoading,
      bool? isShow,
      Uint8List? base64Image}) {
    return RegisterState(
        fullname: fullname ?? this.fullname,
        address: address ?? this.address,
        username: username ?? this.username,
        password: password ?? this.password,
        isLoading: isLoading ?? this.isLoading,
        isShow: isShow ?? this.isShow,
        base64Image: base64Image);
  }

  @override
  List<Object?> get props =>
      [fullname, address, username, password, isLoading, isShow, base64Image];
}
