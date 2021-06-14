import 'package:uts/database/dbhelper.dart';
import 'package:uts/model/kontak.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uts/input/formKontak.dart';
import 'dart:async';

class HomeKontak extends StatefulWidget {
  HomeKontak(HomeKontak);

  @override
  HomeKontakState createState() => HomeKontakState();
}

class HomeKontakState extends State<HomeKontak> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Kontak> KontakList;
  @override
  Widget build(BuildContext context) {
    updateListView();

    if (KontakList == null) {
      KontakList = List<Kontak>();
    }
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: createListView(),
        ),
        Container(
          alignment: Alignment.bottomRight,
          child: SizedBox(
            width: double.infinity,
            child:FloatingActionButton(
        
        tooltip: 'Increment',
        child: Icon(Icons.add),
             
              onPressed: () async {
                var Kontak = await navigateToEntryForm(context, null);
                if (Kontak != null) {
                  int result = await dbHelper.insertKontak(Kontak);
                  if (result > 0) {
                    updateListView();
                  }
                }
              },
            ),
          ),
        ),
      ]),
    );
  }

  Future<Kontak> navigateToEntryForm(BuildContext context, Kontak Kontak) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return FormKontak(Kontak);
    }));
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.headline5;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.pink,
              child: Text(this.KontakList[index].idKontak.toString()),
            ),
            title: Text(
              this.KontakList[index].namaKontak,
              style: textStyle,
            ),
            subtitle: Text(
              "Nomer: " + this.KontakList[index].nomerKontak.toString() 
              ),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                dbHelper.deleteKontak(this.KontakList[index].idKontak);
                updateListView();
              },
            ),
            onTap: () async {
              var Kontak =
                  await navigateToEntryForm(context, this.KontakList[index]);
              if (Kontak != null) {
                int result = await dbHelper.updateKontak(Kontak);
                if (result > 0) {
                  updateListView();
                }
              }
            },
          ),
        );
      },
    );
  }

  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Kontak>> KontakListFuture = dbHelper.getKontakList();
      KontakListFuture.then((KontakList) {
        setState(() {
          this.KontakList = KontakList;
          this.count = KontakList.length;
        });
      });
    });
  }
}