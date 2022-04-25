// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyHistoryModelAdapter extends TypeAdapter<CurrencyHistoryModel> {
  @override
  final int typeId = 2;

  @override
  CurrencyHistoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrencyHistoryModel(
      fromCurrencyCode: fields[0] as String?,
      toCurrencyCode: fields[1] as String?,
      fromCurrencyValue: fields[2] as double?,
      toCurrencyValue: fields[3] as double?,
      currentDate: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CurrencyHistoryModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.fromCurrencyCode)
      ..writeByte(1)
      ..write(obj.toCurrencyCode)
      ..writeByte(2)
      ..write(obj.fromCurrencyValue)
      ..writeByte(3)
      ..write(obj.toCurrencyValue)
      ..writeByte(4)
      ..write(obj.currentDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyHistoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
