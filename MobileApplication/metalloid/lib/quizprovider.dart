class Author {
  final String imageUrl;
  final String name;
  Author({this.name, this.imageUrl});

  void addAuthor({String name, String imageUrl}) {
    authors.add(Author(name: name, imageUrl: imageUrl));
  }
}

List<Author> authors = [
  Author(name: "Alex Hefner", imageUrl: "https://picsum.photos/g/400/400/"),
  Author(name: "TheDarkLord", imageUrl: "https://picsum.photos/g/400/400/"),
  Author(name: "JoeyTheSlayer", imageUrl: "https://picsum.photos/g/200/200/"),
  Author(name: "Manas Hejmadi", imageUrl: "https://picsum.photos/g/200/200/"),
];

List<Author> getAuthors() {
  return authors;
}

class QuizItem {
  final String quizName;
  final String backgroundUrl;
  final Author author;

  QuizItem({this.quizName, this.author, this.backgroundUrl});
}

List<QuizItem> quizzes = [
  QuizItem(
      quizName: "Test Your Metallica Knowledge",
      author: getAuthors()[3],
      backgroundUrl:
          "https://www.morrisonhotelgallery.com/images/big/MHG-MTLCA-Band.jpg"),
  QuizItem(
      quizName: "Corey Taylor Quiz",
      author: getAuthors()[0],
      backgroundUrl:
          "https://wrat.com/wp-content/uploads/sites/27/2016/03/482228878-e1459274872374.jpg?width=970&height=545&anchor=middlecenter&mode=crop"),
  QuizItem(
      quizName: "Test Your Slipknot Knowledge",
      author: getAuthors()[3],
      backgroundUrl:
          "https://townsquare.media/site/366/files/2018/11/Slipknot.jpg"),
  QuizItem(
      quizName: "Test Your Heavy Metal Knowledge",
      author: getAuthors()[3],
      backgroundUrl:
          "http://mediad.publicbroadcasting.net/p/kstx/files/styles/x_large/public/201810/pexels-rock-guitar.jpeg"),
];

List<QuizItem> getQuizzes() {
  return quizzes;
}

List<QuizItem> ReturnSpecificUserQuizzes(String authorname) {
  final List<QuizItem> quizData = getQuizzes();
  final List<Author> authorData = getAuthors();
  print(
      "=========================IN RETURNUSERSPECIFICPOLLS===========================");
  List<QuizItem> user_quizzes = [];
  for (int i = 0; i < authorData.length; i++) {
    print("Author: ${authorData[i].name}");
    if (authorData[i].name == authorname) {
      print("Correct Author Found! -> ${authorData[i].name}");
      //Author Exists
      for (int j = 0; j < quizData.length; j++) {
        print("QuizName: ${quizData[j].quizName}");
        QuizItem poll = quizData[j];
        if (poll.author.name == authorname) {
          print("Correct Quiz Found! -> ${quizData[j].quizName}");
          //If Poll with Specific Author Exists
          user_quizzes.add(poll);
          print("User Quiz Now: $user_quizzes");
        }
      }
    }
  }
  print("FInal UserQuizzes: $user_quizzes");
  return user_quizzes;
}