import 'package:bloc/bloc.dart';
import 'package:credit_app/helper/auth.dart';
import 'package:credit_app/models/creditor.dart';
import 'package:credit_app/utility/credit.dart';
import 'package:credit_app/utility/debit.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(const HomeState(isShow: false, totalCredit: 0, totalDebit: 0));

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

  void toogleIsShow() {
    emit(state.copyWith(isShow: !state.isShow));
  }
}
