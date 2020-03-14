import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../Components/SignInButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Controllers/LoginController.dart';
import './FirstScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool loginPresent = false;
  String idToken;



  LoginController loginController = LoginController();

 

  
  doSilentLogin(token) {

    loginController.sendRequest(token).then((result) {
      if (result.statusCode == 200){
        SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.pushNamed(context, '/mainPage');
      });
      }
      else{
        setState(() {
        loginPresent = false;
        idToken = null;
      });

      }
      
    }).catchError((error) async {
      
      setState(() {
        loginPresent = false;
        idToken = null;
      });
    });
  }

  


  //quando viene istanziata. Costruttore.
  _LoginPageState() {
    
    loginController.getTokenValue().then((res) {
  
      if (res) {
        loginController.getNewToken().then((token){
    
          idToken = token;
        }).then((_){
          setState(() {
          loginPresent = true; //se il token c'è mostra il circular indicator
        });
        });
        
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (idToken != null) {
      doSilentLogin(idToken);
    }
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
