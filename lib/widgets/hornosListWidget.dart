import 'package:daewoo/models/hornoModel.dart';
import 'package:daewoo/screens/hornoDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:page_transition/page_transition.dart';

class HornosListWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 28),
        child: Container(
                  height: MediaQuery.of(context).copyWith().size.height,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('hornos')
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
                            scrollDirection: Axis.vertical,
                            physics: BouncingScrollPhysics(),
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              final document = snapshot.data.documents[index];
                              return _getItemUI(HornoModel(
                                  id: document['id'],
                                  nombre: document['nombre'],
                                  modelo: document['modelo'],
                                  capacidad: document['capacidad'],
                                  peso: document['peso'],
                                  informacion: document['informacion'],
                                  imagen: document['imagen'],
                                  archivo: document['archivo'],
                                  dimensiones: document['dimensiones']), context);
                            },
                          );
                      }
                    },
                  ))
            );
  }

  Widget _getItemUI(HornoModel horno, BuildContext context) {
  return new Card(
      child: new Column(
    
    children: <Widget>[
      new ListTile(
        leading: new Image.network(
          horno.imagen,
          fit: BoxFit.cover,
          width: 100.0,
        ),
        title: new Text(
          horno.nombre,
          style: new TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
        subtitle: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(horno.modelo,
                  style: new TextStyle(
                      fontSize: 13.0, fontWeight: FontWeight.normal)),
              new Text('Capacidad: ${horno.capacidad} Lt',
                  style: new TextStyle(
                      fontSize: 11.0, fontWeight: FontWeight.normal)),
            ]),
        //trailing: ,
        onTap: () {
        Navigator.pushReplacement(context, PageTransition(
            type: PageTransitionType.scale,
            child: HornoDetailScreen(horno: horno)
          ));
      },
      )
    ],
  ));
}

  Widget hornoItem(HornoModel horno, BuildContext context) {

final card = Container(
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(horno.imagen),
            placeholder: AssetImage('assets/images/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.contain,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(horno.modelo),
          ),
                SizedBox(height: 100),
        ],
      ),
    );
    final cardImage =  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Color(0xFFF072939),
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 20.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );

    return InkWell(
      child: cardImage,
      onTap: () {
        Navigator.pushReplacement(context, PageTransition(
            type: PageTransitionType.scale,
            child: HornoDetailScreen(horno: horno)
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
