import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  
    Future setToken(String value) async {
      final prefs = await SharedPreferences.getInstance();
      return prefs.setString('token', value);
    }

    Future getToken() async {
      final prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      return token;
    }

}