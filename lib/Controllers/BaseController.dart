// base controller
import 'package:firebase_auth/firebase_auth.dart';

class BaseController {

  Future getCurrentUser() async {
    FirebaseUser _user = await FirebaseAuth.instance.currentUser();
    return _user;
  }
  

}