

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:lista_debiti/Controllers/BaseController.dart';

class LoginController extends BaseController{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    IdTokenResult idTokenResult = await user.getIdToken();

    String idToken = idTokenResult.token;

    assert(!user.isAnonymous);
    assert(idTokenResult != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    sendLogin(idToken);

    return 'signInWithGoogle succeeded: $user';
  }

  Future signOut() async {
    await _auth.signOut();
  }

  Future sendLogin(idToken) async {
    var url = "http://127.0.0.1:8000/token/";

    var response = await http.post(url,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {"token": idToken});

    return response;
  }

  Future getNewToken() async {
    FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    IdTokenResult idTokenResult = await currentUser.getIdToken(refresh: true);
    String token = idTokenResult.token;

    return (token);
  }

  
}
