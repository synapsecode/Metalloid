import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String actionText;
  final icon;
  final Function event;

  //Constructor
  ActionButton(this.actionText, this.icon, this.event);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FloatingActionButton(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          child: Icon(icon),
          onPressed: () => event(),
        ),
        Padding(padding: EdgeInsets.only(bottom: 10.0)),
        Text(actionText)
      ],
    );
  }
}

class AddOptionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 50.0, bottom: 50.0, left: 10.0, right: 10.0),
      child: OrientationBuilder(builder: (context, orientation) {
        return GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          children: <Widget>[
            ActionButton('New Image', Icons.image, () {
              print('Clicked Image');
            }),
            ActionButton('Link', Icons.link, () {
              print('Clicked Link');
            }),
            ActionButton('New Blog', Icons.create, () {
              print('Clicked Blog');
            }),
            ActionButton('New Poll', Icons.poll, () {
              print('Clicked Poll');
            }),
            ActionButton('New Quiz', Icons.check_box, () {
              print('Clicked Quiz');
            }),
            ActionButton('Wiki Entry', Icons.devices, () {
              print('Clicked Wiki Entry');
            }),
            ActionButton('ChatRoom', Icons.device_hub, () {
              print('Clicked ChatRoom');
            }),
            ActionButton('Ask Question', Icons.question_answer, () {
              print('Clicked QA');
            }),
            ActionButton('All Drafts', Icons.drafts, () {
              print('Clicked Drafts');
            }),
          ],
        );
      }),
    );
  }
}

// [['Image', 'Link', 'Function'], ['Image', 'Link', 'Function'], ['Image', 'Link', 'Function']]

class FloatingCircleButton extends StatefulWidget {
  @override
  _FloatingCircleButtonState createState() => new _FloatingCircleButtonState();
}

class _FloatingCircleButtonState extends State<FloatingCircleButton> {
  void openActionSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return AddOptionsWidget();
        });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: openActionSheet,
      child: new Icon(Icons.add),
      tooltip: "Create Content",
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
    );
  }
}
