import 'package:credit_app/helper/creditor.dart';
import 'package:credit_app/models/creditor.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import 'credit.dart';
import 'debit.dart';

void updateCreditorTotalBalance() {
  ///Update total balance
  Creditor creditor = Hive.box('creditor')
      .values
      .toList()
      .where((element) =>
          element.creditorId == GetIt.I<CreditorHelper>().creditorId)
      .first as Creditor;
  creditor.totalBalance = getTotalCredit() - getTotalDebit();
  creditor.save();
}
