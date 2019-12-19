import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:daewoo/screens/dashScreen.dart';
import 'package:daewoo/screens/perfilScreen.dart';
import 'package:daewoo/screens/productosScreen.dart';
import 'package:daewoo/screens/tipsScreen.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
   DashScreen(),
   ProductosScreen(),
   TipsScreen(),
   PerfilScreen()
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 8,
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.book),
            title: Text('Recetas'),
            activeColor: Colors.blueGrey,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.branding_watermark),
            title: Text('Productos'),
            activeColor: Colors.red,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.lightbulb_outline),
            title: Text('Tips'),
            activeColor: Colors.yellow,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text('Perfil'),
            activeColor: Colors.blue,
          ),
        ],
      ),
        );
  }
}
