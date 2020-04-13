import 'package:flutter/material.dart';
class Traveler extends StatefulWidget {
  @override
  _TravelerState createState() => _TravelerState();
}

class _TravelerState extends State<Traveler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Guider Page'),
          ],
        )
      ),
    );
  }
}