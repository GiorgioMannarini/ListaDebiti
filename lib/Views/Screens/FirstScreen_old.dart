import 'package:flutter/material.dart';
import '../../Controllers/LoginController.dart';
import 'LoginPage.dart';


class FirstScreenOld extends StatefulWidget {
  @override
  _FirstScreenOldState createState() => _FirstScreenOldState();
}

class _FirstScreenOldState extends State<FirstScreenOld> {


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


