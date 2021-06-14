class Favorite {
  int _idFavorite;
  String _namaFavorite;
  String _nomerFavorite;
  String _alamatEmailFavorite;


  Favorite(this._namaFavorite, this._nomerFavorite, this._alamatEmailFavorite);
  Favorite.fromMap(Map<String, dynamic> map) {
    this._idFavorite = map['idFavorite'];
    this._namaFavorite = map['namaFavorite'];
    this._nomerFavorite = map['nomerFavorite'];
    this._alamatEmailFavorite = map['alamatEmailFavorite'];
    
  }
  int get idFavorite => _idFavorite;

  String get namaFavorite => this._namaFavorite;
  set namaFavorite(String value) => this._namaFavorite = value;

  String get nomerFavorite => this._nomerFavorite;
  set nomerFavorite(String value) => this._nomerFavorite = value;

  String get alamatEmailFavorite => this._alamatEmailFavorite;
  set alamatEmailFavorite(String value) => this._alamatEmailFavorite = value;
  

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['idFavorite'] = this._idFavorite;
    map['namaFavorite'] = namaFavorite;
    map['nomerFavorite'] = nomerFavorite;
    map['alamatEmailFavorite'] = alamatEmailFavorite;
    return map;
  }
}
