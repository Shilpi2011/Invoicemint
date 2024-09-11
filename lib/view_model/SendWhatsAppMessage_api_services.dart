import 'package:Invoicemint/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class SentWhatsAppMessageProvider with ChangeNotifier {
  bool _isSending = false;
  String _errorMessage = '';

  bool get isSending => _isSending;
  String get errorMessage => _errorMessage;

  Future<void> sendWhatsAppMessage(bool reminder, String message, int invoiceId, String number) async {
    _isSending = true;
    notifyListeners();

    var uri = Uri.parse('https://www.invoicemint.in/whatsapp/send');
    var request = http.MultipartRequest('POST', uri);

    request.fields['reminder'] = reminder.toString();
    request.fields['message'] = message;
    request.fields['invoiceId'] = invoiceId.toString();
    request.fields['number'] = number;

    request.headers['Authorization'] = 'Bearer $accessToken';
    var response = await request.send();

    _isSending = false;
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      Fluttertoast.showToast(
        msg: 'WhatsApp message sent successfully: $responseBody',
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
