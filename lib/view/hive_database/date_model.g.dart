// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DateModelAdapter extends TypeAdapter<DateModel> {
  @override
  final int typeId = 2;

  @override
  DateModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DateModel(
      fields[0] as DateTime,
      fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DateModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.currentIndex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
