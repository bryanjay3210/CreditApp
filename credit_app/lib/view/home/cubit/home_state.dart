part of 'home_cubit.dart';

class HomeState extends Equatable {
  final bool isShow;
  final double totalCredit;
  final double totalDebit;
  const HomeState({
    required this.isShow,
    required this.totalCredit,
    required this.totalDebit,
  });

  HomeState copyWith({bool? isShow, double? totalCredit, double? totalDebit}) {
    return HomeState(
        isShow: isShow ?? this.isShow,
        totalCredit: totalCredit ?? this.totalCredit,
        totalDebit: totalDebit ?? this.totalDebit);
  }

  @override
  List<Object> get props => [isShow, totalCredit, totalDebit];
}
