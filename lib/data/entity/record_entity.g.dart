// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecordEntityAdapter extends TypeAdapter<RecordEntity> {
  @override
  final int typeId = 0;

  @override
  RecordEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecordEntity(
      classic: fields[0] as int,
      pastel: fields[1] as int,
      neon: fields[2] as int,
      vintage: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, RecordEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.classic)
      ..writeByte(1)
      ..write(obj.pastel)
      ..writeByte(2)
      ..write(obj.neon)
      ..writeByte(3)
      ..write(obj.vintage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecordEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
