import 'package:flutter/material.dart';
import 'package:sfeir_library/services/auth.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign in to Sfeir Library'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
          child: Form(
            child: Column(children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(onChanged: (value) {}),
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (value) {},
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text('Se connecter'),
                onPressed: () async {},
              )
            ]),
          ),
        ),
      ),
    );
  }
}
