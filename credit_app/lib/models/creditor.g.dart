// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creditor.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditorAdapter extends TypeAdapter<Creditor> {
  @override
  final int typeId = 1;

  @override
  Creditor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Creditor(
      fullname: fields[0] as String,
      userId: fields[1] as String,
      creditorId: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Creditor obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.fullname)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.creditorId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
