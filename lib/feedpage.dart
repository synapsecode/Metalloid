import 'package:flutter/material.dart';
import 'package:metalloid/feedprovider.dart' as feedprovider;
import 'package:metalloid/quizprovider.dart';

class FeedManager extends StatefulWidget {
  @override
  _FeedManagerState createState() => _FeedManagerState();
}

class _FeedManagerState extends State<FeedManager> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: feedprovider
          .getImages()
          .map((f) => ImageCard(
                text: f.text,
                imageUrl: f.imageUrl,
                author: f.author,
              ))
          .toList(),
    ));
  }
}

Widget createImageObjectOnDemand(feedprovider.ImageItem image) {
  return ImageCard(
    text: image.text,
    imageUrl: image.imageUrl,
    author: image.author,
  );
}

class ImageCard extends StatelessWidget {
  final String text;
  final String imageUrl;
  final Author author;
  ImageCard({required this.text, required this.author, required this.imageUrl});

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

// class FeedManager extends StatefulWidget {
//   State<StatefulWidget> createState() {
//     return _FeedManagerState();
//   }
// }

// class _FeedManagerState extends State<FeedManager> {
//   List<String> _bandnames = ['Slipknot'];
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: new Column(children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: <Widget>[
//               Expanded(
//                   child: ElevatedButton(
//                 color: Colors.red,
//                 onPressed: () {
//                   setState(() {
//                     _bandnames.add('System Of A Down');
//                   });
//                 },
//                 child: Text(
//                   'Discover Bands',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ))
//             ],
//           ),
//         ),
//         Feed(_bandnames),
//       ]),
//     );
//   }
// }

// class Feed extends StatelessWidget {
//   final List<String> bandnames;
//   Feed(this.bandnames);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: bandnames
//           .map((element) => Card(
//                 child: Column(
//                   children: <Widget>[
//                     Image.asset('assets/$element.jpg'),
//                     //Image.network('https://www.wallpaperup.com/uploads/wallpapers/2015/01/29/604388/cff1fdb8cae21be0110304941e33130d-700.jpg'),
//                     Text(element),
//                   ],
//                 ),
//               ))
//           .toList(),
//     );
//   }
// }
