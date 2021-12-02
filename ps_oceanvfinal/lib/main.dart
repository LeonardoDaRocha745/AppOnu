import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ps_ocean/info.dart';
import 'package:ps_ocean/splash.dart';
import 'package:ps_ocean/welcome.dart';
import 'data.dart';
import 'login.dart';
import 'meta_item.dart';
import 'metas_widgets.dart';

void main() => runApp(MaterialApp(
      theme:
          ThemeData(primaryColor: Colors.blue, accentColor: Colors.blueAccent),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ));
const color = const Color(0xff282424);

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final key = GlobalKey<AnimatedListState>();
  final metaas = List.from(Data.metasList);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Color.fromRGBO(31, 151, 212, 1),
        appBar: AppBar(
          title: Text('Metas a serem cumpridas'),
        ),
        body: Column(
          children: [
            Expanded(
                child: AnimatedList(
              key: key,
              initialItemCount: metaas.length,
              itemBuilder: (context, index, animation) =>
                  buildMeta(metaas[index], index, animation),
            )),
            Container(
              padding: EdgeInsets.all(16),
              child: buildInsertButton(),
            )
          ],
        ),
      );

  Widget buildMeta(metas, int index, Animation<double> animation) =>
      MetasWidget(
        metas: metas,
        animation: animation,
        onClicked: () => removerMeta(index),
      );

  Widget buildInsertButton() => RaisedButton(
      child: Text(
        'Definir Meta',
        style: TextStyle(fontSize: 20),
      ),
      color: Colors.white,
      onPressed: () => inserirMeta(3, Data.metasList.first));

  void inserirMeta(int index, Metas metas) {
    metaas.insert(index, metas);
    key.currentState.insertItem(index);
  }

  removerMeta(int index) {
    final meta = metaas.removeAt(index);

    key.currentState.removeItem(
        index, (context, animation) => buildMeta(metaas, index, animation));
  }
}
