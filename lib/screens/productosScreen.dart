import 'package:daewoo/widgets/hornosListWidget.dart';
import 'package:flutter/material.dart';
import 'package:daewoo/animations/fadeAnimation.dart';
import 'package:daewoo/widgets/headerWidget.dart';

class ProductosScreen extends StatefulWidget {
  @override
  _ProductosScreenState createState() => _ProductosScreenState();
}

class _ProductosScreenState extends State<ProductosScreen> {

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
                FadeAnimation(1.8, HornosListWidget())
              ],
            ),
          ),
          new Positioned(
            top: .0,
            right: .0,
            left: .0,
            child: FadeAnimation(1.4, HeaderWidget()),
          )
        ]))
        );
  }
}
