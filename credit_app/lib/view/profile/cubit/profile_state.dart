part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({required this.isShow});

  final bool isShow;

  ProfileState copyWith({bool? isShow}) {
    return ProfileState(isShow: isShow ?? this.isShow);
  }

  @override
  List<Object?> get props => [isShow];
}
