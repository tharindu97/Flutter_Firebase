import 'package:flutter/material.dart';
class Register extends StatefulWidget {
  
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {

        final contactField = TextField(
              obscureText: false,
              style: style.copyWith(
                color: Color(0xFF00E676),
              ),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Contact Number",
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),)),
                  
            );
        final guiderButon = Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xFF00E676),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {

            },
            child: Text("Guider",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        );

        final travelerButon = Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xFF00E676),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {},
            child: Text("Traveler",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        );
        return Scaffold(
          body: Center(
            child: Container(
              color: Color(0xFF303030),
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      child: Image.asset(
                        "assets/sanda.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    contactField,
                    SizedBox(height: 65.0),
                    travelerButon,
                     SizedBox(
                      height: 15.0,
                    ),
                    Text('or',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                        ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    guiderButon,
                  ],
                ),
              ),
            ),
          ),
        );
  }
}