import 'package:firebase_database/firebase_database.dart';


class Board {
  String key;
  String subject;
  String body;
  String qtd;

  Board(this.subject, this.body, this.qtd);

  Board.fromSnapshot(DataSnapshot snapshot) :
        key = snapshot.key,
        subject = snapshot.value["subject"],
        body = snapshot.value["body"],
        qtd = snapshot.value["qtd"];

  toJson() {
    return {
      "subject": subject,
      "body" : body,
      "qtd" : qtd,

    };
  }



}