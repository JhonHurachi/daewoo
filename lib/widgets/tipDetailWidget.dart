import 'package:daewoo/models/tipModel.dart';
import 'package:flutter/material.dart';

class TipDetailWidget extends StatelessWidget {

  final TipModel tip;

  TipDetailWidget({Key key, @required this.tip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: <Widget>[
                Text(tip.titulo, style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600
                ),),
                SizedBox(height: 16.0,)             
              ],
            ),
          ),
        ],
    );
  }
}
