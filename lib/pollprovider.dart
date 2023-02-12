//============================================Providers=====================================================
//Author
class Author {
  final String imageUrl;
  final String name;
  Author({required this.name, required this.imageUrl});

  void addAuthor({required String name, required String imageUrl}) {
    authors.add(Author(name: name, imageUrl: imageUrl));
  }
}

List<Author> authors = [
  Author(name: "Alex Hefner", imageUrl: "https://picsum.photos/400/400/"),
  Author(name: "TheDarkLord", imageUrl: "https://picsum.photos/g/400/400/"),
  Author(name: "JoeyTheSlayer", imageUrl: "https://picsum.photos/g/200/200/"),
  Author(name: "Manas Hejmadi", imageUrl: "https://picsum.photos/200/200/"),
];

List<Author> getAuthors() {
  return authors;
}

class PollItem {
  final Author author;
  final int time;
  final String pollName;
  final String desc;
  final List<String> options;
  final int votes;
  final int validity;

  PollItem(
      {required this.author,
      required this.pollName,
      required this.desc,
      required this.options,
      required this.time,
      required this.votes,
      required this.validity});

  void addPollItem({
    required Author author,
    required String pollName,
    required String desc,
    required List<String> options,
    required int time,
    required int votes,
    required int validity,
  }) {}
}

List<PollItem> polls = [
  PollItem(
      author: getAuthors()[3],
      pollName: "Most Anticipated New Album",
      desc:
          "Personally I'm really excited for the new Slipknot album, also I dont think Tool will ever release a new album XD",
      options: ['Slipknot', 'Tool', 'Amon Amarth', 'Metallica'],
      time: 12,
      votes: 225,
      validity: 2),
  PollItem(
      author: getAuthors()[2],
      pollName: "Who has the best Stage Performance?",
      desc:
          "There are a lot of bands who know how to hype up the Crowd . I believe Slipknot are the masters of required this! What say?",
      options: [
        'Slipknot',
        'Metallica',
        'Slayer',
        'Led Zepplin',
        'Iron Maiden'
      ],
      time: 33,
      votes: 12,
      validity: 5),
  PollItem(
      author: getAuthors()[1],
      pollName: "Best Death Metal Bands",
      desc:
          "I Connect very well with Death Metal. It Satisfies my soul. Which Death Metal Band is your personal favourite?",
      options: [
        'Cannibal Corpse',
        'Amon Amarth',
        'Napalm Death',
        'Behemoth',
        'Morbid Angel'
      ],
      time: 45,
      votes: 28,
      validity: 1),
  PollItem(
      author: getAuthors()[0],
      pollName: "Slipknot's Heaviest Album",
      desc:
          "Slipknot is my all time favourite band. Many people complain that over the years there is a steady decline in the band's heaviness. Lets Compare the Albums today!",
      options: [
        'Mate.Feed.Kill.Repeat - Demo 1997',
        'Slipknot 1999',
        'Iowa - 2001',
        'The Subliminal Verses - 2004',
        'All Hope is Gone - 2009',
        '.5 The Gray Chapter - 2014'
      ],
      time: 22,
      votes: 666,
      validity: 12),
  PollItem(
      author: getAuthors()[3],
      pollName: "Slipknot's Best Song",
      desc:
          "Slipknot Consistently releases amazing songs! Which one is your favourite?",
      options: [
        'All Out Life',
        '(Sic)',
        'Custer',
        'Psychosocial',
        'Spit It Out',
      ],
      time: 11,
      votes: 193,
      validity: 12),
];

List<PollItem> getPolls() {
  return polls;
}

List<PollItem> ReturnSpecificUserPolls(String authorname) {
  final List<PollItem> pollsData = getPolls();
  final List<Author> authorData = getAuthors();
  print(
      "=========================IN RETURNUSERSPECIFICPOLLS===========================");
  List<PollItem> user_polls = [];
  for (int i = 0; i < authorData.length; i++) {
    print("Author: ${authorData[i].name}");
    if (authorData[i].name == authorname) {
      print("Correct Author Found! -> ${authorData[i].name}");
      //Author Exists
      for (int j = 0; j < pollsData.length; j++) {
        print("PollName: ${pollsData[j].pollName}");
        PollItem poll = pollsData[j];
        if (poll.author.name == authorname) {
          print("Correct Poll Found! -> ${pollsData[j].pollName}");
          //If Poll with Specific Author Exists
          user_polls.add(poll);
          print("User Poll Now: $user_polls");
        }
      }
    }
  }
  print("FInal UserPolls: $user_polls");
  return user_polls;
}

//============================================end of Providers==============================================
