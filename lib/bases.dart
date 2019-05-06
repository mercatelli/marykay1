import 'package:flutter/material.dart';
import 'package:marykay1/produtos/catlgonline.dart';
import 'categorias.dart';
import 'package:marykay1/produtos/basecremepo.dart';
import 'package:marykay1/produtos/basemedia.dart';
import 'package:marykay1/produtos/basepomineral.dart';
import 'package:marykay1/produtos/baseluminoso.dart';
import 'package:marykay1/produtos/baseatplay.dart';


class Bases extends StatelessWidget {
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
          title: new Text('Bases'),
          backgroundColor: const Color(0xffFFC1D9),
        ),
        body: new Container(
            alignment: Alignment.topCenter,
            color: const Color(0xffFFE2F1),
            child: new Container(
              margin: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              width: 400,
              // limited by EdgeInsets horizontal: 35.0, you can put 40000 it's OK.
              height: 430.0,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: new BorderRadius.vertical(
                    bottom: new Radius.circular(20.0),
                  )),
              child: new Column(children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.add),
                  title: Text('Base Creme Efeito Pó'),
                  onTap: () {

                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Basecremepo()));

                  },
                ),
                new Divider(),
                new ListTile(
                    leading: new Icon(Icons.add),
                    title: Text('Base Cobertura Média'),
                  onTap: () {

                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Basemedia()));

                  },
                ),

                new Divider(),
                new ListTile(
                    leading: new Icon(Icons.contacts), title: Text('Base em Pó Mineral'),
                  onTap: () {

                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Basepomineral()));

                  },
                ),
                new Divider(),
                new ListTile(
                    leading: new Icon(Icons.contacts), title: Text('Base Líquida TimeWise® Acabamento Matte'),
                  onTap: () {

                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Catlgonline()));

                  },
                ),
                new Divider(),
                new ListTile(
                    leading: new Icon(Icons.contacts), title: Text('Base Líquida TimeWise® Acabamento Luminoso'),
                  onTap: () {

                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Baseluminoso()));

                  },
                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts), title: Text('Base At Play'),
                  onTap: () {

                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Baseatplay()));

                  },
                ),
              ]),
            )),
      ),
    );
  }


}