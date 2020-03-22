import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final DocumentReference documentReference = Firestore.instance.document('myData/dummy');
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> _signIn() async{
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
   );

    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;

  }

  void _signOut(){
    _googleSignIn.signOut();
    print('User Signed Out');
  }
  void _add(){
    Map<String,String> data = <String, String>{
      "name":"tharindu kavishna",
      "desc":"Flutter Developer"
    };
    documentReference.setData(data).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));
  }
  void _delete(){

  }
  void _update(){

  }
  void _fetch(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Demo'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                onPressed: () => _signIn()
                                  .then((FirebaseUser user) => print(user))
                                  .catchError((e) => print(e)),
                child: Text('Sign in'),
                color: Colors.green,
                ),
                Padding(padding: const EdgeInsets.all(10.0)),
                RaisedButton(
                  onPressed: _signOut,
                  child: Text('Sign out'),
                  color: Colors.red,
                  ),
                Padding(padding: const EdgeInsets.all(10.0)),
                RaisedButton(
                  onPressed: _add,
                  child: Text('Add'),
                  color: Colors.cyan,
                  ),
                Padding(padding: const EdgeInsets.all(10.0)),
                RaisedButton(
                  onPressed: _update,
                  child: Text('Update'),
                  color: Colors.lightBlue,
                  ),
                  Padding(padding: const EdgeInsets.all(10.0)),
                RaisedButton(
                  onPressed: _delete,
                  child: Text('Delete'),
                  color: Colors.orange,
                  ),
                  Padding(padding: const EdgeInsets.all(10.0)),
                RaisedButton(
                  onPressed: _fetch,
                  child: Text('Fetch'),
                  color: Colors.lightGreen,
                  ),
            ],            
          ),
        ),
    );
  }
}