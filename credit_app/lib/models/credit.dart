import 'package:hive/hive.dart';

part 'credit.g.dart';

@HiveType(typeId: 2)
class Credit extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String description;

  @HiveField(2)
  late double amount;

  @HiveField(3)
  late DateTime dateStmp;

  @HiveField(4)
  late String creditorId;

  Credit(
      {required this.title,
      required this.description,
      required this.amount,
      required this.dateStmp,
      required this.creditorId});
}
