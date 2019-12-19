import 'package:daewoo/models/platoModel.dart';
import 'package:daewoo/widgets/hornosWidget.dart';
import 'package:daewoo/widgets/preparacionWidget.dart';
import 'package:daewoo/widgets/videoWidget.dart';
import 'package:flutter/material.dart';
import 'package:daewoo/animations/fadeAnimation.dart';
import 'package:daewoo/widgets/headerWidget.dart';

class RecetaScreen extends StatefulWidget {

  final PlatoModel plato;

  RecetaScreen({Key key, @required this.plato}) : super(key: key);

  @override
  _RecetaScreenState createState() => _RecetaScreenState();
}

class _RecetaScreenState extends State<RecetaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            FadeAnimation(1.4, HeaderWidget()),
            FadeAnimation(1.4, VideoWidget(plato: widget.plato)),
            Flexible( child: PreparacionWidget(plato: widget.plato)),
            FadeAnimation(1.4, HornosWidget())
        ])));
  }
}