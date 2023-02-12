import 'dart:math';
import 'package:flutter/material.dart';
import 'pollprovider.dart' as provider;

//Main Caller
class PollScreen extends StatefulWidget {
  @override
  _PollScreenState createState() => _PollScreenState();
}

//Main Caller State
class _PollScreenState extends State<PollScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(10.0),
      child: PollObject(),
    ));
  }
}

//Entire Poll Post Body
class PollObject extends StatelessWidget {
  @override
  build(BuildContext context) {
    List<provider.PollItem> polls = provider.getPolls();

    return Column(
        children: polls
            .map((x) => Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 20.0, bottom: 5.0, left: 20.0, right: 20.0),
                          color: Colors.white10,
                          child: Column(
                            children: <Widget>[
                              PollHeader(
                                  authorName: x.author.name,
                                  imageUrl: x.author.imageUrl,
                                  time: 1 + Random().nextInt(360)),
                              SizedBox(height: 20.0),
                              Column(
                                children: <Widget>[
                                  PollDescription(
                                    pollName: x.pollName,
                                    pollDesc: x.desc,
                                  ),
                                  PollingOptions(
                                      pollName: x.pollName, options: x.options),
                                  PollInfo(
                                      votes: x.votes, validity: x.validity),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              PollActionBar(),
                            ],
                          ),
                        ))
                  ],
                ))
            .toList());
  }
}

Widget createPollObjectOnDemand(provider.PollItem poll) {
  return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Container(
        padding:
            EdgeInsets.only(top: 20.0, bottom: 5.0, left: 20.0, right: 20.0),
        color: Colors.white10,
        child: Column(
          children: <Widget>[
            PollHeader(
                authorName: poll.author.name,
                imageUrl: poll.author.imageUrl,
                time: 1 + Random().nextInt(360)),
            SizedBox(height: 20.0),
            Column(
              children: <Widget>[
                PollDescription(
                  pollName: poll.pollName,
                  pollDesc: poll.desc,
                ),
                PollingOptions(pollName: poll.pollName, options: poll.options),
                PollInfo(votes: poll.votes, validity: poll.validity),
              ],
            ),
            SizedBox(height: 10.0),
            PollActionBar(),
          ],
        ),
      ));
}

//==========================================Poll Object Sub-Widgets==========================================
class PollHeader extends StatelessWidget {
  final String imageUrl;
  final String authorName;
  final int time;

  PollHeader(
      {required this.authorName, required this.imageUrl, required this.time});

  @override
  Widget build(BuildContext context) {
    if (time < 60) {
      return Container(
          child: Row(
        children: <Widget>[
          CircleAvatar(radius: 18.0, backgroundImage: NetworkImage(imageUrl)),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(authorName,
                  style: TextStyle(color: Colors.blue, fontSize: 20.0)),
              Text("${time.toString()} minutes ago",
                  style: TextStyle(color: Colors.white54, fontSize: 10.0))
            ],
          ) //TextHeader
        ],
      ));
    } else {
      num hours = num.parse((time / 60).toStringAsFixed(1));
      return Container(
          child: Row(
        children: <Widget>[
          CircleAvatar(radius: 18.0, backgroundImage: NetworkImage(imageUrl)),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(authorName,
                  style: TextStyle(color: Colors.blue, fontSize: 20.0)),
              Text("${hours.toString()} hours ago",
                  style: TextStyle(color: Colors.white54, fontSize: 10.0))
            ],
          ) //TextHeader
        ],
      ));
    }
  }
}

class PollDescription extends StatelessWidget {
  final String pollName;
  final String pollDesc;
  PollDescription({required this.pollName, required this.pollDesc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.equalizer, color: Colors.redAccent),
            SizedBox(width: 15.0),
            Expanded(
                child: Text(pollName,
                    style: TextStyle(color: Colors.white70, fontSize: 16.0))),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(pollDesc, style: TextStyle(color: Colors.white54, fontSize: 12.0))
      ],
    );
  }
}

class PollingOptions extends StatelessWidget {
  final List<String> options;
  final String pollName;

  PollingOptions({required this.pollName, required this.options});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: options
            .map((x) => Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Row(children: <Widget>[
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () =>
                        print("Clicked on option ($x) in Poll '$pollName'"),
                    child: Text(x),
                  ))
                ])))
            .toList());
  }
}

class PollInfo extends StatelessWidget {
  final int votes;
  final int validity;

  PollInfo({required this.votes, required this.validity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "${votes.toString()}  votes",
          style: TextStyle(
            color: Colors.white30,
          ),
        ),
        SizedBox(width: 8.0),
        Text(
          "${validity.toString()} Days Left",
          style: TextStyle(
            color: Colors.white30,
          ),
        )
      ],
    );
  }
}

class PollActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
            child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.favorite, color: Colors.white30),
                onPressed: null),
            Text((1 + Random().nextInt(1000)).toString(),
                style: TextStyle(color: Colors.white30)),
            Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.mode_comment, color: Colors.white30),
                    onPressed: null),
                Text((1 + Random().nextInt(1000)).toString(),
                    style: TextStyle(color: Colors.white30))
              ],
            ),
            IconButton(
                icon: Icon(Icons.share, color: Colors.white30),
                onPressed: null),
          ],
        ))
      ],
    );

    ;
  }
}
//===========================================End of Sub-Widgets==============================================
