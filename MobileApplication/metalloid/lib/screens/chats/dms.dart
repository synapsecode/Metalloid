import 'package:flutter/material.dart';
import './dmdataprovider.dart' as dmsprovider;


class DirectMessages extends StatefulWidget {
  @override
  _DirectMessagesState createState() => _DirectMessagesState();
}

class _DirectMessagesState extends State<DirectMessages> {
  @override
  Widget build(BuildContext context) {
    List<dmsprovider.ChatModel> data = dmsprovider.getList();
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, i) => new Column(
            children: <Widget>[
              new Divider(
                height: 10.0,
              ),
              new ListTile(
                  leading: new CircleAvatar(
                    foregroundColor: Color(0xFF28a366),
                    backgroundColor: Colors.black12,
                    backgroundImage: NetworkImage(data[i].avatarUrl),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(data[i].name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      new Text(
                        data[i].time,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Colors.white24),
                      )
                    ],
                  ),
                  subtitle: Container(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      data[i].message,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.white54),
                    ),
                  ),
                  onTap: () => print("Clicked on ${data[i].name}'s Chat"))
            ],
          ),
    );
  }
}