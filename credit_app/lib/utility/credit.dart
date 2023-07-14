import 'package:credit_app/helper/creditor.dart';
import 'package:credit_app/models/credit.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

double getTotalCredit() {
  /// Compute total credit
  double totalCredit = 0;
  var creditBox = Hive.box('credit');
  var creditList = creditBox.values.toList();
  for (var ds in creditList) {
    Credit credit = ds as Credit;
    if (credit.creditorId == GetIt.I<CreditorHelper>().creditorId) {
      totalCredit += credit.amount;
    }
  }
  return totalCredit;
}
