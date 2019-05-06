import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:marykay1/board.dart';
import 'package:marykay1/globals.dart' as globals;
import 'package:marykay1/adicionaestoque.dart';
import 'package:marykay1/categorias.dart';
import 'package:marykay1/estoqueatual.dart';

class Alertdialog01 extends StatefulWidget {
  @override
  _Alertdialog01State createState() => _Alertdialog01State();
}

class _Alertdialog01State extends State<Alertdialog01> {
  double price = 0.0;
  double result = 0.0;
  int counter = int.parse(globals.carregaqtd, radix:10);
  double custo = 0.0;
  double estoqueupdate = 0.0;
  Color myColor = Color(0xffFFE2F1);


  List<Board> boardMessages = List();
  Board board;
  final FirebaseDatabase database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DatabaseReference databaseReference;
  DatabaseReference databaseReference2;



  @override
  void initState() {
    super.initState();

    board = Board("", "", "");
    databaseReference = database.reference().child("Cuidados3D");
    databaseReference.onChildAdded.listen(_onEntryAdded);
    databaseReference.onChildChanged.listen(_onEntryChanged);


  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      contentPadding: EdgeInsets.only(top: 10.0),
      content: Container(
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
              ButtonTheme(
                minWidth: 50.0,
                height: 36.0,
                child: RaisedButton(
                  color: Colors.red,
                  shape: BeveledRectangleBorder(side: const BorderSide(width: 0.36, style: BorderStyle.solid, color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),),
                  child: Text('—'),
                  onPressed: (){

                    setState(() {

                      int counter = int.parse(globals.carregaqtd, radix:10);

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


                  },
                ),
              ),
              FlatButton(
                child: Text('${globals.carregaqtd}'),
                shape: BeveledRectangleBorder(side: const BorderSide(width: 0.36, style: BorderStyle.solid, color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0),),

              ),
              ButtonTheme(
                minWidth: 50.0,
                height: 36.0,
                child: RaisedButton(
                  color: Colors.green,
                  shape: BeveledRectangleBorder(side: const BorderSide(width: 0.66, style: BorderStyle.solid, color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),),
                  child: Text('+'),
                  onPressed: (){

                    setState(() {

                      int counter = int.parse(globals.carregaqtd, radix:10);

                      if (counter >= 0) {
                        counter++;
                        print("$counter");
                        globals.carregaqtd = counter.toString();


                      } else {
                        result = 0.0;
                      }
                    });


                  },
                ),
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

                  }


                },
              ),
            ],
          ),
          new Divider(),
        ]),
      ),
    );
  }

  void _onEntryAdded(Event event) {
    setState(() {
      boardMessages.add(Board.fromSnapshot(event.snapshot));
    });
  }


  void _onEntryChanged(Event event) {
    var oldEntry = boardMessages.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      boardMessages[boardMessages.indexOf(oldEntry)] =
          Board.fromSnapshot(event.snapshot);
    });
  }


}



class Lapisolhos extends StatefulWidget {
  @override
  _LapisolhosState createState() => new _LapisolhosState();
}

class _LapisolhosState extends State<Lapisolhos> {


  List<Board> boardMessages = List();
  Board board;
  final FirebaseDatabase database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DatabaseReference databaseReference;
  DatabaseReference databaseReference2;



  @override
  void initState() {
    super.initState();

    board = Board("", "", "");
    databaseReference = database.reference().child("Lapisolhos");
    databaseReference.onChildAdded.listen(_onEntryAdded);
    databaseReference.onChildChanged.listen(_onEntryChanged);


  }




  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){

        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => Categorias()));

      },
      child: new Scaffold(
        appBar: new AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Categorias()));
            },
          ),
          title: new Text("Lápis Retrátil para os Olhos"),
          backgroundColor: const Color(0xffFFC1D9),
        ),
        body: Column(
          children: <Widget>[
            Flexible(
              child: FirebaseAnimatedList(
                query: databaseReference,
                itemBuilder: (_, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  return new Card(
                    child: ListTile(
                      leading: Icon(Icons.add_circle),
                      title: Text(boardMessages[index].subject),
                      subtitle: Text(boardMessages[index].body),
                      onTap: (){

                        setState((){
                          globals.carreganame = boardMessages[index].subject;
                          globals.carregavalor = boardMessages[index].body;
                        });

                        database.reference().child("kely").child('${globals.carreganame}').child('qtd').once().then((DataSnapshot snapshot){
                          String quantidade = snapshot.value;
                          print(quantidade);
                          setState((){
                            globals.carregaqtd = quantidade;
                          });

                          if (quantidade == null) {quantidade = '0';
                          setState((){
                            globals.carregaqtd = quantidade;
                          });
                          print('${globals.carregaqtd}');


                          }

                        });

                        showDialog(
                            context: context,
                            builder: (_) {
                              return Alertdialog01();
                            });


                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }


  void handleSubmit() {
    final FormState form = formKey.currentState;
    if (form.validate()) {
      form.save();
      form.reset();
      //save form data to the database
      databaseReference.push().set(board.toJson());
    }
  }


  void _onEntryAdded(Event event) {
    setState(() {
      boardMessages.add(Board.fromSnapshot(event.snapshot));
    });
  }


  void _onEntryChanged(Event event) {
    var oldEntry = boardMessages.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      boardMessages[boardMessages.indexOf(oldEntry)] =
          Board.fromSnapshot(event.snapshot);
    });
  }
}