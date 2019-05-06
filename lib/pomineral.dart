import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:marykay1/board.dart';
import 'package:marykay1/globals.dart' as globals;
import 'package:marykay1/adicionaestoque.dart';
import 'package:marykay1/categorias.dart';



class Pomineral extends StatefulWidget {
  @override
  _PomineralState createState() => new _PomineralState();
}

class _PomineralState extends State<Pomineral> {


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
    databaseReference = database.reference().child("Pomineral");
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
          title: new Text("Pó Mineral Compacto"),
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

                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Adicionaestoque()));


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