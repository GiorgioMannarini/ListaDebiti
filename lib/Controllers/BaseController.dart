// base controller
import 'package:shared_preferences/shared_preferences.dart';

class BaseController {
  
   //ritorna true se il token esiste, false se non esiste
  Future<bool> getTokenValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    if (token == null){
      return (false);
    }
    else{
      return(true);
    }
  }
}