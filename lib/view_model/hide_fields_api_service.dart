import 'package:Invoicemint/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FieldProvider with ChangeNotifier {
  String _responseMessage = '';

  String get responseMessage => _responseMessage;

  Future<void> hideField() async {
    final String url = 'https://www.invoicemint.in/fields/hide/$fieldId';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        _responseMessage = response.body; 
      } else {
        _responseMessage = 'Failed to hide field. Status code: ${response.statusCode}';
      }
    } catch (error) {
      _responseMessage = 'Error: $error';
    }

    notifyListeners();
  }
}
