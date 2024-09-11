import 'package:Invoicemint/model/whatsappMessage_Response.dart';
import 'package:Invoicemint/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetWhatsAppMessage with ChangeNotifier {
  WhatsAppMessageResponse? _data;

 WhatsAppMessageResponse? get data => _data;


  Future<void> fetchData() async {
    try {
      var response = await http.get(Uri.parse('https://www.invoicemint.in/whatsapp/$invoiceId'),
        headers: {
          "Authorization": 'Bearer $accessToken',
        },
      );
      if (response.statusCode == 200) {
       print('WhatsApp get message:$response');
        var data = json.decode(response.body);
        print("Response Data: $data");
        _data = WhatsAppMessageResponse.fromJson(data);
        print(_data);
        notifyListeners();
      } else {
       print("WhatsApp Response Fail:$response");
        print("Error: ${response.statusCode}");
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
      throw Exception("Exception: $e");
    }
  }
}
