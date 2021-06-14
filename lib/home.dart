import 'package:flutter/material.dart';
import 'package:uts/pages/HomeKontak.dart'; 
import 'package:uts/pages/homeFavorite.dart'; 

// void main() => runApp(MyApp());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tambah',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Kontak"),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: "Kontak",
                  ),
                  Tab(
                    text: "Favorite",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                HomeKontak(HomeKontak),
                HomeFavorite(HomeFavorite),
            ],
          )
        ),
      ),
    );
  }
}