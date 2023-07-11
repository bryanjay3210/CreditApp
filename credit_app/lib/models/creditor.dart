import 'package:hive/hive.dart';

part 'creditor.g.dart';

@HiveType(typeId: 0)
class Creditor {
  @HiveField(0)
  late String fullname;

  Creditor({required this.fullname});
}
