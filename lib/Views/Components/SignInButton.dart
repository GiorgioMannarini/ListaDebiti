import 'package:flutter/material.dart';
import '../../Controllers/LoginController.dart';
import '../Screens/FirstScreen_old.dart';

class SignInButton extends StatelessWidget {

  final LoginController loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        loginController.signInWithGoogle().then((idToken) {
          loginController.sendLogin(idToken).then((result){
            if (result == true){
              Navigator.pushNamed(context, '/mainPage');
            }
          });


        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/images/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
