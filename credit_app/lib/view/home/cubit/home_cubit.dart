import 'package:bloc/bloc.dart';
import 'package:credit_app/helper/auth.dart';
import 'package:credit_app/models/account.dart';
import 'package:credit_app/models/credit.dart';
import 'package:credit_app/models/creditor.dart';
import 'package:credit_app/models/debit.dart';
import 'package:credit_app/models/transaction_history.dart';
import 'package:credit_app/utility/credit.dart';
import 'package:credit_app/utility/debit.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(const HomeState(
            isShow: false,
            totalCredit: 0,
            totalDebit: 0,
            fullname: '',
            transactionHistory: [],
            isLoading: false));

  Future<void> computeTotal() async {
    emit(state.copyWith(totalCredit: 0, totalDebit: 0));
    double totalCredit = 0;
    double totalDebit = 0;
    var creditor = Hive.box('creditor')
        .values
        .toList()
        .where((element) => element.userId == GetIt.I<AuthHelper>().userId);
    for (var ds in creditor) {
      Creditor creditor = ds as Creditor;
      totalCredit += getTotalCredit(creditor.creditorId);
    }
    for (var ds in creditor) {
      Creditor creditor = ds as Creditor;
      totalDebit += getTotalDebit(creditor.creditorId);
    }
    emit(state.copyWith(totalCredit: totalCredit, totalDebit: totalDebit));
  }

  Future<void> getTransactionHistory() async {
    emit(state.copyWith(transactionHistory: [], isLoading: true));
    List<TransactionHistory> transactionHistory = [];
    var creditor = Hive.box('creditor')
        .values
        .toList()
        .where((element) => element.userId == GetIt.I<AuthHelper>().userId);
    for (var ds in creditor) {
      Creditor creditor = ds as Creditor;
      var creditList = Hive.box('credit').values.toList().where((element) =>
          element.creditorId.toString().contains(creditor.creditorId));
      for (var ds in creditList) {
        Credit credit = ds as Credit;
        transactionHistory.add(TransactionHistory(
            creditor.fullname, credit.dateStmp, credit.amount, true));
      }
    }

    for (var ds in creditor) {
      Creditor creditor = ds as Creditor;
      var debitList = Hive.box('debit').values.toList().where((element) =>
          element.creditorId.toString().contains(creditor.creditorId));
      for (var ds in debitList) {
        Debit debit = ds as Debit;
        transactionHistory.add(TransactionHistory(
            creditor.fullname, debit.dateStmp, debit.amount, false));
      }
    }

    transactionHistory.sort(
      (a, b) => b.dateStmp.compareTo(a.dateStmp),
    );

    emit(state.copyWith(
        transactionHistory: transactionHistory, isLoading: false));
  }

  Future<void> getUser() async {
    emit(state.copyWith(fullname: ''));
    var user = Hive.box('account')
        .values
        .toList()
        .where((element) => element.userId == GetIt.I<AuthHelper>().userId)
        .first as Account;
    emit(state.copyWith(fullname: user.fullname));
  }

  void toogleIsShow() {
    emit(state.copyWith(isShow: !state.isShow));
  }
}
