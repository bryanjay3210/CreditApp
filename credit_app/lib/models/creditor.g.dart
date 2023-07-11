// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creditor.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditorAdapter extends TypeAdapter<Creditor> {
  @override
  final int typeId = 0;

  @override
  Creditor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Creditor(
      fullname: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Creditor obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.fullname);
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
