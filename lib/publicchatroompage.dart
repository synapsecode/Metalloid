import 'package:flutter/material.dart';
import 'dart:math';

List<String> images = [
  "assets/meshuggah.png",
  "assets/corey.jpg",
  "assets/metalhead.jpg",
  "assets/slayer.jpg",
  "assets/metal.jpg",
  "assets/thrash.png",
  "assets/linkinpark.jpg",
  "assets/numetal.jpg",
];

List<String> authors = [
  "https://source.unsplash.com/random/200x200",
  "https://source.unsplash.com/random/300x300",
  "https://source.unsplash.com/random/1920x1080",
  "https://source.unsplash.com/random/800x600",
  "https://source.unsplash.com/random/640x480",
  "https://source.unsplash.com/random/500x500",
  "https://source.unsplash.com/random/600x600",
  "https://source.unsplash.com/random/1000x1000",
];

List<String> title = [
  "Meshuggah Fans",
  "Corey Taylor Fans",
  "All Metalheads Welcome",
  "Slayer Fans",
  "Satanic Metal",
  "Thrash Metal Fans",
  "Linkin Park Fans",
  "Why did Nu Metal Die?",
];

void onChatRoomClick(double currentPage) {
  int i = currentPage.toInt();
  print("Clicked on Public Chatroom '${title[i]}'");
}

List<Widget> _buildGridTiles(numberOfTiles) {
  List<Widget> containers = new List<Widget>.generate(numberOfTiles, (int i) {
    //index = 0, 1, 2,...
    final imageName = images[i];
    final chatroomname = title[i];
    final author = authors[i];
    final String time = (0 + (Random().nextInt(120))).toString();

    return ChatRoomItem(chatroomname, imageName, author, time);
  });
  return containers;
}

class ChatRoomItem extends StatelessWidget {
  final String chatroomname;
  final String image;
  final String author;
  final String time;

  ChatRoomItem(this.chatroomname, this.image, this.author, this.time);
  @override
  Widget build(BuildContext context) {
    return new InkWell(
        onTap: () => print("Clicked on $chatroomname"),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
                padding: new EdgeInsets.only(left: 16.0, bottom: 8.0),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover),
                ),
                child: new Stack(
                  children: <Widget>[
                    new Positioned(
                      left: 0.0,
                      top: 5.0,
                      child: new Text("$time minutes ago.",
                          style: new TextStyle(shadows: <Shadow>[
                            Shadow(
                              offset: Offset(8.0, 6.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ], fontSize: 12.0, color: Colors.white70)),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: Container(
                          child: Text("$chatroomname",
                              style: new TextStyle(
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(8.0, 6.0),
                                    blurRadius: 3.0,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ],
                                fontSize: 20.0,
                              )),
                        )),

                    Positioned(
                      bottom: 10.0,
                      left: 0.0,
                      child: CircleAvatar(
                        radius: 15.0,
                        backgroundImage: NetworkImage(author),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 10.0,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.people, color: Colors.white70),
                              onPressed: null),
                          Text((0 + (Random().nextInt(120))).toString())
                        ],
                      ),
                    )
                    // Text("$chatroomname",
                    //       style: new TextStyle(
                    //         fontSize: 20.0,
                    //       )
                    // new Positioned(
                    //   left: 0.0,
                    //   bottom: 0.0,
                    //   child: new ActionBar(),
                    // ),
                  ],
                )))
        //new ClipRRect(child: Image.asset(image, fit: BoxFit.cover), borderRadius: BorderRadius.circular(10.0),)
        );
    ;
  }
}

class Chatroom extends StatefulWidget {
  @override
  _ChatroomState createState() => new _ChatroomState();
}

class _ChatroomState extends State<Chatroom> {
  @override
  Widget build(BuildContext context) {
    return ChatRoomItemGridBuilder();
    
  }
}

class ChatRoomItemGridBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 250.0,
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
      padding: const EdgeInsets.all(5.0),
      children: _buildGridTiles(images.length), //Where is this function ?
    );
  }
}

