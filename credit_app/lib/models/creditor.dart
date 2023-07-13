import 'package:hive/hive.dart';

part 'creditor.g.dart';

@HiveType(typeId: 1)
class Creditor {
  @HiveField(0)
  late String fullname;

  @HiveField(1)
  late String userId;

  @HiveField(2)
  late String creditorId;

  Creditor(
      {required this.fullname, required this.userId, required this.creditorId});
}
