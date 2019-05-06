import 'dart:io';
import 'produtos/catalogototal.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'estoqueatual.dart';
import 'categorias.dart';
import 'alteraestoque.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
//import 'addbase2.dart';
//import 'board.dart';
//import 'globals.dart' as globals;
//import 'estoqueatual.dart';


void main() {
  runApp(
      new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mary Kay',
        home: new MaryKay01(),
      )
  );
}



final FirebaseDatabase database = FirebaseDatabase.instance;

class MaryKay01 extends StatefulWidget {
  @override
  _MaryKay01State createState() => _MaryKay01State();
}

class _MaryKay01State extends State<MaryKay01> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: new AppBar(
          title: new Text('Mary Kay'),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.home), onPressed: () {}),
          ],
          backgroundColor: const Color(0xffFFC1D9),
        ),
        drawer: new Drawer(
          child: new Container(
            color: const Color(0xffFFE2F1),
            child: new ListView(
              children: <Widget>[
                new Container(
                  child: new DrawerHeader(
                  ),
                  color: const Color(0xffFFC1D9),
                ),
                new ListTile(
                  leading: new Icon(Icons.face),
                  title: Text('Clientes'),
                  onTap: () {},
                ),
                new ListTile(
                  leading: new Icon(Icons.assignment),
                  title: Text('Produtos'),
                  onTap: () {},
                ),
                new ListTile(
                  leading: new Icon(Icons.sentiment_very_satisfied),
                  title: Text('Vendas - estoque'),
                  onTap: () {},
                ),
                new ListTile(
                  leading: new Icon(Icons.sentiment_satisfied),
                  title: Text('Vendas - catálogo'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        body: new Container(
          alignment: Alignment.topCenter,
          color: const Color(0xffFFE2F1),
          child: new ListView(
            children: <Widget>[
              new Container(
                margin: new EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                width: 400,
                // limited by EdgeInsets horizontal 35.0, you can put 40000 it's OK.
                height: 65.0,
                decoration: BoxDecoration(
                    color: const Color(0xffFFAACB),
                    borderRadius: new BorderRadius.vertical(
                      top: new Radius.circular(20.0),
                    )),
                child: new Column(
                  children: <Widget>[
                    new ListTile(
                      title: Text('ESTOQUE'),
                    ),
                  ],
                ),
              ),
              new Container(
                margin: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                width: 400,
                // limited by EdgeInsets horizontal 35.0, you can put 40000 it's OK.
                height: 280.0,
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: new BorderRadius.vertical(
                      bottom: new Radius.circular(20.0),
                    )),
                child: new Column(
                  children: <Widget>[
                    new ListTile(
                      title: Text('MEU ESTOQUE'),
                      onTap: (){

                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Estoqueatual()));

                      },
                    ),
                    new Divider(),
                    new ListTile(
                      title: Text('Catalogo Total'),
                      onTap: (){




                      },
                    ),
                    new Divider(),
                    new ListTile(title: Text('')),
                    new Divider(),
                    new ListTile(title: Text('')),
                  ],
                ),
              ),
              new Container(
                margin: new EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                width: 400,
                // limited by EdgeInsets horizontal 35.0, you can put 40000 it's OK.
                height: 65.0,
                decoration: BoxDecoration(
                    color: const Color(0xffFFAACB),
                    borderRadius: new BorderRadius.vertical(
                      top: new Radius.circular(20.0),
                    )),
                child: new Column(
                  children: <Widget>[
                    new ListTile(
                      title: Text('VENDAS'),
                    ),
                  ],
                ),
              ),
              new Container(
                margin: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                width: 400,
                // limited by EdgeInsets horizontal 35.0, you can put 40000 it's OK.
                height: 280.0,
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: new BorderRadius.vertical(
                      bottom: new Radius.circular(20.0),
                    )),
                child: new Column(
                  children: <Widget>[
                    new ListTile(
                      title: Text(''),
                    ),
                    new Divider(),
                    new ListTile(title: Text('')),
                    new Divider(),
                    new ListTile(title: Text('')),
                    new Divider(),
                    new ListTile(title: Text('')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Você quer sair do app?"),
          actions: <Widget>[
            FlatButton(
              child: Text("Não"),
              onPressed: ()=>Navigator.pop(context,false),
            ),
            FlatButton(
              child: Text("Sim"),
              onPressed: () => exit(0),
            )
          ],
        )
    );
  }


}



