part of 'home_cubit.dart';

class HomeState extends Equatable {
  final bool isShow;
  final double totalCredit;
  final double totalDebit;
  final String fullname;
  final List<TransactionHistory> transactionHistory;
  final bool isLoading;
  const HomeState(
      {required this.isShow,
      required this.totalCredit,
      required this.totalDebit,
      required this.fullname,
      required this.transactionHistory,
      required this.isLoading});

  HomeState copyWith(
      {bool? isShow,
      double? totalCredit,
      double? totalDebit,
      String? fullname,
      List<TransactionHistory>? transactionHistory,
      bool? isLoading}) {
    return HomeState(
        isShow: isShow ?? this.isShow,
        totalCredit: totalCredit ?? this.totalCredit,
        totalDebit: totalDebit ?? this.totalDebit,
        fullname: fullname ?? this.fullname,
        transactionHistory: transactionHistory ?? this.transactionHistory,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object> get props => [
        isShow,
        totalCredit,
        totalDebit,
        fullname,
        transactionHistory,
        isLoading
      ];
}
