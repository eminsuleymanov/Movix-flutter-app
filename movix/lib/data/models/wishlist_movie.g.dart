// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_movie.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WishlistMovieAdapter extends TypeAdapter<WishlistMovie> {
  @override
  final int typeId = 0;

  @override
  WishlistMovie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WishlistMovie(
      id: fields[0] as String,
      title: fields[1] as String,
      country: fields[2] as String,
      genres: (fields[3] as List<String>),
      rated: fields[4] as String,
      poster: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WishlistMovie obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.country)
      ..writeByte(3)
      ..write(obj.genres)
      ..writeByte(4)
      ..write(obj.rated)
      ..writeByte(5)
      ..write(obj.poster);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WishlistMovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
