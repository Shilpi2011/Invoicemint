import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SentEmailProvider with ChangeNotifier {
  bool _isSending = false;
  String _errorMessage = '';

  bool get isSending => _isSending;
  String get errorMessage => _errorMessage;
  String accessToken = '';
  int userId = 0;

    Future<void> accessMethod() async {
    final preferences = await SharedPreferences.getInstance();
    accessToken = preferences.getString('accesstoken') ?? "Not found";
    userId = preferences.getInt('userId') ?? 0;
  }


  Future<void> sendEmail( int invoiceId,String email,String cc,String emailSubject, String emailBody) async {
    _isSending = true;
    notifyListeners();

    var uri = Uri.parse('https://www.invoicemint.in/email/send');
    var request = http.MultipartRequest('POST', uri);
    request.fields['id'] = invoiceId.toString();
    request.fields['clientEmail'] = email;
    request.fields['cc'] = cc;
    request.fields['emailSubject'] = emailSubject;
    request.fields['emailContent'] =emailBody;
  

    request.headers['Authorization'] = 'Bearer $accessToken';
    var response = await request.send();

    _isSending = false;
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      Fluttertoast.showToast(
        msg: 'Email sent successfully: $responseBody',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      String responseBody = await response.stream.bytesToString();
      _errorMessage = 'Error: ${response.reasonPhrase}, $responseBody';
      Fluttertoast.showToast(
        msg: _errorMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }

    notifyListeners();
  }
}
