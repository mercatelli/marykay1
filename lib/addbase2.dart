import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'globals.dart' as globals;
import 'board.dart';
import 'package:marykay1/produtos/catlgonline.dart';



class AddBase2 extends StatefulWidget {
  @override
  _AddBase2State createState() => _AddBase2State();
}

class _AddBase2State extends State<AddBase2> {
  double price = 0.0;
  double result = 0.0;
  String _finalResult = "";
  int counter = 0;
  double custo = 0.0;
  double estoqueupdate = 0.0;
  Color myColor = Color(0xffFFE2F1);

  List<Board> boardMessages2 = List();
  Board board2;
  final FirebaseDatabase database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DatabaseReference databaseReference;

  @override
  void initState() {
    super.initState();

    board2 = Board("", "", "");
    databaseReference = database.reference().child("kely").child('${globals.carreganame}');
    databaseReference.onChildAdded.listen(_onEntryAdded2);
    databaseReference.onChildChanged.listen(_onEntryChanged2);
  }

  openAlertBox() {
    double custo = double.parse(globals.carregavalor) * 0.60;


    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 99999,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        globals.carreganame,
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Container(
                    height: 300,
                    child: Column(
                      children: <Widget>[
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Form(
                                  key: formKey,
                                  child: Row(
                                    children: <Widget>[


                                      Flexible(
                                        child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            initialValue: '${custo.toStringAsFixed(2)}',
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.black,
                                                      width: 1.0),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10.0),
                                                ),
                                                contentPadding:
                                                EdgeInsets.all(10))),
                                      ),


                                      Flexible(
                                        child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            initialValue: globals.carregavalor,
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.black,
                                                      width: 1.0),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10.0),
                                                ),
                                                contentPadding:
                                                EdgeInsets.all(10))),
                                      ),


                                      Flexible(
                                        child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            initialValue: '$counter',
                                            onSaved: (val) => board2.qtd = val,
                                            validator: (val) => val == "" ? val : null,
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.black,
                                                      width: 1.0),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10.0),
                                                ),
                                                contentPadding:
                                                EdgeInsets.all(10))),
                                      ),


                                      Flexible(
                                        child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            initialValue: '$result',
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.black,
                                                      width: 1.0),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10.0),
                                                ),
                                                contentPadding:
                                                EdgeInsets.all(10))),
                                      ),



                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: new Text(
                                  'Preço de Custo',
                                  style: new TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 13.0),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: new Text(
                                  'Preço de Venda',
                                  style: new TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 13.0),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: new Text(
                                  '  Quantidade  ',
                                  style: new TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 13.0),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: new Text(
                                'CONFIRME SEU PREÇO DE CUSTO!',
                                style: new TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        color: myColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child: Center(
                        child: ButtonBar(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            FlatButton(
                              child: Text('  CANCELAR  '),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            FlatButton(
                                child: Text('       OK       '),
                                onPressed: handleSubmit2),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _calculatePLUS() {
    setState(() {
      double price = double.parse(globals.carregavalor);

      if (counter >= 0) {
        counter++;
        print(counter);

        if ((price > 0) && (counter > 0)) {
          result = counter * price;
        } // our BMI

        //Do the reading

      } else {
        result = 0.0;
      }
    });

    _finalResult = "$counter ITEM(S) = R\$${result.toStringAsFixed(2)}";
  }

  void _calculateMINUS() {
    setState(() {
      double price = double.parse(globals.carregavalor);

      if (counter >= 0) {
        counter--;
        print(counter);

        if ((price > 0) && (counter >= 0)) {
          result = counter * price;
        } // our BMI

        else if (counter < 0) {
          counter = 0;
        }

        //Do the reading

      } else {
        result = 0.0;
      }
    });

    _finalResult = "$counter ITEM(S) = R\$${result.toStringAsFixed(2)}";
  }

  void handleSubmit2() {




    setState(() {


      database
          .reference()
          .child("kely")
          .child('${globals.carreganame}')
          .child("qtd")
          .once()
          .then((DataSnapshot snapshot) {
        var data = snapshot.value.toString();

        globals.estoque = data;




        //      print('snapshot inicial $data');
        //    globals.estoqueupdate = double.parse(data);
        //  print(' 1st estoque update transformou para double ${globals.estoqueupdate}');
        // String counterstring = counter.toString();
        //    globals.doublecounter = double.parse(counterstring);
        //      print("counter = ${globals.doublecounter}");
        //      globals.novoestoque = globals.estoqueupdate + globals.doublecounter;
//        print('novoestoque antes do else = ${globals.novoestoque}');





      });


      // LI



      if

// tratar a abertura do app aqui que é sempre null

      ((globals.estoque == null))  {     // BOARD2.QTD SEMPRE É NULL PELO QUE VI


        database.reference().child("kely").child('${globals.carreganame}').child("qtd")
            .once()
            .then((DataSnapshot snapshot) {
          String data = snapshot.value;
          print("null porra $data");


          if (data == null) {
            print("estoque atual ${globals.estoque}");

            data = '0';
            print(data);
            globals.estoqueupdate = double.parse(data);
            String counterstring = counter.toString();
            globals.doublecounter = double.parse(counterstring);
            print("counter = ${globals.doublecounter}");
            globals.novoestoque = globals.estoqueupdate + globals.doublecounter;
            database.reference().child("kely")
                .child('${globals.carreganame}')
                .set(
                {"qtd": "$counter",
                  "subject" : "${globals.carreganame}",
                });
          }

          else if (data != null) {


            globals.estoqueupdate = double.parse(data);
            String counterstring = counter.toString();
            globals.doublecounter = double.parse(counterstring);
            print("counter = ${globals.doublecounter}");
            globals.novoestoque = globals.estoqueupdate + globals.doublecounter;



            database.reference().child("kely").child('${globals.carreganame}').set(
                {"qtd": "${globals.novoestoque.toStringAsFixed(0)}",
                  "subject" : "${globals.carreganame}",
                });
            print("NOVOESTOQUE É NULLO??? ${globals.novoestoque}");

          }





        });




      }




      else
      {

        print('abertura do else ${globals.novoestoque}');



        database.reference().child("kely").child('${globals.carreganame}').child("qtd")
            .once()
            .then((DataSnapshot snapshot) {
          String data = snapshot.value;
          print(' snapshot = $data');

          if (data == null){
            data = '0';
            globals.estoqueupdate = double.parse(data);
            String counterstring = counter.toString();
            globals.doublecounter = double.parse(counterstring);
            print("counter = ${globals.doublecounter}");
            globals.novoestoque = globals.estoqueupdate + globals.doublecounter;


            database.reference().child("kely").child('${globals.carreganame}').set(
                {"qtd": "${globals.novoestoque.toStringAsFixed(0)}",
                  "subject" : "${globals.carreganame}",
                });

            print('no finalmente ${globals.novoestoque}');
            globals.novoestoque = 0.00;
            print('novoestoque zerado???  ${globals.novoestoque}');
          }

          else {

            globals.estoqueupdate = double.parse(data);
            String counterstring = counter.toString();
            globals.doublecounter = double.parse(counterstring);
            print("counter = ${globals.doublecounter}");
            globals.novoestoque = globals.estoqueupdate + globals.doublecounter;


            database.reference().child("kely").child('${globals.carreganame}').set(
                {"qtd": "${globals.novoestoque.toStringAsFixed(0)}",
                  "subject" : "${globals.carreganame}",
                });

            print('no finalmente ${globals.novoestoque}');
            globals.novoestoque = 0.00;
            print('novoestoque zerado???  ${globals.novoestoque}');


          }

        });

      }


    });
  }

  void _onEntryAdded2(Event event) {
    setState(() {
      boardMessages2.add(Board.fromSnapshot(event.snapshot));
    });
  }

  void _onEntryChanged2(Event event) {
    var oldEntry = boardMessages2.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      boardMessages2[boardMessages2.indexOf(oldEntry)] =
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
                builder: (BuildContext context) => Catlgonline()));

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
                  title: Text('${globals.carreganame}'),
                  onTap: () {},
                ),
                new Divider(),
                new ListTile(
                    title: Text('Valor: R\$: ${globals.carregavalor}')),
                new Divider(),
                new ListTile(title: Text(_finalResult)),
                new Divider(),
                new ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: Text('Remove Items'),
                      onPressed: _calculateMINUS,
                    ),
                    RaisedButton(
                      color: Colors.green,
                      child: Text('Add Items'),
                      onPressed: _calculatePLUS,
                    ),
                  ],
                ),
                new Divider(),
                new ButtonBar(
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.orange,
                      child: Text('Adicionar ao estoque'),
                      shape: Border.all(
                          color: Colors.black,
                          width: 1.0,
                          style: BorderStyle.solid),
                      onPressed: openAlertBox,
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
