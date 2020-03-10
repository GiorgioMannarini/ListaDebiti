import 'package:flutter/material.dart';
import '../../Controllers/LoginController.dart';
import './LoginPage.dart';

class FirstScreen extends StatelessWidget {
  final LoginController loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text('Signout'),
                onPressed: () {
                  loginController.signOutGoogle().then((_){
                    Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginPage();
                      },
                    ),
                  );
                  });
                }),
          ],
        ),
      ),
    );
  }
}
