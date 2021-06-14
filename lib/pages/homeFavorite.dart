import 'package:uts/database/dbhelper.dart';
import 'package:uts/model/favorite.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uts/input/formFavorite.dart';
import 'dart:async';

class HomeFavorite extends StatefulWidget {
  HomeFavorite(HomeFavorite);

  @override
  HomeFavoriteState createState() => HomeFavoriteState();
}

class HomeFavoriteState extends State<HomeFavorite> {
  DbHelper dbHelper = DbHelper();
  int count = 0;



  
  List<Favorite> FavoriteList;
  @override
  Widget build(BuildContext context) {
    updateListView();

    if (FavoriteList == null) {
      FavoriteList = List<Favorite>();
    }
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: createListView(),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child:  FloatingActionButton(
        
        tooltip: 'Increment',
        child: Icon(Icons.add),
              onPressed: () async {
                var Favorite = await navigateToEntryForm(context, null);
                if (Favorite != null) {
                  int result = await dbHelper.insertFavorite(Favorite);
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

  Future<Favorite> navigateToEntryForm(
      BuildContext context, Favorite Favorite) async {
      var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return FormFavorite(Favorite);
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
              child: Text(this.FavoriteList[index].idFavorite.toString()),
            ),
            title: Text(
              this.FavoriteList[index].namaFavorite,
              style: textStyle,
            ),
            subtitle: Text(
              "Nomer: " + this.FavoriteList[index].nomerFavorite 
              ),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                dbHelper.deleteFavorite(this.FavoriteList[index].idFavorite);
                updateListView();
              },
            ),
            onTap: () async {
              var Favorite =
                  await navigateToEntryForm(context, this.FavoriteList[index]);
              if (Favorite != null) {
                int result = await dbHelper.updateFavorite(Favorite);
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
      Future<List<Favorite>> FavoriteListFuture = dbHelper.getFavoriteList();
      FavoriteListFuture.then((FavoriteList) {
        setState(() {
          this.FavoriteList = FavoriteList;
          this.count = FavoriteList.length;
        });
      });
    });
  }
}