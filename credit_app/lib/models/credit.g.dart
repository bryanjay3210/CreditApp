// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditAdapter extends TypeAdapter<Credit> {
  @override
  final int typeId = 2;

  @override
  Credit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Credit(
      title: fields[0] as String,
      description: fields[1] as String,
      amount: fields[2] as double,
      dateStmp: fields[3] as DateTime,
      creditorId: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Credit obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.dateStmp)
      ..writeByte(4)
      ..write(obj.creditorId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
