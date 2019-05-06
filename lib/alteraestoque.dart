import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'globals.dart' as globals;
import 'board.dart';
import 'estoqueatual.dart';


class Alteraestoque extends StatefulWidget {
  @override
  _AlteraestoqueState createState() => _AlteraestoqueState();
}

class _AlteraestoqueState extends State<Alteraestoque> {
  double price = 0.0;
  double result = 0.0;
  String _finalResult = "";
  int counter = int.parse(globals.carregaqtd, radix:10);
  double custo = 0.0;
  double estoqueupdate = 0.0;
  Color myColor = Color(0xffFFE2F1);

  List<Board> boardMessages = List();
  Board board;
  final FirebaseDatabase database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DatabaseReference databaseReference;

  @override
  void initState() {
    super.initState();

    board = Board("", "", "");
    databaseReference = database.reference().child("kely");
    databaseReference.onChildAdded.listen(_onEntryAdded2);
    databaseReference.onChildChanged.listen(_onEntryChanged2);

    database.reference().child("kely").once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key,values) {
        values["subject"] = List();
      });
    });

  }



  void _calculatePLUS() {
    setState(() {



      if (counter >= 0) {
        counter++;
        print("$counter");
        globals.carregaqtd = counter.toString();


      } else {
        result = 0.0;
      }
    });

    _finalResult = "$counter ITEM(S) = R\$${result.toStringAsFixed(2)}";
  }

  void _calculateMINUS() {
    setState(() {



      if (counter >= 0) {
        counter--;
        print("$counter");
        globals.carregaqtd = counter.toString();


        if (counter < 0) {
          counter = 0;
          print("$counter");
          globals.carregaqtd = counter.toString();
        }


      } else {
        result = 0.0;
      }
    });

    _finalResult = "$counter ITEM(S) = R\$${result.toStringAsFixed(2)}";
  }


  void _onEntryAdded2(Event event) {
    setState(() {
      boardMessages.add(Board.fromSnapshot(event.snapshot));
    });
  }

  void _onEntryChanged2(Event event) {
    var oldEntry = boardMessages.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      boardMessages[boardMessages.indexOf(oldEntry)] =
          Board.fromSnapshot(event.snapshot);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Estoqueatual()));
          },
        ),
        title: Text('Produto'),
        backgroundColor: const Color(0xffFFC1D9),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        color: const Color(0xffFFE2F1),
        child: new ListView(
          children: <Widget>[
            new Container(
              margin: new EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
              width:
              400, // limited by EdgeInsets horizontal 35.0, you can put 40000 it's OK.
              height: 65.0,
              decoration: BoxDecoration(
                  color: const Color(0xffFFAACB),
                  borderRadius: new BorderRadius.vertical(
                    top: new Radius.circular(20.0),
                  )),
              child: new Column(
                children: <Widget>[
                  new ListTile(
                    title: Text('Informações'),
                  ),
                ],
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              width:
              400, // limited by EdgeInsets horizontal 35.0, you can put 40000 it's OK.
              height: 480.0,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: new BorderRadius.vertical(
                    bottom: new Radius.circular(20.0),
                  )),
              child: new Column(children: <Widget>[
                new ListTile(
                  title: Text("${globals.carreganame}"),
                  onTap: () {},
                ),
                new Divider(),
                new ListTile(
                    title: Text('Valor: R\$: ${globals.carregavalor}')),
                new Divider(),
                new ButtonBar(
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.red,
                      child: Text('Remove'),
                      shape: BeveledRectangleBorder(side: const BorderSide(width: 0.66, style: BorderStyle.solid, color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),),
                      onPressed: _calculateMINUS,
                    ),
                    FlatButton(
                      child: Text('${globals.carregaqtd}'),
                      shape: BeveledRectangleBorder(side: const BorderSide(width: 0.66, style: BorderStyle.solid, color: Colors.black),
      borderRadius: BorderRadius.circular(10.0),),

                    ),
                    RaisedButton(
                      color: Colors.green,
                      shape: BeveledRectangleBorder(side: const BorderSide(width: 0.66, style: BorderStyle.solid, color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),),
                      child: Text('Add'),
                      onPressed: _calculatePLUS,
                    ),
                  ],
                ),

                new Divider(),
                new ButtonBar(
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.orange,
                      child: Text('Confirmar'),
                      shape: BeveledRectangleBorder(side: const BorderSide(width: 0.66, style: BorderStyle.solid, color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),),
                      onPressed: (){

                        if (globals.carregaqtd == "0") {
                          database.reference().child("kely").child('${globals.carreganame}').remove();
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Estoqueatual()));

                        }

                        else {
                          database.reference().child("kely").child(
                              '${globals.carreganame}').set(
                              {"qtd": "${globals.carregaqtd}",
                                "subject": "${globals.carreganame}",
                                "body": "${globals.carregavalor}",
                              });

                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Estoqueatual()));
                        }


                      },
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
