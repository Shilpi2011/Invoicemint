import 'package:Invoicemint/model/editInvoice.dart';
import 'package:Invoicemint/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetEditInvoice with ChangeNotifier {
 EditInvoiceResponse? _data;

 EditInvoiceResponse? get data => _data;


  Future<void> fetchData() async {
    try {
      var response = await http.get(Uri.parse('http://www.invoicemint.in/create-invoice/invoice-edit/$invoiceId'),
        headers: {
          "Authorization": 'Bearer $accessToken',
        },
      );
      if (response.statusCode == 200) {
       print('Edit Invoice:$response');
        var data = json.decode(response.body);
        print("Response Data: $data");
        _data = EditInvoiceResponse.fromJson(data);
        print(_data);
        notifyListeners();
      } else {
       print("Edit Invoice Response Fail:$response");
        print("Error: ${response.statusCode}");
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
      throw Exception("Exception: $e");
    }
  }
}
