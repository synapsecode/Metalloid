import 'package:flutter/material.dart';
import 'package:metalloid/feedpage.dart';
import 'package:metalloid/feedprovider.dart';
import 'package:metalloid/pollprovider.dart';
import 'package:metalloid/pollspage.dart';
import 'package:metalloid/quizprovider.dart';
import 'package:metalloid/quizzespage.dart';
import 'package:metalloid/screens/chats/savedchatrooms.dart';

class MyPostView extends StatefulWidget {
  const MyPostView({
    Key key,
    @required TabController controller,
  })  : _controller = controller,
        super(key: key);

  final TabController _controller;

  @override
  _MyPostViewState createState() => _MyPostViewState(_controller);
}

class _MyPostViewState extends State<MyPostView> {
  final TabController _controller;
  _MyPostViewState(this._controller);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            new Container(
              decoration:
                  new BoxDecoration(color: Theme.of(context).primaryColor),
              child: new TabBar(
                controller: widget._controller,
                tabs: [
                  new Tab(icon: new Icon(Icons.content_copy)),
                  new Tab(icon: new Icon(Icons.group)),
                  new Tab(icon: new Icon(Icons.poll)),
                  new Tab(icon: new Icon(Icons.check_box)),
                ],
              ),
            ),
            new SizedBox(
              height: 400.0,
              child: new TabBarView(
                
                controller: widget._controller,
                children: <Widget>[
                  MyGeneralFeed(),
                  MyChatRooms(),
                  MyPolls(),
                  MyQuizzes(),
                ],
              ),
            ),
          ],
        ));
  }
}

class MyGeneralFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ImageItem> currentUserImages = ReturnSpecificUserImages("Manas Hejmadi");
    print("Current Image => $currentUserImages");
    return SingleChildScrollView(
        child: Column(
      children: currentUserImages.map((y)=> createImageObjectOnDemand(y)).toList()
    ));
  }
}

class MyQuizzes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<QuizItem> currentUserPolls = ReturnSpecificUserQuizzes("Manas Hejmadi");
    print("Current Quiz => $currentUserPolls");
    return SingleChildScrollView(
        child: Column(
      children: currentUserPolls.map((y)=> createQuizObjectOnDemand(y)).toList()
    ));
  }
}

class MyPolls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<PollItem> currentUserPolls = ReturnSpecificUserPolls("Manas Hejmadi");
    print("Current Polls => $currentUserPolls");
    return SingleChildScrollView(
        child: Column(
      children: currentUserPolls.map((y)=> createPollObjectOnDemand(y)).toList()
    ));
  }
}

class MyChatRooms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          height: 400.0,
        color: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: MySavedChatrooms(),
        )
    )
        );
  }
}
