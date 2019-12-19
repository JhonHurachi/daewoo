import 'package:daewoo/screens/recetaScreen.dart';
import 'package:flutter/material.dart';
import 'package:daewoo/models/platoModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:page_transition/page_transition.dart';

class Recetas extends StatelessWidget {

  final String tipo;

  Recetas({Key key, @required this.tipo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 28),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(tipo,
                  style: TextStyle(
                      color: Color(0xFFF072939),
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Container(
                  height: 350,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('recetas')
                        .where('tipo', isEqualTo: tipo)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError)
                        return new Text('Error: ${snapshot.error}');
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return new Text('Loading...');
                        default:
                          return new ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              final document = snapshot.data.documents[index];
                              return platoItem(PlatoModel(
                                  descripcion: document['descripcion'],
                                  id: document['id'],
                                  imagen: document['imagen'],
                                  video: document['video'],
                                  tipo: document['tipo'],
                                  subtipo: document['subtipo'],
                                  tiempo: document['tiempo'],
                                  nombre: document['nombre'],
                                  personas: document['personas'],
                                  favoritos: document['favoritos'],
                                  ingredientes: document['ingredientes'],
                                  preparacion: document['preparacion']), context);
                            },
                          );
                      }
                    },
                  ))
            ]));
  }

  Widget platoItem(PlatoModel plato, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(right: 20),
        width: 220,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xFFF082938)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                width: 220,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(plato.imagen), fit: BoxFit.cover)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.favorite, color: Colors.red, size: 32),
                    ),
                    SizedBox(height: 168),
                    Text(plato.nombre,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text(plato.descripcion,
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                    SizedBox(height: 20)
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 49,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Información general",
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      infoIcon(Icons.people, plato.personas.toString()),
                      SizedBox(width: 7),
                      infoIcon(Icons.timelapse, plato.tiempo),
                      SizedBox(width: 7),
                      infoIcon(
                          Icons.favorite, plato.favoritos.toString()),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.pushReplacement(context, PageTransition(
            type: PageTransitionType.scale,
            child: RecetaScreen(plato: plato)
          ));
      },
    );
  }

  Widget infoIcon(IconData iconData, String text) {
    return Row(
      children: <Widget>[
        Icon(iconData, color: Colors.white),
        SizedBox(width: 2),
        Text(text, style: TextStyle(color: Colors.white))
      ],
    );
  }
}
