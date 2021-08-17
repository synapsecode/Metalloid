// import 'package:flutter/material.dart';
// import 'package:metalloid/mainUI/bottomnav.dart';
// import 'package:metalloid/mainUI/misc.dart';
// import 'dart:math';

// class GenreList extends StatefulWidget {
//   @override
//   _GenreListState createState() => _GenreListState();
// }

// class _GenreListState extends State<GenreList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: new AppBar(
//           title: Text("Metal Genres"),
//         ),
//         bottomNavigationBar: BottomNavigator(),
//         floatingActionButton: FloatingCircleButton(),
//         body: Container(child:GenreListObjects()));
//   }
// }

// List<String> images = [
//   "assets/meshuggah.png",
//   "assets/corey.jpg",
//   "assets/metalhead.jpg",
//   "assets/slayer.jpg",
//   "assets/metal.jpg",
//   "assets/thrash.png",
//   "assets/linkinpark.jpg",
//   "assets/numetal.jpg",
// ];

// List<String> authors = [
//   "https://source.unsplash.com/random/200x200",
//   "https://source.unsplash.com/random/300x300",
//   "https://source.unsplash.com/random/1920x1080",
//   "https://source.unsplash.com/random/800x600",
//   "https://source.unsplash.com/random/640x480",
//   "https://source.unsplash.com/random/500x500",
//   "https://source.unsplash.com/random/600x600",
//   "https://source.unsplash.com/random/1000x1000",
// ];

// List<String> title = [
//   "Meshuggah Fans",
//   "Corey Taylor Fans",
//   "All Metalheads Welcome",
//   "Slayer Fans",
//   "Satanic Metal",
//   "Thrash Metal Fans",
//   "Linkin Park Fans",
//   "Why did Nu Metal Die?",
// ];

// void onGenreListClick(double currentPage) {
//   int i = currentPage.toInt();
//   print("Clicked on Public GenreList '${title[i]}'");
// }

// List<Widget> _buildGridTiles(numberOfTiles) {
//   List<Widget> containers = new List<Widget>.generate(numberOfTiles, (int i) {
//     //index = 0, 1, 2,...
//     final imageName = images[i];
//     final genrelistname = title[i];
//     final author = authors[i];
//     final String time = (0 + (Random().nextInt(120))).toString();

//     return GenreListItem(genrelistname, imageName, author, time);
//   });
//   return containers;
// }

// class GenreListItem extends StatelessWidget {
//   final String genrelistname;
//   final String image;
//   final String author;
//   final String time;

//   GenreListItem(this.genrelistname, this.image, this.author, this.time);
//   @override
//   Widget build(BuildContext context) {
//     return new InkWell(
//         onTap: () => print("Clicked on $genrelistname"),
//         child: ClipRRect(
//             borderRadius: BorderRadius.circular(10.0),
//             child: Container(
//                 padding: new EdgeInsets.only(left: 16.0, bottom: 8.0),
//                 decoration: new BoxDecoration(
//                   image: new DecorationImage(
//                       image: AssetImage(image), fit: BoxFit.cover),
//                 ),
//                 child: new Stack(
//                   children: <Widget>[
//                     new Positioned(
//                       left: 0.0,
//                       top: 5.0,
//                       child: new Text("$time minutes ago.",
//                           style: new TextStyle(shadows: <Shadow>[
//                             Shadow(
//                               offset: Offset(8.0, 6.0),
//                               blurRadius: 3.0,
//                               color: Color.fromARGB(255, 0, 0, 0),
//                             ),
//                           ], fontSize: 12.0, color: Colors.white70)),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.only(top: 30.0),
//                         child: Container(
//                           child: Text("$genrelistname",
//                               style: new TextStyle(
//                                 shadows: <Shadow>[
//                                   Shadow(
//                                     offset: Offset(8.0, 6.0),
//                                     blurRadius: 3.0,
//                                     color: Color.fromARGB(255, 0, 0, 0),
//                                   ),
//                                 ],
//                                 fontSize: 20.0,
//                               )),
//                         )),

//                     Positioned(
//                       bottom: 10.0,
//                       left: 0.0,
//                       child: CircleAvatar(
//                         radius: 15.0,
//                         backgroundImage: NetworkImage(author),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 0.0,
//                       right: 10.0,
//                       child: Row(
//                         children: <Widget>[
//                           IconButton(
//                               icon: Icon(Icons.people, color: Colors.white70),
//                               onPressed: null),
//                           Text((0 + (Random().nextInt(120))).toString())
//                         ],
//                       ),
//                     )
//                     // Text("$GenreListname",
//                     //       style: new TextStyle(
//                     //         fontSize: 20.0,
//                     //       )
//                     // new Positioned(
//                     //   left: 0.0,
//                     //   bottom: 0.0,
//                     //   child: new ActionBar(),
//                     // ),
//                   ],
//                 )))
//         //new ClipRRect(child: Image.asset(image, fit: BoxFit.cover), borderRadius: BorderRadius.circular(10.0),)
//         );
//     ;
//   }
// }

// class GenreListObjects extends StatefulWidget {
//   @override
//   _GenreListObjectsState createState() => new _GenreListObjectsState();
// }

// class _GenreListObjectsState extends State<GenreListObjects> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(child: Container(width: double.infinity,child: GenreListItemGridBuilder()));
//   }
// }

// class GenreListItemGridBuilder extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GridView.extent(
//       maxCrossAxisExtent: 250.0,
//       mainAxisSpacing: 5.0,
//       crossAxisSpacing: 5.0,
//       padding: const EdgeInsets.all(5.0),
//       children: _buildGridTiles(images.length), //Where is this function ?
//     );
//   }
// }

//Import Stage
import 'package:flutter/material.dart';
import 'package:metalloid/mainUI/bottomnav.dart';
import 'package:metalloid/mainUI/misc.dart';
import 'dart:math';

//================================================Data Stage======================================================
List<String> images = [
  "https://mediad.publicbroadcasting.net/p/kstx/files/styles/x_large/public/201810/pexels-rock-guitar.jpeg",
  "https://images.vice.com/noisey/content-images/article/uada/1908213-610725072397983-5073404013191594903-n.jpg",
  "https://wallpapercave.com/wp/wp2173266.jpg",
  "https://cdn.theatlantic.com/assets/media/img/mt/2017/10/Alien_Weaponry_5/lead_720_405.jpg?mod=1533691909",
  'https://static.stereogum.com/uploads/2019/02/2-1551374439-compressed.jpeg',
  "https://www.filepicker.io/api/file/ulDnTsawR9uc73O4HX1X/convert?cache=true&crop=0%2C49%2C2200%2C1100",
  "https://music-b26f.kxcdn.com/wp-content/uploads/2013/05/System-of-a-Down.jpg",
  "https://www.billboard.com/files/styles/article_main_image/public/stylus/1004339-Linkin-Park-617.jpg",
];

List<String> title = [
  "Hard Rock",
  "Black Metal",
  "Doom Metal",
  "Thash Metal",
  "Death Metal",
  "MetalCore",
  "Alternative Metal",
  "Nu Metal",
];

//=============================================End of Data Stage======================================================

//--------------------------------------------------Helper Functions---------------------------------------------
void onGenreItemClick(double currentPage) {
  int i = currentPage.toInt();
  print("Clicked on Public GenreList '${title[i]}'");
}

List<Widget> _buildGridTiles(numberOfTiles) {
  List<Widget> containers = new List<Widget>.generate(numberOfTiles, (int i) {
    final imageName = images[i];
    final genrelistname = title[i];

    return GenreListItem(genrelistname, imageName);
  });
  return containers;
}
//--------------------------------------------------Helper Functions---------------------------------------------

//===============================================Main Driver=======================================================
class GenreList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("Metal Genres"),
        ),
        bottomNavigationBar: BottomNavigator(),
        floatingActionButton: FloatingCircleButton(),
        body: GenreItemGridBuilder());
  }
}
//============================================End Of Main Driver=======================================================

//============================================Additional Widgets=======================================================
class GenreItemGridBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 250.0,
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
      padding: const EdgeInsets.all(5.0),
      children: _buildGridTiles(images.length),
    );
  }
}

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<MAIN OBJECT>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
class GenreListItem extends StatelessWidget {
  final String genrelistname;
  final String image;

  GenreListItem(this.genrelistname, this.image);
  @override
  Widget build(BuildContext context) {
    return new InkWell(
        onTap: () => print("Clicked on $genrelistname"),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
                padding: new EdgeInsets.only(left: 16.0, bottom: 8.0),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover),
                ),
                child: new Stack(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Container(
                        child: Text("$genrelistname",
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
                ]))));
  }
}
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<MAIN OBJECT>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//============================================Additional Widgets=======================================================
