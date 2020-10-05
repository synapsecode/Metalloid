import 'package:flutter/material.dart';
import 'package:metalloid/mainUI/bottomnav.dart';
import 'package:metalloid/mainUI/misc.dart';

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistics"),
      ),
      floatingActionButton: FloatingCircleButton(),
      bottomNavigationBar: BottomNavigator(),
      body: new StatisticsBody(),
    );
  }
}

class StatisticsBody extends StatefulWidget {
  @override
  _StatisticsBodyState createState() => _StatisticsBodyState();
}

class _StatisticsBodyState extends State<StatisticsBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: StatObject());
  }
}

class StatObject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TopBar(),
        IndividualStatObject(
          members: 1000,
          task: "Browsing",
          icon: Icons.remove_red_eye,
          color: Colors.black,
        ),
        IndividualStatObject(
          members: 450,
          task: "Chatting",
          icon: Icons.chat_bubble,
          color: Colors.blue,
        ),
        IndividualStatObject(
          members: 25,
          task: "Voice Call",
          icon: Icons.call,
          color: Colors.green,
        ),
        IndividualStatObject(
          members: 69,
          task: "Watching Videos",
          icon: Icons.videocam,
          color: Colors.deepOrangeAccent,
        ),
        IndividualStatObject(
          members: 71,
          task: "Voting On Polls",
          icon: Icons.equalizer,
          color: Colors.red,
        ),
        IndividualStatObject(
          members: 12,
          task: "Playing Quizzes",
          icon: Icons.check_box,
          color: Colors.purple,
        ),
        IndividualStatObject(
          members: 138,
          task: "Reading Posts",
          icon: Icons.library_books,
          color: Colors.teal,
        ),
        IndividualStatObject(
          members: 46,
          task: "Giving Likes",
          icon: Icons.favorite,
          color: Colors.redAccent,
        ),
        IndividualStatObject(
          members: 2,
          task: "Commenting",
          icon: Icons.comment,
          color: Colors.orangeAccent,
        ),
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(left: 10.0, bottom: 5.0, top: 10.0, right: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
            child: Container(
          color: Colors.black54,
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.flash_on, color: Colors.yellow),
                  SizedBox(width: 10.0),
                  Text("What's Happening Now!")
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(children: <Widget>[
                    SizedBox(
                      width: 10.0,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.lightGreenAccent,
                      radius: 4.0,
                    ),
                    SizedBox(width: 10.0),
                    Text("Members Online (2374)")
                  ]),
                  Text("See All", style: TextStyle(color: Colors.white54))
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: ProfileIconScroller(24.0))
            ],
          ),
        )));
  }
}

class IndividualStatObject extends StatelessWidget {
  final int members;
  final String task;
  final IconData icon;
  final color;
  IndividualStatObject({this.members, this.icon, this.task, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => print("Clicked on Statistic '$task'"),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  color: color,
                  padding: EdgeInsets.all(2.0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 6.0),
                      NumberViewBox(
                        members: members,
                      ),
                      InfoDisplay(icon: icon, task: task)
                    ],
                  ),
                ))));
  }
}

class InfoDisplay extends StatelessWidget {
  final String task;
  final IconData icon;
  InfoDisplay({this.icon, this.task});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.all(8.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.white10,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                        child: Text(task, style: TextStyle(fontSize: 20.0)))
                  ],
                ),
                Divider(),
                new ProfileIconScroller(15.0)
              ],
            ),
          )),
    ));
  }
}

class ProfileIconScroller extends StatelessWidget {
  final double radius;
  ProfileIconScroller(this.radius);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: radius,
              backgroundImage: NetworkImage("https://picsum.photos/400/400/"),
            ),
            SizedBox(width: 5.0),
            CircleAvatar(
              radius: radius,
              backgroundImage: NetworkImage("https://picsum.photos/200/200/"),
            ),
            SizedBox(width: 5.0),
            CircleAvatar(
              radius: radius,
              backgroundImage: NetworkImage("https://picsum.photos/600/600/"),
            ),
            SizedBox(width: 5.0),
            CircleAvatar(
              radius: radius,
              backgroundImage: NetworkImage("https://picsum.photos/g/400/400/"),
            ),
            SizedBox(width: 5.0),
            CircleAvatar(
              radius: radius,
              backgroundImage: NetworkImage("https://picsum.photos/g/600/600/"),
            ),
            SizedBox(width: 5.0),
            CircleAvatar(
              radius: radius,
              backgroundImage: NetworkImage("https://picsum.photos/400/400/"),
            ),
            SizedBox(width: 5.0),
            CircleAvatar(
              radius: radius,
              backgroundImage: NetworkImage("https://picsum.photos/400/400/"),
            ),
            SizedBox(width: 5.0),
            CircleAvatar(
              radius: radius,
              backgroundImage: NetworkImage("https://picsum.photos/400/400/"),
            ),
          ],
        ));
  }
}

class NumberViewBox extends StatelessWidget {
  final int members;
  NumberViewBox({this.members});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          padding: EdgeInsets.all(20.0),
          color: Colors.white10,
          child: Column(
            children: <Widget>[
              Text(members.toString(), style: TextStyle(fontSize: 30.0)),
              Text("Members")
            ],
          ),
        ));
  }
}
