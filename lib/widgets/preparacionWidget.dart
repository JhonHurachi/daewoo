import 'package:daewoo/models/platoModel.dart';
import 'package:flutter/material.dart';

class PreparacionWidget extends StatelessWidget {

  final PlatoModel plato;

  PreparacionWidget({Key key, @required this.plato}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: <Widget>[
                Text(plato.nombre, style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600
                ),),
                SizedBox(height: 16.0,),
                Text(plato.descripcion),
                SizedBox(height: 20.0,),
                Container(
                  height: 30,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.people),
                            SizedBox(width: 5.0,),
                            Text(plato.personas.toString())
                          ],
                        ),
                      ),
                      VerticalDivider(),
                      Expanded(
                        child: Text(plato.subtipo, textAlign: TextAlign.center,),
                      ),
                      VerticalDivider(),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.timer),
                            SizedBox(width: 5.0,),
                            Text(plato.tiempo)
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
                _buildPreparacion(plato)              
              ],
            ),
          ),
        ],
    );
  }

  Widget _buildPreparacion(PlatoModel plato) {
    final List<Widget> pasos  = [];
    int index = 1;
    plato.preparacion.forEach((x) {
      pasos.add(SizedBox(height: 30.0,));
      pasos.add(
        _buildStep(
          leadingTitle: (index++).toString(),
          title: "Paso".toUpperCase(),
          content: x

        )
      );
    });
    return Column(children: pasos);
  }

  Widget _buildStep({String leadingTitle, String title, String content}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          color: Colors.red,
          child: Container(
            padding: EdgeInsets.all(5.0),
            child: Text(leadingTitle, style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.0
            )),
          ),
        ),
        SizedBox(width: 16.0,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title, style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0
              )),
              SizedBox(height: 10.0,),
              Text(content),
            ],
          ),
        )
      ],
    );
  }
}
