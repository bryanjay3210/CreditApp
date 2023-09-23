import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'account.g.dart';

@HiveType(typeId: 0)
class Account extends HiveObject {
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

  @HiveField(5)
  late Uint8List? imageBase64;

  Account(
      {required this.fullname,
      required this.address,
      required this.username,
      required this.password,
      required this.userId,
      this.imageBase64});
}
