import 'package:flutter/material.dart';
import 'package:lista_debiti/Views/Screens/LoginPage.dart';

import 'LoginController.dart';
import 'BaseController.dart';

class FirstScreenController extends BaseController {
  final LoginController loginController = LoginController();

  void logoutButton(BuildContext context) {
    loginController.signOutGoogle().then((_) {
      
      Navigator.pushNamed(context, '/');
    });
  }
}
