part of 'credit_cubit.dart';

class CreditState extends Equatable {
  const CreditState(
      {required this.isLoading,
      required this.creditList,
      required this.totalCredit});

  final bool isLoading;
  final List<Credit> creditList;
  final double totalCredit;

  CreditState copyWith(
      {bool? isLoading, List<Credit>? creditList, double? totalCredit}) {
    return CreditState(
        isLoading: isLoading ?? this.isLoading,
        creditList: creditList ?? this.creditList,
        totalCredit: totalCredit ?? this.totalCredit);
  }

  @override
  List<Object> get props => [isLoading, creditList, totalCredit];
}
