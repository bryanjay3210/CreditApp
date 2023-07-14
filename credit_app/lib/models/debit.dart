import 'package:hive/hive.dart';

part 'debit.g.dart';

@HiveType(typeId: 3)
class Debit extends HiveObject {
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

  Debit(
      {required this.title,
      required this.description,
      required this.amount,
      required this.dateStmp,
      required this.creditorId});
}
