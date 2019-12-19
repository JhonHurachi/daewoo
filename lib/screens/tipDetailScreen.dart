import 'package:daewoo/models/tipModel.dart';
import 'package:daewoo/widgets/hornosWidget.dart';
import 'package:daewoo/widgets/video2Widget.dart';
import 'package:flutter/material.dart';
import 'package:daewoo/animations/fadeAnimation.dart';
import 'package:daewoo/widgets/headerWidget.dart';

class TipDetailScreen extends StatefulWidget {

  final TipModel tip;

  TipDetailScreen({Key key, @required this.tip}) : super(key: key);

  @override
  _TipDetailScreenState createState() => _TipDetailScreenState();
}

class _TipDetailScreenState extends State<TipDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            FadeAnimation(1.4, HeaderWidget()),
            FadeAnimation(1.4, VideoWidget2(tip: widget.tip)),
            FadeAnimation(1.4, HornosWidget())
        ])));
  }
}