// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeModelAdapter extends TypeAdapter<RecipeModel> {
  @override
  final int typeId = 0;

  @override
  RecipeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeModel()
      .._id = fields[0] as String?
      .._eskiId = fields[1] as String?
      .._seoBaslik = fields[2] as String?
      .._baslikOrig = fields[3] as String?
      .._baslik = fields[4] as String?
      .._spot = fields[5] as String?
      .._slug = fields[6] as String?
      .._yerlesimId = fields[7] as String?
      .._kategoriId = fields[8] as String?
      .._anasayfa = fields[9] as String?
      .._okunma = fields[10] as String?
      .._tip = fields[11] as String?
      .._tipDeger = fields[12] as String?
      .._detay = fields[13] as String?
      .._guncellemeTarihi = fields[14] as String?
      .._durum = fields[15] as String?
      .._anasayfaClassAdi = fields[16] as String?
      .._resim = fields[17] as String?
      .._videoSuresi = fields[18] as String?
      .._anasayfaDikeyFoto = fields[19] as String?
      .._kayitTarihi = fields[20] as String?
      .._kslug = fields[21] as String?
      .._kname = fields[22] as String?
      .._yayinlanmaTarihi = fields[23] as String?
        .._localImage = fields[24] as String?;
  }

  @override
  void write(BinaryWriter writer, RecipeModel obj) {
    writer
      ..writeByte(24)
      ..writeByte(0)
      ..write(obj._id)
      ..writeByte(1)
      ..write(obj._eskiId)
      ..writeByte(2)
      ..write(obj._seoBaslik)
      ..writeByte(3)
      ..write(obj._baslikOrig)
      ..writeByte(4)
      ..write(obj._baslik)
      ..writeByte(5)
      ..write(obj._spot)
      ..writeByte(6)
      ..write(obj._slug)
      ..writeByte(7)
      ..write(obj._yerlesimId)
      ..writeByte(8)
      ..write(obj._kategoriId)
      ..writeByte(9)
      ..write(obj._anasayfa)
      ..writeByte(10)
      ..write(obj._okunma)
      ..writeByte(11)
      ..write(obj._tip)
      ..writeByte(12)
      ..write(obj._tipDeger)
      ..writeByte(13)
      ..write(obj._detay)
      ..writeByte(14)
      ..write(obj._guncellemeTarihi)
      ..writeByte(15)
      ..write(obj._durum)
      ..writeByte(16)
      ..write(obj._anasayfaClassAdi)
      ..writeByte(17)
      ..write(obj._resim)
      ..writeByte(18)
      ..write(obj._videoSuresi)
      ..writeByte(19)
      ..write(obj._anasayfaDikeyFoto)
      ..writeByte(20)
      ..write(obj._kayitTarihi)
      ..writeByte(21)
      ..write(obj._kslug)
      ..writeByte(22)
      ..write(obj._kname)
      ..writeByte(23)
      ..write(obj._yayinlanmaTarihi)
      ..writeByte(24)
      ..write(obj._localImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
