import 'package:metalloid/quizprovider.dart';

class ImageItem {
  final String imageUrl;
  final String text;
  final Author author;
  ImageItem({this.text, this.author, this.imageUrl});
}

List<ImageItem> images = [
  ImageItem(
      text: "Slipknot",
      author: authors[3],
      imageUrl: "https://townsquare.media/site/366/files/2018/11/Slipknot.jpg"),
  ImageItem(
      text: "System Of A Down",
      author: authors[3],
      imageUrl:
          "https://consequenceofsound.net/wp-content/uploads/2015/03/system-of-a-down.jpg?quality=80&w=807"),
  ImageItem(
      text: "Lamb Of God",
      author: authors[0],
      imageUrl:
          "https://townsquare.media/site/366/files/2014/11/Lamb-of-God.jpg"),
  ImageItem(
      text: "Cannibal Corpse",
      author: authors[2],
      imageUrl:
          "https://s3.amazonaws.com/quietus_production/images/articles/8231/CannibalCorpse_brick2_Main-Promo_byAlexMorgan_1331641840_crop_558x350.jpg"),
  ImageItem(
      text: "WhiteChapel",
      author: authors[0],
      imageUrl:
          "https://i.axs.com/2019/01/whitechapel-dying-fetus-tickets_04-24-19_17_5c3ca0b557f2b.jpg"),
  ImageItem(
      text: "Linkin Park",
      author: authors[3],
      imageUrl:
          "https://tonedeaf.thebrag.com/wp-content/uploads/2020/02/undo-2020-02-17T114638.555-768x435.jpg"),
];

List<ImageItem> getImages() {
  return images;
}

List<ImageItem> ReturnSpecificUserImages(String authorname) {
  final List<ImageItem> ImageData = getImages();
  final List<Author> authorData = getAuthors();
  print(
      "=========================IN RETURNUSERSPECIFICPOLLS===========================");
  List<ImageItem> user_images = [];
  for (int i = 0; i < authorData.length; i++) {
    print("Author: ${authorData[i].name}");
    if (authorData[i].name == authorname) {
      print("Correct Author Found! -> ${authorData[i].name}");
      //Author Exists
      for (int j = 0; j < ImageData.length; j++) {
        print("ImageName: ${ImageData[j].text}");
        ImageItem poll = ImageData[j];
        if (poll.author.name == authorname) {
          print("Correct Image Found! -> ${ImageData[j].text}");
          //If Poll with Specific Author Exists
          user_images.add(poll);
          print("User Image Now: $user_images");
        }
      }
    }
  }
  print("FInal UserImagezes: $user_images");
  return user_images;
}
