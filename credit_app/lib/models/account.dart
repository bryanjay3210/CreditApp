import 'package:hive/hive.dart';

part 'account.g.dart';

@HiveType(typeId: 0)
class Account {
  @HiveField(0)
  late String fullname;

  @HiveField(1)
  late String address;

  @HiveField(2)
  late String username;

  @HiveField(3)
  late String password;

  @HiveField(4)
  late String userId;

  Account(
      {required this.fullname,
      required this.address,
      required this.username,
      required this.password,
      required this.userId});
}
