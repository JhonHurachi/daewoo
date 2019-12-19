import 'package:daewoo/models/tipModel.dart';
import 'package:daewoo/screens/tipDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:page_transition/page_transition.dart';

class TipsListWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 28),
        child: Container(
                  height: MediaQuery.of(context).copyWith().size.height,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('tips')
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
                              return _getItemUI(TipModel(
                                  id: document['id'],
                                  imagen: document['imagen'],
                                  titulo: document['titulo'],
                                  video: document['video']), context);
                            },
                          );
                      }
                    },
                  ))
            );
  }

  Widget _getItemUI(TipModel tip, BuildContext context) {
  return new Card(
      child: new Column(
    
    children: <Widget>[
      new ListTile(
        leading: new Image.network(
          tip.imagen,
          fit: BoxFit.cover,
          width: 100.0,
        ),
        title: new Text(
          tip.titulo,
          style: new TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
        //trailing: ,
        onTap: () {
        Navigator.pushReplacement(context, PageTransition(
            type: PageTransitionType.scale,
            child: TipDetailScreen(tip: tip)
          ));
      },
      )
    ],
  ));
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
