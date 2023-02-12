import 'package:flutter/material.dart';
import 'package:metalloid/feedpage.dart';
import 'package:metalloid/mainUI/bottomnav.dart' as bnav;
import 'package:metalloid/mainUI/misc.dart' as misc;
import 'package:metalloid/mainUI/sidebar.dart' as sidebar;
import 'package:metalloid/pollspage.dart';
import 'package:metalloid/publicchatroompage.dart';
import 'package:metalloid/quizzespage.dart';
import 'package:metalloid/screens/MyPostsScreens/myposts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title:
      //   ),
      // ),
      bottomNavigationBar: bnav.BottomNavigator(),
      floatingActionButton: misc.FloatingCircleButton(),
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          // title: Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 92.0),
          //   child: CircleAvatar(
          //     backgroundImage: NetworkImage("https://picsum.photos/g/400/400/"),
          //   ),
          // ),
          pinned: true,
          expandedHeight: 350.0,
          flexibleSpace: new FlexibleSpaceBar(background: SliverChild()),
        ),
        SliverList(delegate: SliverChildListDelegate([ProfileAppBody()]))
      ]),
    );
  }
}

class SliverChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/metalhead.jpg'),
              //image: NetworkImage("https://picsum.photos/g/1000/1000/"),
              fit: BoxFit.cover)),
      child: new ProfileTopBar(),
    );
  }
}

class ProfileTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CompletionBarWithProfileIcon(),
        SizedBox(height: 10.0),
        Text("Manas Hejmadi", style: TextStyle(fontSize: 25.0)),
        SizedBox(height: 10.0),
        Center(
          child: new LevelIndicator(),
        ),
        SizedBox(height: 10.0),
        EditButton(),
        // SizedBox(height: 10.0),
        // Center(child: new CoinIndicator())
      ],
    );
  }
}

class CoinIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 150.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.swap_vertical_circle, color: Colors.yellow),
            SizedBox(width: 10.0),
            Text("350")
          ],
        ));
  }
}

class EditButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      child: ElevatedButton(
        onPressed: () => print("Pressed Edit"),
        child: Row(
          children: <Widget>[
            Icon(Icons.edit),
            SizedBox(width: 10.0),
            Text("Edit")
          ],
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black26,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            )),
      ),
    );
  }
}

class LevelIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 90.0),
        child: Container(
          child: Row(
            children: <Widget>[
              Icon(Icons.offline_bolt),
              SizedBox(width: 10.0),
              Text("Advanced Metalhead")
            ],
          ),
        ));
  }
}

class CompletionBarWithProfileIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 120.0,
      lineWidth: 10.0,
      percent: 0.8,
      center: ProfileIcon(),
      backgroundColor: Colors.grey,
      progressColor: Colors.red,
    );
  }
}

class ProfileIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: CircleAvatar(
          radius: 54.0, backgroundImage: AssetImage('assets/metal.jpg')),
      radius: 60.0,
      backgroundColor: Colors.white10,
    );
  }
}

class ProfileAppBody extends StatefulWidget {
  @override
  _ProfileAppBodyState createState() => _ProfileAppBodyState();
}

class _ProfileAppBodyState extends State<ProfileAppBody>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      StatisticsBar(),
      SizedBox(height: 20.0),
      BioCard(),
      SizedBox(height: 30.0),
      MyPostView(controller: _controller),
    ]);
  }
}

class BioCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.black12,
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Bio", style: TextStyle(fontSize: 20.0)),
                    SizedBox(width: 10.0),
                    Text("Member Since April 2019",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 10.0,
                        )),
                    SizedBox(width: 5.0),
                    Text("(15 Days)",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 10.0,
                        )),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                            "I'm a 15 Year old School Student from India who is very passionate about Metal and Rock Music. The Genre of Metal really touches my soul! Metal music is not just entertainment it is a way of life! My favourite band is Slipknot!"))
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.white30,
                      size: 20.0,
                    ),
                    SizedBox(width: 5.0),
                    Text("Bangalore, India",
                        style: TextStyle(color: Colors.white30))
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class StatisticsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.black38,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text("69K", style: TextStyle(fontSize: 25.0)),
                Text("Reputation")
              ],
            ),
            Column(
              children: <Widget>[
                Text("178", style: TextStyle(fontSize: 25.0)),
                Text("Following")
              ],
            ),
            Column(
              children: <Widget>[
                Text("1M", style: TextStyle(fontSize: 25.0)),
                Text("Followers")
              ],
            ),
          ],
        ));
  }
}
