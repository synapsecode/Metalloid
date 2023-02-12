import 'package:flutter/material.dart';
import '../../publicchatroompage.dart' as publicchatroom;

class PublicChatRoomProvider extends StatefulWidget {
  _PublicChatRoomProviderState createState() => _PublicChatRoomProviderState();
}

class _PublicChatRoomProviderState extends State<PublicChatRoomProvider>
    with SingleTickerProviderStateMixin {
  late ScrollController scrollcontroller;
  late TabController controller;

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
        backgroundColor: Colors.black38,
        body: NestedScrollView(
          controller: scrollcontroller,
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  title: new Text("Create ChatRooms"),
                  pinned: true,
                  floating: true,
                  forceElevated: boxIsScrolled,
                  bottom: new TabBar(controller: controller, tabs: <Tab>[
                    new Tab(icon: new Icon(Icons.create)),
                    new Tab(icon: new Icon(Icons.public)),
                  ])),
            ];
          },
          body: new TabBarView(controller: controller, children: <Widget>[
            new ChatRoomBuilder(),
            new publicchatroom.Chatroom(),
          ]),
        ));
  }
}

class ChatRoomBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(),
    );
  }
}
