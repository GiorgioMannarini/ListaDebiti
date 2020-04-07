import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lista_debiti/Views/Screens/LoginPage.dart';
import '../Models/Debit.dart';
import 'LoginController.dart';
import 'BaseController.dart';
import 'package:http/http.dart' as http;

class FirstScreenController extends BaseController {
  final LoginController loginController = LoginController();

  void logoutButton(BuildContext context) {
    loginController.signOut().then((_) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
        return LoginPage();
      }), ModalRoute.withName('/'));
    });
  }
 
  //faccio il POST
Future postDebit(Debit debit, String token) async {
  var url = "http://127.0.0.1:8000/newdebit/";
  var response = await http.post(url, headers: {
    'Content-Type': 'application/x-www-form-urlencoded',
    HttpHeaders.authorizationHeader: token
  }, body: {
    "name": debit.debName,
    "amount": debit.amount.toString(),
    "reason": debit.title, 
    "timestamp": debit.timestamp.toString(),
  });
  if (response.statusCode == 200){
    return true;
  }
  else{
    return false;
  }
}

Future deleteDebit(Debit debit, String token) async {
  var url = "http://127.0.0.1:8000/deletedebit/";
  var response = await http.post(url, headers: {
    'Content-Type': 'application/x-www-form-urlencoded',
    HttpHeaders.authorizationHeader: token
  }, body: {
    "timestamp": debit.timestamp.toString(), //mando solo timestamp insieme a chi ha creato il debito
    
  });
   if (response.statusCode == 200){
    return true;
  }
  else{
    return false;
  }
}
}

