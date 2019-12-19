import 'package:daewoo/screens/dashScreen.dart';
import 'package:daewoo/screens/homeScreen.dart';
import 'package:daewoo/screens/loginScreen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomeScreen(),
    'login': (BuildContext context) => LoginScreen(),
    'dash': (BuildContext context) => DashScreen()
  };
}
