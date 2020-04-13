import 'package:flutter/material.dart';
class Guider extends StatefulWidget {
  @override
  _GuiderState createState() => _GuiderState();
}

class _GuiderState extends State<Guider> {
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