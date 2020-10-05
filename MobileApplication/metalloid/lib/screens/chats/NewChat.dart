import 'package:flutter/material.dart';

void openNewChatDialog(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          child: NewChatWidget(),
        );
      });
}

class NewChatWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NewDM();
  }
}

class NewDM extends StatefulWidget {
  _NewDMState createState() => _NewDMState();
}

class _NewDMState extends State<NewDM> {
  final formkey = GlobalKey<FormState>();
  String username;
  String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Form(
        key: formkey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("New Message",
                      style: TextStyle(
                        color: Colors.white24,
                        fontSize: 36.0,
                        fontFamily: "Calibre-Semibold",
                        letterSpacing: 1.0,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Recipient Username",
                    hintStyle: TextStyle(color: Colors.white12),
                    border: OutlineInputBorder()),
                onSaved: (input) => username = input,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Message",
                    hintStyle: TextStyle(color: Colors.white12),
                    border: OutlineInputBorder()),
                maxLines: 6,
                validator: (input) {},
                onSaved: (input) => message = input,
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: SizedBox(
                      height: 70.0,
                      child: RaisedButton(
                        onPressed: () {
                          if (formkey.currentState.validate()) {
                            formkey.currentState.save();
                            print("Message ('$message') sent to $username");
                            formkey.currentState.reset();
                          }
                        },
                        color: Color(0xFF28a366),
                        child: Text("Send Message"),
                      ),
                    ))
                  ],
                ))
          ],
        ))
    );

  }
}
