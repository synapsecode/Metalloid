import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metalloid/genres.dart';
import 'package:metalloid/screens/profile/profile.dart' as profile;
import 'package:metalloid/screens/profile/test.dart';
import 'package:metalloid/screens/stats/statistics.dart';
import './feedpage.dart' as feed;
import './pollspage.dart' as polls;
import './publicchatroompage.dart' as chatroom;
import './quizzespage.dart' as quizzes;
import './mainUI/sidebar.dart' as sidebar;
import './mainUI/bottomnav.dart' as bnav;
import './mainUI/misc.dart' as misc;
import './screens/chats/chats.dart' as chats;
// import './screens/chats/CardUI.dart' as card_ui;
import './screens/chats/createchatroom.dart' as chatroombuilder;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new MyTabs(),
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        routes: <String, WidgetBuilder>{
          '/Chats': (BuildContext context) => new chats.ChatScreen(),
          '/PublicChatRoom': (BuildContext context) =>
              new chatroombuilder.PublicChatRoomProvider(),
          '/Profile': (BuildContext context) => new profile.Profile(),
          '/Test': (BuildContext context) => new MyHomePage(),
          '/Statistics': (BuildContext context) => new Statistics(),
          '/Genres': (BuildContext context) => new GenreList(),
        }));
  });
}

class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  TabController controller;
  ScrollController scrollcontroller;

  //BOILERPLATE: Widget LifeCycle: Initiates a Widget's State.
  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 4);
    scrollcontroller = new ScrollController();
  }

  //BOILERPLATE: Widget LifeCycle: Kills the Widget.
  @override
  void dispose() {
    controller.dispose();
    scrollcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        //Scaffold Properties
        backgroundColor: Colors.black87,
        resizeToAvoidBottomPadding: false,

        //Separated Widgets
        drawer: sidebar.Sidebar(),
        bottomNavigationBar: bnav.BottomNavigator(),
        floatingActionButton: misc.FloatingCircleButton(),
        body: NestedScrollView(
          controller: scrollcontroller,
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  title: new Text("Metalloid"),
                  pinned: true,
                  floating: true,
                  forceElevated: boxIsScrolled,
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.notifications),
                      onPressed: () => print("Notifications Pressed"),
                    ),
                    IconButton(
                      onPressed: () => print("More Button Pressed"),
                      icon: Icon(Icons.more_vert),
                    )
                  ],
                  bottom: new TabBar(controller: controller, tabs: <Tab>[
                    new Tab(icon: new Icon(Icons.content_copy)),
                    new Tab(icon: new Icon(Icons.group)),
                    new Tab(icon: new Icon(Icons.poll)),
                    new Tab(icon: new Icon(Icons.check_box)),
                  ])),
            ];
          },
          body: new TabBarView(controller: controller, children: <Widget>[
            new feed.FeedManager(),
            new chatroom.Chatroom(),
            new polls.PollScreen(),
            new quizzes.Quizzes(),
          ]),
        ));
  }
}
