// base controller
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class BaseController {

  Future getCurrentUser() async {
    FirebaseUser _user = await FirebaseAuth.instance.currentUser();
    return _user;
  }
  Future getNewToken() async {
    FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    IdTokenResult idTokenResult = await currentUser.getIdToken(refresh: true);
    String token = idTokenResult.token;

    return (token);
  }
  Future sendLogin(idToken) async {
    var url = "http://127.0.0.1:8000/token/";

    var response = await http.post(url,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {"token": idToken});

    if (response.statusCode == 200){
      return true;
    }
    else { 
      print('sono sendlogin');
      return false;
    }


  }

}