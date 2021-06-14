class Kontak {
  int _idKontak;
  String _namaKontak;
  String _nomerKontak;
  String _alamatEmailKontak;


  Kontak(this._namaKontak, this._nomerKontak, this._alamatEmailKontak);
  Kontak.fromMap(Map<String, dynamic> map) {
    this._idKontak = map['idKontak'];
    this._namaKontak = map['namaKontak'];
    this._nomerKontak = map['nomerKontak'];
    this._alamatEmailKontak = map['alamatEmailKontak'];
    
  }
  int get idKontak => _idKontak;

  String get namaKontak => this._namaKontak;
  set namaKontak(String value) => this._namaKontak = value;

  String get nomerKontak => this._nomerKontak;
  set nomerKontak(String value) => this._nomerKontak = value;

  String get alamatEmailKontak => this._alamatEmailKontak;
  set alamatEmailKontak(String value) => this._alamatEmailKontak = value;
  

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['idKontak'] = this._idKontak;
    map['namaKontak'] = namaKontak;
    map['nomerKontak'] = nomerKontak;
    map['alamatEmailKontak'] = alamatEmailKontak;
    return map;
  }
}
