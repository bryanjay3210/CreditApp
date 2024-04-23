import 'dart:typed_data';

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

  @HiveField(4)
  late String gender;

  @HiveField(5)
  late String address;

  @HiveField(6)
  late String contactNo;

  @HiveField(7)
  late String emailAddress;

  @HiveField(8)
  late Uint8List? base64Image;

  Creditor(
      {required this.fullname,
      required this.userId,
      required this.creditorId,
      required this.totalBalance,
      required this.gender,
      required this.address,
      required this.contactNo,
      required this.emailAddress,
      required this.base64Image});
}
