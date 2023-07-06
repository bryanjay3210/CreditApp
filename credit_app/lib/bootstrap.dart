import 'package:credit_app/routes/app_routes.dart';
import 'package:get_it/get_it.dart';

class Bootstrap {
  Future getItRegister() async {
    GetIt.I.registerSingleton<AppRoutes>(AppRoutes());
  }
}
