class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;

  ChatModel({
    required this.name,
    required this.message,
    required this.time,
    required this.avatarUrl,
  });

  void addChat(String name, String message, String time, String avatarUrl) {
    data.add(new ChatModel(
        name: name, message: message, time: time, avatarUrl: avatarUrl));
  }
}

List<ChatModel> data = [
  new ChatModel(
      name: "Kurt Cobain",
      message: "Sample Message",
      time: "11:11 p.m",
      avatarUrl:
          "https://imagesvc.timeincapp.com/v3/mm/image?url=https%3A%2F%2Ftimedotcom.files.wordpress.com%2F2014%2F03%2F3220062.jpg&w=800&c=sc&poi=face&q=85"),
  new ChatModel(
      name: "Paul Gray",
      message: "Sample Message",
      time: "11:11 p.m",
      avatarUrl:
          "https://scontent.fblr2-1.fna.fbcdn.net/v/t1.0-9/11947_668480996551562_3912383606737807178_n.jpg?_nc_cat=104&_nc_ht=scontent.fblr2-1.fna&oh=b4b4feddde9507ed5570ae1f59d4757e&oe=5D465052"),
  new ChatModel(
      name: "Corey Taylor",
      message: "Sample Message",
      time: "6:51 p.m",
      avatarUrl:
          "https://m.media-amazon.com/images/M/MV5BZjc3OGRhMjQtZjJmMy00MTYxLTkyNTMtNjE3YjY3NDgzMGQ3XkEyXkFqcGdeQXVyMjUyNDk2ODc@._V1_.jpg"),
  new ChatModel(
      name: "Serj Tankian",
      message: "Sample Message",
      time: "4:35 p.m",
      avatarUrl:
          "https://cdn.mos.cms.futurecdn.net/j4gtGi3qSQpNwYYTadUPXh.jpg"),
  new ChatModel(
      name: "Shawn Crahan",
      message: "Sample Message",
      time: "3:41 p.m",
      avatarUrl:
          "https://assets.blabbermouth.net/media/shawnclowncrahanslipknotdevil_638.jpg"),
  new ChatModel(
      name: "Matthew Tuck",
      message: "Sample Message",
      time: "3:41 p.m",
      avatarUrl:
          "https://www.revolvermag.com/sites/default/files/media/images/premium-video/bfmv_1.jpg"),
  new ChatModel(
      name: "Joey Jordison",
      message: "Sample Message",
      time: "3:00 p.m",
      avatarUrl:
          "https://assets.blabbermouth.net/media/joeyjordisonvimic2017_638.jpg"),
];

List<ChatModel> getList() {
  return data;
}
