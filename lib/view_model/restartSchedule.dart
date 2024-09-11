import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:Invoicemint/utils/global.dart';

class RestartScheduleProvider with ChangeNotifier {
  final String url = 'https://www.invoicemint.in/scheduler/remove/$messageId'; 
  String _data = '';

  String get data => _data;

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        _data = response.body;
      } else {
        throw Exception('Failed to load data');
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
