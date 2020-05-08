import 'package:flutter/material.dart';
import '../../Controllers/LoginController.dart';


class SignInButton extends StatelessWidget {
  VoidCallback updateState;
  BuildContext parentContext;
  final LoginController loginController = LoginController();

  SignInButton({@required this.updateState, @required this.parentContext});


  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        this.updateState();
        loginController.signInWithGoogle().then((idToken) {
          loginController.sendLogin(idToken).then((result){
            if (result == true){
              Navigator.pushNamed(parentContext, '/mainPage');
            }
            else{
              this.updateState();
            }
          }).catchError((err){
            this.updateState();
          });


        }).catchError((err){
          this.updateState();
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
