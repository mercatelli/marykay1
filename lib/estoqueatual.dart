import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'board.dart';
import 'globals.dart' as globals;
import 'alteraestoque.dart';
import 'categorias.dart';
import 'main.dart';
import 'package:material_search/material_search.dart';






class Estoqueatual extends StatefulWidget {
  @override
  _Estoqueatual createState() => new _Estoqueatual();
}

class _Estoqueatual extends State<Estoqueatual> {


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
    databaseReference.onChildAdded.listen(_onEntryAdded);
    databaseReference.onChildChanged.listen(_onEntryChanged);


    database.reference().child("kely").once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key,values) {
        values["subject"] = List();
      });
    });         // LISTA COM TODOS OS NOMES DAS BASES

  }






  final _names =  [
    '',
  ];



  String _name = 'No one';

  final _formKey = new GlobalKey<FormState>();

  _buildMaterialSearchPage(BuildContext context) {
    return new MaterialPageRoute<String>(
        settings: new RouteSettings(
          name: 'material_search',
          isInitialRoute: false,
        ),
        builder: (BuildContext context) {



          database.reference().child("kely").once().then((DataSnapshot snapshot){


            Map<dynamic, dynamic> map = snapshot.value;
            map.forEach((key,values) {_names.add(values["subject"]);

            });
          });


          return new Material(
            child: new MaterialSearch<String>(
              placeholder: 'Search',
              results: _names.map((String v) => new MaterialSearchResult<String>(
                icon: Icons.add_box,
                value: v,
                text: "$v",
              )).toList(),
              filter: (dynamic value, String criteria) {
                return value.toLowerCase().trim()
                    .contains(new RegExp(r'' + criteria.toLowerCase().trim() + ''));
              },
              onSelect: (dynamic value) {

                globals.carreganame = value;

                database.reference().child("kely").child(globals.carreganame).once().then((DataSnapshot snapshot){
                  Map<dynamic, dynamic> values = snapshot.value;
                  print(values["body"]);
                  globals.carregaqtd = values["qtd"];
                  globals.carregavalor = values["body"];


                });

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Alteraestoque()));

              },
              onSubmit: (String value) => Navigator.of(context).pop(value),
            ),
          );
        }
    );
  }

  _showMaterialSearch(BuildContext context) {
    Navigator.of(context)
        .push(_buildMaterialSearchPage(context))
        .then((dynamic value) {
      setState(() => _name = value as String);

    });
  }




  @override


  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: new Scaffold(
        appBar: new AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MaryKay01()));
            },
          ),
          title: new Text("Estoque da Kely"),
          backgroundColor: const Color(0xffFFC1D9),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                _names.clear();
                _showMaterialSearch(context);
              },
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
            onPressed: (){


              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Categorias()));


            },
        ),
        body: Column(
          children: <Widget>[
            Flexible(
              child: FirebaseAnimatedList(
                query: databaseReference,
                itemBuilder: (_, DataSnapshot snapshot,
                    Animation<double> animation, int index) {

                  Map<dynamic, dynamic> values = snapshot.value;

                  return new Card(

                    child: ListTile(
                      leading: Icon(Icons.add_circle),
                      title: Text(values["subject"]),    // variavel acima do return new card indispensável
                      subtitle: Text(boardMessages[index].qtd),
                      onTap: () {


                        setState((){
                          globals.carreganame = boardMessages[index].subject;
                          globals.carregaqtd = boardMessages[index].qtd;
                          globals.carregavalor = boardMessages[index].body;
                        });




                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Alteraestoque()));

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




  Future<bool> _onBackPressed() {
    Navigator.of(context).push(MaterialPageRoute(
  builder: (BuildContext context) => MaryKay01()));
}
}