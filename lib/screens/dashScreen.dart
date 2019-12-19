import 'package:daewoo/widgets/hornosWidget.dart';
import 'package:flutter/material.dart';
import 'package:daewoo/animations/fadeAnimation.dart';
import 'package:daewoo/widgets/headerWidget.dart';
import 'package:daewoo/widgets/recetasWidget.dart';

class DashScreen extends StatefulWidget {
  @override
  _DashScreenState createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {

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
                SizedBox(height: 100),
                FadeAnimation(1.8, Recetas(tipo: 'Entradas')),
                SizedBox(height: 20),
                FadeAnimation(1.8, Recetas(tipo: 'Platos de Fondo')),
                SizedBox(height: 20),
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
            bottom: .0,
            right: .0,
            left: .0,
            child: FadeAnimation(1.4, HornosWidget()),
          )
        ]))
        );
  }
}
