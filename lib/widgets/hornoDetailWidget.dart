import 'package:daewoo/models/hornoModel.dart';
import 'package:flutter/material.dart';

class HornoDetailWidget extends StatelessWidget {
  final HornoModel horno;

  HornoDetailWidget({Key key, @required this.horno}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            foregroundDecoration: BoxDecoration(color: Colors.black26),
            height: 300,
            child: Image.network(horno.imagen, fit: BoxFit.contain)),
        SingleChildScrollView(
          padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 250),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  horno.nombre,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: <Widget>[
                  const SizedBox(width: 16.0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Text(
                      horno.modelo,
                      style: TextStyle(color: Colors.white, fontSize: 13.0),
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(32.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(horno.dimensiones,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0)),
                              Text.rich(
                                TextSpan(children: [
                                  WidgetSpan(
                                      child: Icon(
                                    Icons.panorama_wide_angle,
                                    size: 16.0,
                                    color: Colors.grey,
                                  )),
                                  TextSpan(text: "Ancho x Alto x Fondo")
                                ]),
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12.0),
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Text(horno.capacidad.toString() + "Lt.",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0)),
                            Text(
                              "Capacidad",
                              style:
                                  TextStyle(fontSize: 12.0, color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        color: Colors.red,
                        textColor: Colors.white,
                        child: Text(
                          "Descargar Ficha Técnica",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 32.0,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    _buildEspecificaciones(horno)
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildEspecificaciones(HornoModel horno) {
    final List<Widget> esp = [];
    horno.informacion.forEach((x) {
      esp.add(SizedBox(
        height: 10.0,
      ));
      esp.add(Text(
        x,
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
      ));
    });
    return Column(children: esp);
  }
}
