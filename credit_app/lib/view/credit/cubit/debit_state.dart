part of 'debit_cubit.dart';

class DebitState extends Equatable {
  const DebitState(
      {required this.isLoading,
      required this.debitList,
      required this.totalDebit});

  final bool isLoading;
  final List<Debit> debitList;
  final double totalDebit;

  DebitState copyWith(
      {bool? isLoading, List<Debit>? debitList, double? totalDebit}) {
    return DebitState(
        isLoading: isLoading ?? this.isLoading,
        debitList: debitList ?? this.debitList,
        totalDebit: totalDebit ?? this.totalDebit);
  }

  @override
  List<Object> get props => [isLoading, debitList, totalDebit];
}
