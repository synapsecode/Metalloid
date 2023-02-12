import 'package:flutter/material.dart';
import 'package:metalloid/quizprovider.dart';

class Quizzes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FeaturedQuizButton(),
          LatestQuizzes(),
          Divider(color: Colors.white30),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text("Trending Quizzes"),
                Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: getQuizzes()
                          .map((x) => QuizCard(
                                text: x.quizName,
                                imageUrl: x.backgroundUrl,
                                author: x.author,
                              ))
                          .toList(),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget createQuizObjectOnDemand(QuizItem quiz) {
  return QuizCard(
      text: quiz.quizName, author: quiz.author, imageUrl: quiz.backgroundUrl);
}

class QuizCard extends StatelessWidget {
  final String text;
  final String imageUrl;
  final Author author;
  QuizCard({required this.text, required this.author, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => print("Clicked on $text"),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                  constraints: new BoxConstraints.expand(
                    height: 250.0,
                  ),
                  padding: new EdgeInsets.only(left: 16.0, bottom: 8.0),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.cover),
                  ),
                  child: new Stack(
                    children: <Widget>[
                      new Positioned(
                          left: 0.0,
                          top: 20.0,
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 18.0,
                                backgroundImage: NetworkImage(author.imageUrl),
                              ),
                              SizedBox(width: 10.0),
                              Text(author.name)
                            ],
                          )),
                      new Positioned(
                        left: 0.0,
                        bottom: 50.0,
                        child: new Text(text,
                            style: new TextStyle(
                              fontSize: 20.0,
                            )),
                      ),
                      new Positioned(
                        left: 0.0,
                        bottom: 0.0,
                        child: new ActionBar(),
                      ),
                    ],
                  ))),
        ));
  }
}

class ActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.favorite, color: Colors.white70),
                onPressed: null),
            Text("50")
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.mode_comment, color: Colors.white70),
                onPressed: null),
            Text("7")
          ],
        ),
        IconButton(
            icon: Icon(Icons.share, color: Colors.white70), onPressed: null),
      ],
    );
  }
}

class FeaturedQuizButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 5.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 90.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite, color: Colors.white),
                  SizedBox(
                    width: 15.0,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Column(
                        children: <Widget>[
                          Text("Featured Quizzes",
                              style: TextStyle(fontSize: 30.0)),
                          Text("Hand picked by Leaders and Curators.",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.white54)),
                        ],
                      ))
                ],
              ),
              onPressed: () => print("Clicked On 'Featured Quizzes'."),
            ),
          )
        ],
      ),
    ));
  }
}

class LatestQuizzes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0, bottom: 5.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 90.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.whatshot,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Column(
                        children: <Widget>[
                          Text("Latest Quizzes",
                              style: TextStyle(fontSize: 30.0)),
                          Text("Enjoy all the Latest Quizzes.",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.white54)),
                        ],
                      ))
                ],
              ),
              onPressed: () => print("Clicked On 'Latest Quizzes'."),
            ),
          )
        ],
      ),
    ));
  }
}
