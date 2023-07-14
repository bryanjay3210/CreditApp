import 'package:bloc/bloc.dart';
import 'package:credit_app/helper/creditor.dart';
import 'package:credit_app/models/debit.dart';
import 'package:credit_app/utility/balance.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

part 'debit_state.dart';

class DebitCubit extends Cubit<DebitState> {
  DebitCubit()
      : super(const DebitState(isLoading: false, debitList: [], totalDebit: 0));

  Future<void> addDebit(
      {required String title,
      required String description,
      required double amount}) async {
    emit(state.copyWith(isLoading: true));
    final box = Hive.box('debit');
    box.add(Debit(
        title: title,
        description: description,
        amount: amount,
        dateStmp: DateTime.now(),
        creditorId: GetIt.I<CreditorHelper>().creditorId));
    updateCreditorTotalBalance();
    emit(state.copyWith(isLoading: false));
  }

  Future<void> getDebitList() async {
    emit(state.copyWith(isLoading: true, totalDebit: 0, debitList: []));
    double totalDebit = 0;
    List<Debit> debitList = [];
    final box = Hive.box('debit');
    var dl = box.values.toList();
    for (var ds in dl) {
      Debit debit = ds as Debit;
      if (debit.creditorId == GetIt.I<CreditorHelper>().creditorId) {
        debitList.add(debit);
        totalDebit += debit.amount;
      }
    }
    emit(state.copyWith(
        isLoading: false, debitList: debitList, totalDebit: totalDebit));
  }
}
