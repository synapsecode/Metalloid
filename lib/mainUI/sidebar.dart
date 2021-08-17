import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      return new Drawer(
        child: Container(
          color: Colors.black26,
          child: new ListView(
            children: <Widget>[
              new SizedBox(
                height: 270.0,
                child: UserAccountsDrawerHeader(  
                accountName: Text('Manas Hejmadi'),
                accountEmail: Text('manas2all@outlook.com'),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/sliderbackground.jpg')
                      //NetworkImage('https://www.wallpaperup.com/uploads/wallpapers/2015/01/29/604388/cff1fdb8cae21be0110304941e33130d-700.jpg')
                  )
                ),
              ),),
              new ListTile(
                title: Text("Home", style: TextStyle(color: Colors.white),),
                trailing: Icon(Icons.home, color: Colors.white,),
              ),
              new ListTile(
                title: Text("Settings", style: TextStyle(color: Colors.white),),
                trailing: Icon(Icons.settings, color: Colors.white,),
              ),
              new ListTile(
                title: Text("Community Guidelines", style: TextStyle(color: Colors.white),),
                trailing: Icon(Icons.pages, color: Colors.white,),
              ),
              new ListTile(
                title: Text("Metal Encyclopedia", style: TextStyle(color: Colors.white),),
                trailing: Icon(Icons.book, color: Colors.white,),
              ),
              new ListTile(
                title: Text("Featured Bands", style: TextStyle(color: Colors.white),),
                trailing: Icon(Icons.inbox, color: Colors.white,),
              ),
              new ListTile(
                onTap: ()=>Navigator.of(context).pushNamed('/Test'),
                title: Text("External Content", style: TextStyle(color: Colors.white),),
                trailing: Icon(Icons.wifi, color: Colors.white,),
              ),
              new ListTile(
                title: Text("Genres", style: TextStyle(color: Colors.white),),
                trailing: Icon(Icons.gradient, color: Colors.white,),
                onTap: ()=>Navigator.of(context).pushNamed('/Genres'),
              ),
              
            ],
          ),
        ),
      );
    }
}