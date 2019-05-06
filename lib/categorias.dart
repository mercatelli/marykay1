import 'package:flutter/material.dart';
import 'bases.dart';
import 'batons.dart';
import 'produtos/perfeminino.dart';
import 'produtos/cuidados3d.dart';
import 'produtos/cuidadosidade.dart';
import 'produtos/cuidadoscorpo.dart';
import 'produtos/cuidadosrepair.dart';
import 'produtos/cuidadoslabios.dart';
import 'produtos/cuidadospersonal.dart';
import 'produtos/botanicaleffects.dart';
import 'produtos/mkmen.dart';
import 'produtos/clearproof.dart';
import 'produtos/satincorpo.dart';
import 'produtos/satinmaos.dart';
import 'produtos/linhasolar.dart';
import 'produtos/mascaracilios.dart';
import 'produtos/cccream.dart';
import 'produtos/corretivoperfecting.dart';
import 'produtos/brilholabios.dart';
import 'produtos/lapisretratil.dart';
import 'produtos/blushmineral.dart';
import 'produtos/delineadores.dart';
import 'produtos/cuidadospersonal2.dart';
import 'produtos/lapisolhos.dart';
import 'produtos/pobronzilumi.dart';
import 'produtos/pomineral.dart';
import 'produtos/posolto.dart';
import 'produtos/sobrancelhas.dart';
import 'produtos/sombra.dart';
import 'produtos/paleta.dart';
import 'produtos/esponjas.dart';
import 'produtos/pinceis.dart';
import 'produtos/pinceis2.dart';
import 'produtos/lipblush.dart';
import 'produtos/trio.dart';
import 'produtos/perfmasc.dart';
import 'produtos/renaissance.dart';
import 'produtos/propalette.dart';
import 'produtos/estojos.dart';
import 'produtos/bastoes.dart';
import 'estoqueatual.dart';


class Categorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){

        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => Estoqueatual()));

      },
      child: Scaffold(
        appBar: new AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Estoqueatual()));
            },
          ),
          title: new Text('Categorias'),
          backgroundColor: const Color(0xffFFC1D9),
        ),
        body: new Container(
            alignment: Alignment.topCenter,
            color: const Color(0xffFFE2F1),
            child: new Container(
              margin: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              width: 900,
              // limited by EdgeInsets horizontal: 35.0, you can put 40000 it's OK.
              height: 999.0,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: new BorderRadius.vertical(
                    bottom: new Radius.circular(20.0),
                  )),
              child: new ListView(children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Bases'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Bases()));
                  },
                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Batons'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Batons()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Cuidados com a Pele TimeWise 3D®'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Cuidados3d()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Cuidados Anti-idade para o Rosto'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Cuidadosidade()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Cuidados Anti-idade para o Corpo'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Cuidadoscorpo()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Cuidados com a Pele TimeWise Repair™'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Cuidadosrepair()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Cuidados Personalizados - Lábios'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Cuidadoslabios()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Cuidados Personalizados - Rosto e Corpo'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Cuidadospersonal()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Botanical Effects®'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Botanicaleffects()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('MKMen®'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Mkmen()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Clear Proof™'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Clearproof()));
                  },
                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Cuidados com o Corpo - Satin'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Satincorpo()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Satin Hands®'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Satinmaos()));
                  },

                ),


                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Linha Solar'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Linhasolar()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Máscara para os Cílios'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Mascaracilios()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('CC Cream'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Cccream()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Corretivo Perfecting Concealer Mary Kay®'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Corretivoperfecting()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Brilho para os Lábios NouriShine Plus®'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Brilholabios()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Lápis Retrátil para os Lábios'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Lapisretratil()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Blush Mineral'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Blushmineral()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Delineadores'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Delineadores()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Cuidados Personalizados'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Cuidadospersonal2()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Lápis Retrátil para os Olhos'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Lapisolhos()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Pó Bronzeador & Pó Iluminador'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Pobronzilumi()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Pó Mineral Compacto'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Pomineral()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Pó Solto Translúcido'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Posolto()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Sobrancelhas'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Sobrancelhas()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Sombra Chromafusion™ Mary Kay'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Sombra()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Paleta Chromafusion™ Mary Kay'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Paleta()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Estojos'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Estojos()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Esponjas'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Esponjas()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Novos Pinceis Mary Kay®'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Pinceis()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Pinceis Mary Kay'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Pinceis2()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Lip & Blush'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Lipblush()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Trio de Sombras Mary Kay At Play®'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Trio()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Perfumes Femininos'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Perfeminino()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Perfumes Masculinos'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Perfmasc()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Renaissance Revival Mary Kay® - Edição Limitada'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Renaissance()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Pro Palette - Edição Especial'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Propalette()));
                  },

                ),

                new Divider(),
                new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: Text('Bastões at Play'),
                  onTap: () {Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Bastoes()));
                  },

                ),


              ]),
            )),
      ),
    );
  }
}