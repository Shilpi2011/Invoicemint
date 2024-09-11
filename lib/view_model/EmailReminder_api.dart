import 'dart:convert';
import 'package:Invoicemint/model/email_response.dart';
import 'package:Invoicemint/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetEmailReminderMessage with ChangeNotifier {
  GetEmailResponse? _data;
  String accessToken = '';


  GetEmailResponse? get data => _data;


  Future<void> initialize() async {
    final preferences = await SharedPreferences.getInstance();
    accessToken = preferences.getString('accesstoken') ?? '';
    invoiceId = preferences.getInt('invoiceId') ?? 0;
    notifyListeners();
  }

  Future<void> fetchData() async {
    if (accessToken.isEmpty || invoiceId == 0) {
      print("AccessToken or InvoiceId is not set properly.");
      return;
    }

    try {
      final response = await http.get(
        Uri.parse('http://www.invoicemint.in/email/reminder/$invoiceId'),
        headers: {
          "Authorization": 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        print('Email get message: ${response.body}');
        var data = json.decode(response.body);
        print("Response Data: $data");
        _data = GetEmailResponse.fromJson(data);
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
