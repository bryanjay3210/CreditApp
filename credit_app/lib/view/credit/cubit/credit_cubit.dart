import 'package:bloc/bloc.dart';
import 'package:credit_app/helper/creditor.dart';
import 'package:credit_app/models/credit.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

part 'credit_state.dart';

class CreditCubit extends Cubit<CreditState> {
  CreditCubit()
      : super(const CreditState(
            isLoading: false, creditList: [], totalCredit: 0));

  Future<void> addCredit(
      {required String title,
      required String description,
      required double amount}) async {
    emit(state.copyWith(isLoading: true));
    final box = Hive.box('credit');
    box.add(Credit(
        title: title,
        description: description,
        amount: amount,
        dateStmp: DateTime.now(),
        creditorId: GetIt.I<CreditorHelper>().creditorId));
    emit(state.copyWith(isLoading: false));
  }

  Future<void> getCreditList() async {
    emit(state.copyWith(isLoading: true, totalCredit: 0, creditList: []));
    double totalCredit = 0;
    List<Credit> creditList = [];
    final box = Hive.box('credit');
    var cl = box.values.toList();
    for (var ds in cl) {
      Credit credit = ds as Credit;
      if (credit.creditorId == GetIt.I<CreditorHelper>().creditorId) {
        creditList.add(credit);
        totalCredit += credit.amount;
      }
    }
    emit(state.copyWith(
        isLoading: false, creditList: creditList, totalCredit: totalCredit));
  }
}
