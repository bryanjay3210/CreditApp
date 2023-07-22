import 'package:credit_app/models/credit.dart';
import 'package:hive/hive.dart';

double getTotalCredit(String creditorId) {
  /// Compute total credit
  double totalCredit = 0;
  var creditBox = Hive.box('credit');
  var creditList = creditBox.values.toList();
  for (var ds in creditList) {
    Credit credit = ds as Credit;
    if (credit.creditorId == creditorId) {
      totalCredit += credit.amount;
    }
  }
  return totalCredit;
}
