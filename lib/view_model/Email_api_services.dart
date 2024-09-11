import 'package:Invoicemint/model/email_response.dart';
import 'package:Invoicemint/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetEmailMessage with ChangeNotifier {
   GetEmailResponse? _data;

  GetEmailResponse? get data => _data;


  Future<void> fetchData() async {
    try {
      var response = await http.get(Uri.parse('https://www.invoicemint.in/email/$invoiceId'),
        headers: {
          "Authorization": 'Bearer $accessToken',
        },
      );
      if (response.statusCode == 200) {
       print('Email get message:$response');
        var data = json.decode(response.body);
        print("Response Data: $data");
        _data =  GetEmailResponse.fromJson(data);
        print(_data);
        notifyListeners();
      } else {
        print("Error: ${response.statusCode}");
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
      throw Exception("Exception: $e");
    }
  }
}
