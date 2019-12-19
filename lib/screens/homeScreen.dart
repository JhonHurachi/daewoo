import 'package:daewoo/screens/tabScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:daewoo/animations/fadeAnimation.dart';
import 'package:daewoo/components/customButtonAnimation.dart';
import 'package:daewoo/screens/loginScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _isLogged = false;
  Future<void> _currentUser;

  @override
  initState() {
    super.initState();
    _currentUser = getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("assets/images/home1.jpg", fit: BoxFit.cover),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xFFF001117).withOpacity(0.7),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            margin: EdgeInsets.only(top: 80, bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  FadeAnimation(2.4,Text("Chef", style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  letterSpacing: 2
                ))),
                FadeAnimation(2.6,Text("Peruano", style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold
                ))),
                  ],
                ),
                FutureBuilder(
                  future: _currentUser,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 20),
                            FadeAnimation(3.2, CustomButtonAnimation(
                              label: "Ingresar",
                              backbround: Colors.white,
                              borderColor: Colors.white,
                              fontColor: Color(0xFFF001117),
                              child: TabScreen(),
                            )),
                            SizedBox(height: 30),
                          ],
                        );
                    } else {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 20),
                            FadeAnimation(3.2, CustomButtonAnimation(
                              label: "Ingresar",
                              backbround: Colors.white,
                              borderColor: Colors.white,
                              fontColor: Color(0xFFF001117),
                              child: LoginScreen(),
                            )),
                            SizedBox(height: 30),
                          ],
                        );
                    }
                  },
                )                
              ],
            ),
          )
        ],
      ),
    );
  }

  getUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    _isLogged = (user != null);
    setState(() {});
    return user; 
  }
}