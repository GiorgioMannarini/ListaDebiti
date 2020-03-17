import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Controllers/LoginController.dart';
import './LoginPage.dart';
import '../Components/ContainerButton.dart';
import '../../Controllers/FirstScreenController.dart';


class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final LoginController loginController = LoginController();

  final FirstScreenController firstScreenController = FirstScreenController();


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Lista Debiti', 
        style: TextStyle(
          color: Colors.black,
        ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(0xffdfe4ea)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                      child: Text('Signout'),
                      onPressed: () {
                        /*loginController.signOutGoogle().then((_) {
                        
                         Navigator.pushNamed(context, '/');
                        });*/
                      }),
                ],
              ),
            ),
          ),

          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 21),
                height: MediaQuery.of(context).size.height/4,
                width: MediaQuery.of(context).size.width,

                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      color: Colors.grey[300],
                      spreadRadius: 5.0,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(41),
                    bottomRight: Radius.circular(41)
                  ),
                  color: Colors.white,
                ),
              ),
              //TODO: row con tutti i pulsanti
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 100,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      color: Colors.grey[300],
                      spreadRadius: 5.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(
                    41
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  children: <Widget>[
                   ContainerButton("Log1", FaIcon(FontAwesomeIcons.signOutAlt), Colors.purple, (){firstScreenController.logoutButton(context);} ),
                   ContainerButton("Logout", FaIcon(FontAwesomeIcons.signOutAlt), Colors.orange, (){print('prova3');}),
                   ContainerButton("Logout", FaIcon(FontAwesomeIcons.signOutAlt), Colors.greenAccent, (){print('prova2');}),
                    
                    
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                )
              )
            ],
          ),
        ],
      ),
    );
  }
}


