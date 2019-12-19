import 'package:cached_network_image/cached_network_image.dart';
import 'package:daewoo/models/hornoModel.dart';
import 'package:daewoo/screens/hornoDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:page_transition/page_transition.dart';

class HornosWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      color: Colors.white,
      child: Container(
          height: 80,
          padding: EdgeInsets.all(10.0),
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('hornos').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                      return hornoItem1(
                          HornoModel(
                              id: document['id'],
                              nombre: document['nombre'],
                              modelo: document['modelo'],
                              capacidad: document['capacidad'],
                              peso: document['peso'],
                              informacion: document['informacion'],
                              imagen: document['imagen'],
                              archivo: document['archivo'],
                              dimensiones: document['dimensiones']),
                          context);
                    },
                  );
              }
            },
          )),
    );
  }

  Widget hornoItem(HornoModel horno, BuildContext context) {
    return InkWell(
      child: Container(
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: CachedNetworkImageProvider(horno.imagen),
                  fit: BoxFit.cover))),
      onTap: () {
        Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.scale,
                child: HornoDetailScreen(horno: horno)));
      },
    );
  }

   Widget hornoItem1(HornoModel horno, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(right: 20),
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xFFF082938)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                width: 100,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(horno.imagen), fit: BoxFit.cover)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Text(horno.modelo,
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.scale,
                child: HornoDetailScreen(horno: horno)));
      },
    );
  }
}
