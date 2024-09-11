import 'dart:convert';
import 'package:Invoicemint/model/login_response.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class LoginProvider with ChangeNotifier {
  bool _isLogin = false;
  bool get isLogin => _isLogin;


Future<void> loginUser(String email, String password) async {
    _isLogin = true;
    notifyListeners();

    var requestBody = jsonEncode({
      "email": email,
      "password": password,
    });

    try {
      var response = await http.post(
        Uri.parse('https://www.invoicemint.in/api/auth/signin'),
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );
      if (response.statusCode == 200) {
        var jsonRes = json.decode(response.body);
        LoginResponse loginresponse = LoginResponse.fromJson(jsonRes);
        final preferences = await SharedPreferences.getInstance();
        await preferences.setString('accesstoken', loginresponse.jwt);
        await preferences.setInt('userId', loginresponse.userId);
        await preferences.setBool('isLogged', true);

        Fluttertoast.showToast(
          msg: 'Login Successfully',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        Fluttertoast.showToast(
          msg: 'Error: ${response.reasonPhrase}',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'An error occurred: $e',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } finally {
      _isLogin = false;
      notifyListeners();
    }
  }
}
