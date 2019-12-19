import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeaderWidget extends StatefulWidget {
  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {

  var prof = Row();
  SharedPreferences prefs;
  String id = '';
  String nickname = '';
  String aboutMe = '';
  String photoUrl = '';

  @override
  void initState() {
    super.initState();
    readLocal();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFF1f94aa).withOpacity(0.5),
            blurRadius: 5
          )
        ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.menu, color: Color(0xFFF2c4e5e),size: 30),
          prof
        ],
      ),
    );
  }

  Widget profile(nickname, photoUrl){

    return Row(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(nickname, style: TextStyle(
              color: Color(0xFFF2c4e5e),
              fontWeight: FontWeight.bold
            )),
            Text("Bienvenido", style: TextStyle(
              color: Color(0xFFF1f94aa)
            )),
            
          ],
        ),

          SizedBox(width: 5),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(photoUrl),
                fit: BoxFit.cover
              )
            ),
          )

      ],
    );

  }

  void readLocal() async {
    prefs = await SharedPreferences.getInstance();
    id = prefs.getString('id') ?? '';
    nickname = prefs.getString('nickname') ?? '';
    aboutMe = prefs.getString('aboutMe') ?? '';
    photoUrl = prefs.getString('photoUrl') ?? '';

    prof = profile(nickname, photoUrl);

    setState(() {});
  }

}