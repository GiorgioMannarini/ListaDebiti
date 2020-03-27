import 'package:flutter/material.dart';
import 'package:lista_debiti/Views/Screens/FirstScreen.dart';
import 'Views/Screens/EasterEgg.dart';

import 'package:lista_debiti/Views/Screens/LoginPage.dart';
//TODO: Keystore registration

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //routes
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/mainPage': (context) =>FirstScreen(),
        '/easterEgg': (context) =>EasterEggScreen(),

      },
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue, 
        accentColor: Colors.purple,
        
      ),
      
    );
  }
}


