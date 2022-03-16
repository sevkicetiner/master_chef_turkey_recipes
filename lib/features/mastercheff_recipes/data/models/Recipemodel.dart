


class Recipemodel {
  Recipemodel({
      String? anasayfa, 
      String? anasayfaClassAdi, 
      String? anasayfaDikeyFoto, 
      String? baslik, 
      String? baslikOrig, 
      String? detay, 
      String? durum, 
      String? guncellemeTarihi, 
      String? id, 
      String? kategoriId, 
      String? kayitTarihi, 
      String? kname, 
      String? kslug, 
      String? resim, 
      String? seoBaslik, 
      String? slug, 
      String? spot, 
      String? tip, 
      String? tipDeger, 
      String? videoSuresi, 
      String? yayinlanmaTarihi, 
      String? yerlesimId, 
      String? localImage,}){
    _anasayfa = anasayfa;
    _anasayfaClassAdi = anasayfaClassAdi;
    _anasayfaDikeyFoto = anasayfaDikeyFoto;
    _baslik = baslik;
    _baslikOrig = baslikOrig;
    _detay = detay;
    _durum = durum;
    _guncellemeTarihi = guncellemeTarihi;
    _id = id;
    _kategoriId = kategoriId;
    _kayitTarihi = kayitTarihi;
    _kname = kname;
    _kslug = kslug;
    _resim = resim;
    _seoBaslik = seoBaslik;
    _slug = slug;
    _spot = spot;
    _tip = tip;
    _tipDeger = tipDeger;
    _videoSuresi = videoSuresi;
    _yayinlanmaTarihi = yayinlanmaTarihi;
    _yerlesimId = yerlesimId;
    _localImage = localImage;
}

  Recipemodel.fromJson(dynamic json) {
    _anasayfa = json['anasayfa'];
    _anasayfaClassAdi = json['anasayfa_class_adi'];
    _anasayfaDikeyFoto = json['anasayfa_dikey_foto'];
    _baslik = json['baslik'];
    _baslikOrig = json['baslik_orig'];
    _detay = json['detay'];
    _durum = json['durum'];
    _guncellemeTarihi = json['guncelleme_tarihi'];
    _id = json['id'];
    _kategoriId = json['kategori_id'];
    _kayitTarihi = json['kayit_tarihi'];
    _kname = json['kname'];
    _kslug = json['kslug'];
    _resim = json['resim'];
    _seoBaslik = json['seo_baslik'];
    _slug = json['slug'];
    _spot = json['spot'];
    _tip = json['tip'];
    _tipDeger = json['tip_deger'];
    _videoSuresi = json['video_suresi'];
    _yayinlanmaTarihi = json['yayinlanma_tarihi'];
    _yerlesimId = json['yerlesim_id'];
    _localImage = json['localImage'];
  }
  String? _anasayfa;
  String? _anasayfaClassAdi;
  String? _anasayfaDikeyFoto;
  String? _baslik;
  String? _baslikOrig;
  String? _detay;
  String? _durum;
  String? _guncellemeTarihi;
  String? _id;
  String? _kategoriId;
  String? _kayitTarihi;
  String? _kname;
  String? _kslug;
  String? _resim;
  String? _seoBaslik;
  String? _slug;
  String? _spot;
  String? _tip;
  String? _tipDeger;
  String? _videoSuresi;
  String? _yayinlanmaTarihi;
  String? _yerlesimId;
  String? _localImage;

  String? get anasayfa => _anasayfa;
  String? get anasayfaClassAdi => _anasayfaClassAdi;
  String? get anasayfaDikeyFoto => _anasayfaDikeyFoto;
  String? get baslik => _baslik;
  String? get baslikOrig => _baslikOrig;
  String? get detay => _detay;
  String? get durum => _durum;
  String? get guncellemeTarihi => _guncellemeTarihi;
  String? get id => _id;
  String? get kategoriId => _kategoriId;
  String? get kayitTarihi => _kayitTarihi;
  String? get kname => _kname;
  String? get kslug => _kslug;
  String? get resim => _resim;
  String? get seoBaslik => _seoBaslik;
  String? get slug => _slug;
  String? get spot => _spot;
  String? get tip => _tip;
  String? get tipDeger => _tipDeger;
  String? get videoSuresi => _videoSuresi;
  String? get yayinlanmaTarihi => _yayinlanmaTarihi;
  String? get yerlesimId => _yerlesimId;
  String? get localImage => _localImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['anasayfa'] = _anasayfa;
    map['anasayfa_class_adi'] = _anasayfaClassAdi;
    map['anasayfa_dikey_foto'] = _anasayfaDikeyFoto;
    map['baslik'] = _baslik;
    map['baslik_orig'] = _baslikOrig;
    map['detay'] = _detay;
    map['durum'] = _durum;
    map['guncelleme_tarihi'] = _guncellemeTarihi;
    map['id'] = _id;
    map['kategori_id'] = _kategoriId;
    map['kayit_tarihi'] = _kayitTarihi;
    map['kname'] = _kname;
    map['kslug'] = _kslug;
    map['resim'] = _resim;
    map['seo_baslik'] = _seoBaslik;
    map['slug'] = _slug;
    map['spot'] = _spot;
    map['tip'] = _tip;
    map['tip_deger'] = _tipDeger;
    map['video_suresi'] = _videoSuresi;
    map['yayinlanma_tarihi'] = _yayinlanmaTarihi;
    map['yerlesim_id'] = _yerlesimId;
    map['localImage'] = _localImage;
    return map;
  }

}