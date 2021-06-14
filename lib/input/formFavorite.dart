import 'package:flutter/material.dart';
import 'package:uts/model/favorite.dart';
import 'package:uts/database/dbhelper.dart';

class FormFavorite extends StatefulWidget {
  final Favorite favorite;
  FormFavorite(this.favorite);
  @override
  FormFavoriteState createState() => FormFavoriteState(this.favorite);
}

class FormFavoriteState extends State<FormFavorite> {
  Favorite favorite;
  FormFavoriteState(this.favorite);
  TextEditingController namaFavoriteController = TextEditingController();
  TextEditingController nomerFavoriteController = TextEditingController();
  TextEditingController alamatEmailFavoriteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (favorite != null) {
     namaFavoriteController.text = favorite.namaFavorite;
     nomerFavoriteController.text = favorite.nomerFavorite;
      alamatEmailFavoriteController.text = favorite. alamatEmailFavorite;
    }
    return Scaffold(
        appBar: AppBar(
          title: favorite == null ? Text('Tambah') : Text('Edit'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: namaFavoriteController,
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
                  controller: nomerFavoriteController,
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
                  controller: alamatEmailFavoriteController,
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
                          if (favorite == null) {
                            favorite = Favorite(
                                namaFavoriteController.text,
                                nomerFavoriteController.text,
                                alamatEmailFavoriteController.text,
                                );
                          } else {
                            favorite.namaFavorite = namaFavoriteController.text;
                            favorite.nomerFavorite = nomerFavoriteController.text;
                            favorite.alamatEmailFavorite = alamatEmailFavoriteController.text;
                          }
                          Navigator.pop(context, favorite);
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