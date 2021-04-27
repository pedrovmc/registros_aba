// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abc_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AbcModelAdapter extends TypeAdapter<AbcModel> {
  @override
  final int typeId = 0;

  @override
  AbcModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AbcModel()
      ..antecedent = fields[0] as String
      ..behavior = fields[1] as String
      ..consequences = fields[2] as String
      ..dateTime = fields[3] as DateTime;
  }

  @override
  void write(BinaryWriter writer, AbcModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.antecedent)
      ..writeByte(1)
      ..write(obj.behavior)
      ..writeByte(2)
      ..write(obj.consequences)
      ..writeByte(3)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AbcModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
