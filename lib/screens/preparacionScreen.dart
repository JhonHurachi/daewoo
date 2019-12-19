import 'package:daewoo/models/platoModel.dart';
import 'package:daewoo/widgets/preparacionWidget.dart';
import 'package:daewoo/widgets/videoWidget.dart';
import 'package:flutter/material.dart';
import 'package:daewoo/animations/fadeAnimation.dart';
import 'package:daewoo/widgets/headerWidget.dart';

class PreparacionScreen extends StatefulWidget {

  final PlatoModel plato;

  PreparacionScreen({Key key, @required this.plato}) : super(key: key);

  @override
  _PreparacionScreenState createState() => _PreparacionScreenState();
}

class _PreparacionScreenState extends State<PreparacionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 200),
                FadeAnimation(1.8, PreparacionWidget(plato: widget.plato)),
              ],
            ),
          ),
          new Positioned(
            top: .0,
            right: .0,
            left: .0,
            child: FadeAnimation(1.4, HeaderWidget()),
          ),
          new Positioned(
            top: 100.0,
            right: .0,
            left: .0,
            child: FadeAnimation(1.4, VideoWidget(plato: widget.plato)),
          )
        ])));
  }
}
