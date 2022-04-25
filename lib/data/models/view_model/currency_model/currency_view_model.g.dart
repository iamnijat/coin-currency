// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_view_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyViewModelAdapter extends TypeAdapter<CurrencyViewModel> {
  @override
  final int typeId = 1;

  @override
  CurrencyViewModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrencyViewModel(
      nominal: fields[0] as int?,
      name: fields[1] as String?,
      value: fields[2] as double?,
      code: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CurrencyViewModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.nominal)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.value)
      ..writeByte(3)
      ..write(obj.code);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyViewModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
