import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';




void main() => runApp(myshopapp());


class myshopapp extends StatefulWidget {
  @override
  _myshopappState createState() => _myshopappState();
}

class _myshopappState extends State<myshopapp> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = await _auth.signInWithCredential(credential);
    print("signed in " + user.displayName);
    return user;
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'myshop app',
      home: Scaffold(

        body: Center(child: RaisedButton(onPressed:(){ _handleSignIn();},),),

      ),
    );
  }
}

