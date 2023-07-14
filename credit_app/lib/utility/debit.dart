import 'package:credit_app/helper/creditor.dart';
import 'package:credit_app/models/debit.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

double getTotalDebit() {
  /// Compute total debit
  double totalDebit = 0;
  var debitBox = Hive.box('debit');
  var debitList = debitBox.values.toList();
  for (var ds in debitList) {
    Debit debit = ds as Debit;
    if (debit.creditorId == GetIt.I<CreditorHelper>().creditorId) {
      totalDebit += debit.amount;
    }
  }
  return totalDebit;
}
