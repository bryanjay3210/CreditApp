part of 'home_cubit.dart';

class HomeState extends Equatable {
  final bool isShow;
  const HomeState({required this.isShow});

  HomeState copyWith({bool? isShow}) {
    return HomeState(isShow: isShow ?? this.isShow);
  }

  @override
  List<Object> get props => [isShow];
}
