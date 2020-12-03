import 'package:flutter/material.dart';
import '../main.dart';

class BottomNavigator extends StatefulWidget {
  State<StatefulWidget> createState() {
    return BNavC();
  }
}

class BNavC extends State<BottomNavigator> {
  int _cIndex = 0;

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  void _tapAction(int index){
    switch(index){
      case 0:
        Scaffold.of(context).openDrawer();
        break;
      case 1:
      Navigator.of(context).pushNamed('/Statistics');
      break;
      case 2:
        Navigator.of(context).pushNamed('/Chats');
        break;
      case 3:
        Navigator.of(context).pushNamed('/Profile');
        break;
    } 
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.menu), title: Text('Menu')),
        BottomNavigationBarItem(
            icon: Icon(Icons.equalizer), title: Text('Statistics')),
        BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('Chats')),
        BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity), title: Text('Profile')),
      ],
      selectedItemColor: Colors.white,
      backgroundColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.white,
      onTap: (int index) {
        _incrementTab(index);
        _tapAction(index);
      },
    );
  }
}
