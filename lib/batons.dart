import 'package:flutter/material.dart';
import 'package:marykay1/produtos/catlgonline.dart';
import 'categorias.dart';
import 'package:marykay1/produtos/semimatte.dart';
import 'package:marykay1/produtos/matte.dart';
import 'package:marykay1/produtos/batommetal.dart';
import 'package:marykay1/produtos/liquidomatte.dart';


class Batons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){

        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => Categorias()));

      },
      child: Scaffold(
        appBar: new AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Categorias()));
            },
          ),
          title: new Text('Batons'),
          backgroundColor: const Color(0xffFFC1D9),
        ),
        body: new Container(
            alignment: Alignment.topCenter,
            color: const Color(0xffFFE2F1),
            child: new Container(
              margin: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              width: 400,
              // limited by EdgeInsets horizontal: 35.0, you can put 40000 it's OK.
              height: 290.0,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: new BorderRadius.vertical(
                    bottom: new Radius.circular(20.0),
                  )),
              child: new Column(children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.add),
                  title: Text('Batom Gel Semi Matte Mary Kay®'),
                  onTap: () {

                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Semimatte()));

                  },
                ),
                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.add),
                  title: Text('Batom Matte Mary Kay®'),
                  onTap: () {

                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Matte()));

                  },
                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts), title: Text('Batom Líquido Metálico'),
                  onTap: () {

                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Batommetal()));

                  },
                ),
                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts), title: Text('Batom Líquido Matte At Play®'),
                  onTap: () {

                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Liquidomatte()));

                  },
                ),
              ]),
            )),
      ),
    );
  }
}