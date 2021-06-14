import 'package:flutter/material.dart';
import 'package:uts/model/kontak.dart';
import 'package:uts/database/dbhelper.dart';

class FormKontak extends StatefulWidget {
  final Kontak kontak;
  FormKontak(this.kontak);
  @override
  FormKontakState createState() => FormKontakState(this.kontak);
}

class FormKontakState extends State<FormKontak> {
  Kontak kontak;
  FormKontakState(this.kontak);
  TextEditingController namaKontakController = TextEditingController();
  TextEditingController nomerKontakController = TextEditingController();
  TextEditingController alamatEmailKontakController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (kontak != null) {
     namaKontakController.text = kontak.namaKontak;
     nomerKontakController.text = kontak.nomerKontak;
      alamatEmailKontakController.text = kontak. alamatEmailKontak;
    }
    return Scaffold(
        appBar: AppBar(
          title: kontak == null ? Text('Tambah') : Text('Edit'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: namaKontakController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama Kontak',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: nomerKontakController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nomer',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: alamatEmailKontakController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Alamat Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text('Simpan',textScaleFactor: 1.5,),
                        onPressed: () {
                          if (kontak == null) {
                            kontak = Kontak(
                                namaKontakController.text,
                                nomerKontakController.text,
                                alamatEmailKontakController.text,
                                );
                          } else {
                            kontak.namaKontak = namaKontakController.text;
                            kontak.nomerKontak = nomerKontakController.text;
                            kontak.alamatEmailKontak = alamatEmailKontakController.text;
                          }
                          Navigator.pop(context, kontak);
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text('Batal',textScaleFactor: 1.5,),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      );
  }
}