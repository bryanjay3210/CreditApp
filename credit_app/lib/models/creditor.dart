import 'package:hive/hive.dart';

part 'creditor.g.dart';

@HiveType(typeId: 1)
class Creditor extends HiveObject {
  @HiveField(0)
  late String fullname;

  @HiveField(1)
  late String userId;

  @HiveField(2)
  late String creditorId;

  @HiveField(3)
  late double totalBalance;

  Creditor(
      {required this.fullname,
      required this.userId,
      required this.creditorId,
      required this.totalBalance});
}
