import 'package:credit_app/models/debit.dart';
import 'package:hive/hive.dart';

double getTotalDebit(String creditorId) {
  /// Compute total debit
  double totalDebit = 0;
  var debitBox = Hive.box('debit');
  var debitList = debitBox.values.toList();
  for (var ds in debitList) {
    Debit debit = ds as Debit;
    if (debit.creditorId == creditorId) {
      totalDebit += debit.amount;
    }
  }
  return totalDebit;
}
