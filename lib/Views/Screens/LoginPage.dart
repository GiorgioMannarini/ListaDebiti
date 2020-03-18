import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../Components/SignInButton.dart';
import '../../Controllers/LoginController.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loginPresent = false;
  LoginController loginController = LoginController();

  //quando viene istanziata.
  void initState() {
    super.initState();
    loginController.getCurrentUser().then((user) {
      if (user != null) {
        setState(() {
          loginPresent = true;
        });
        //refresha il token dell'utente loggato ed esegue il silent login
        loginController.getNewToken().then((tk) {
          doSilentLogin(tk);
        });
      }
    });
  }

  void doSilentLogin(token) {
    loginController.sendLogin(token).then((result) {
      if (result == true) {
        Navigator.pushNamed(context, '/mainPage');
      } else {
        setState(() {
          loginPresent = false;
        });
      }
    }).catchError((error) {
      setState(() {
        loginPresent = false;
      });
    });
  }





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(size: 150),
              SizedBox(height: 50),
              loginPresent ? CircularProgressIndicator() : SignInButton()
            ],
          ),
        ),
      ),
    );
  }
}
