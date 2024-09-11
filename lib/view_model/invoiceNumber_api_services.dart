import 'package:Invoicemint/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class InvoiceNumberProvider with ChangeNotifier {
  String _invoiceNumber = '';
  String get invoiceNumber => _invoiceNumber;

  Future<void> fetchInvoiceNumber() async {
    try {
      var response = await http.get(
        Uri.parse('https://www.invoicemint.in/create-invoice/invoice-number?userId=1&date=26-08-2024'),
        headers: {
          "Authorization": 'Bearer $accessToken',
        },
      );
      if (response.statusCode == 200) {
        final data = response.body; 
        print(data);
        _invoiceNumber = data; 
      notifyListeners();
      } else {
        throw Exception('Failed to load invoice number');
      }
    } catch (error) {
      throw error;
    }
  }
}
