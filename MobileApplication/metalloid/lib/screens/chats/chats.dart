import 'package:flutter/material.dart';
import './dms.dart' as directmessages;
import './chatrooms.dart' as chatrooms;
import './NewChat.dart' as newchatdialog;

class ChatScreen extends StatefulWidget {
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  ScrollController scrollcontroller;
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2);
    scrollcontroller = new ScrollController();
  }

  @override
  void dispose() {
    controller.dispose();
    scrollcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF28a366),
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
        onPressed: () {
          if(controller.index != 0){
            Navigator.of(context).pushNamed('/PublicChatRoom');
          }else{
          newchatdialog.openNewChatDialog(context);
          }
        }),
        body: NestedScrollView(
          controller: scrollcontroller,
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  title: new Text("My Messages"),
                  pinned: true,
                  floating: true,
                  forceElevated: boxIsScrolled,
                  bottom: new TabBar(controller: controller, tabs: <Tab>[
                    new Tab(icon: new Icon(Icons.send)),
                    new Tab(icon: new Icon(Icons.group)),
                  ])),
            ];
          },
          body: new TabBarView(controller: controller, children: <Widget>[
            new directmessages.DirectMessages(),
            new chatrooms.ChatRooms(),
          ]),
        ));
  }
}