import 'package:flutter/material.dart';
import '../../feedpage.dart' as feed;
import '../../pollspage.dart' as polls;
import '../../publicchatroompage.dart' as chatroom;
import '../../quizzespage.dart' as quizzes;

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('TestProject'),
      ),
      body: new ListView(
        children: <Widget>[
          new Card(
            child: new ListTile(
              title: const Text('Some information'),
            ),
          ),
          new Container(
            decoration:
                new BoxDecoration(color: Theme.of(context).primaryColor),
            child: new TabBar(
              controller: _controller,
              tabs: [
                new Tab(icon: new Icon(Icons.content_copy)),
                new Tab(icon: new Icon(Icons.group)),
                new Tab(icon: new Icon(Icons.poll)),
                new Tab(icon: new Icon(Icons.check_box)),
              ],
            ),
          ),
          new Container(
            height: 300.0,
            child: new TabBarView(
              controller: _controller,
              children: <Widget>[
                feed.FeedManager(),
                chatroom.Chatroom(),
                polls.PollScreen(),
                quizzes.Quizzes(),
              ],
            ),
          ),
          new Card(
            child: new ListTile(
              title: const Text('Some more information'),
            ),
          ),
          new RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {},
            child: const Text(
              'Search for POIs',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}



