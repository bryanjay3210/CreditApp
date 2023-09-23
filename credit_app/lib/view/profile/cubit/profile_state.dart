part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({required this.image, required this.isShow});

  final File? image;
  final bool isShow;

  ProfileState copyWith({File? image, bool? isShow}) {
    return ProfileState(
        image: image ?? this.image, isShow: isShow ?? this.isShow);
  }

  @override
  List<Object?> get props => [image, isShow];
}
