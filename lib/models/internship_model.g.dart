// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'internship_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InternshipResponseAdapter extends TypeAdapter<InternshipResponse> {
  @override
  final int typeId = 0;

  @override
  InternshipResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InternshipResponse(
      internships: (fields[0] as List).cast<Internship>(),
    );
  }

  @override
  void write(BinaryWriter writer, InternshipResponse obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.internships);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InternshipResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InternshipAdapter extends TypeAdapter<Internship> {
  @override
  final int typeId = 1;

  @override
  Internship read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Internship(
      id: fields[0] as int,
      title: fields[1] as String,
      employmentType: fields[2] as String,
      companyName: fields[3] as String,
      workFromHome: fields[4] as bool,
      startDate: fields[5] as String,
      duration: fields[6] as String,
      stipend: fields[7] as Stipend,
      locations: (fields[8] as List).cast<Location>(),
    );
  }

  @override
  void write(BinaryWriter writer, Internship obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.employmentType)
      ..writeByte(3)
      ..write(obj.companyName)
      ..writeByte(4)
      ..write(obj.workFromHome)
      ..writeByte(5)
      ..write(obj.startDate)
      ..writeByte(6)
      ..write(obj.duration)
      ..writeByte(7)
      ..write(obj.stipend)
      ..writeByte(8)
      ..write(obj.locations);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InternshipAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StipendAdapter extends TypeAdapter<Stipend> {
  @override
  final int typeId = 2;

  @override
  Stipend read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Stipend(
      salary: fields[0] as String,
      currency: fields[1] as String,
      scale: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Stipend obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.salary)
      ..writeByte(1)
      ..write(obj.currency)
      ..writeByte(2)
      ..write(obj.scale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StipendAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LocationAdapter extends TypeAdapter<Location> {
  @override
  final int typeId = 3;

  @override
  Location read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Location(
      name: fields[0] as String,
      country: fields[1] as String,
      region: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Location obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.country)
      ..writeByte(2)
      ..write(obj.region);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
