import 'package:flutter/material.dart';
import '../../Controllers/LoginController.dart';
import 'LoginPage.dart';


class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {


  LoginController loginController = new LoginController();



  logout (){
    loginController.signOut().then((_){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginPage();}), ModalRoute.withName('/'));
    });





    print('logout');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: (){logout();},
          child: Text('Logout Button'),


        )
      )
    );
  }
}


