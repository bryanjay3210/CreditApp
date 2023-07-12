import 'package:credit_app/models/account.dart';
import 'package:credit_app/models/creditor.dart';
import 'package:credit_app/routes/app_routes.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Bootstrap {
  Future initializeHive() async {
    /// Initialize Hive
    await Hive.initFlutter();

    /// Register Adapter
    Hive.registerAdapter(AccountAdapter());
    Hive.registerAdapter(CreditorAdapter());

    /// Open box
    await Hive.openBox('account');
    await Hive.openBox('creditor');
  }

  Future getItRegister() async {
    GetIt.I.registerSingleton<AppRoutes>(AppRoutes());
  }
}
