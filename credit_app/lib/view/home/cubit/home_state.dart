part of 'home_cubit.dart';

class HomeState extends Equatable {
  final bool isShow;
  final double totalCredit;
  final double totalDebit;
  final String fullname;
  const HomeState({
    required this.isShow,
    required this.totalCredit,
    required this.totalDebit,
    required this.fullname,
  });

  HomeState copyWith(
      {bool? isShow,
      double? totalCredit,
      double? totalDebit,
      String? fullname}) {
    return HomeState(
        isShow: isShow ?? this.isShow,
        totalCredit: totalCredit ?? this.totalCredit,
        totalDebit: totalDebit ?? this.totalDebit,
        fullname: fullname ?? this.fullname);
  }

  @override
  List<Object> get props => [isShow, totalCredit, totalDebit, fullname];
}
