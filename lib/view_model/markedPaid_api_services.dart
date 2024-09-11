import 'dart:convert';
import 'dart:core';
import 'package:Invoicemint/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MarkedPaaidProvider with ChangeNotifier {


Future<void> markedPaid() async {
    var requestBody = jsonEncode({
    "id" : id,
    "taxAmount" : taxAmount,
    "total" : total,
    "amountRecived": amountRecived,
    "transactionCharge" : transactionCharge,
    "tds":tds,
    "tdsWithheld":tdsWithheld,
    "amountToSettle":amountToSettle,
    "InvoiceNo":InvoiceNo,
    "billedTo" : billedTo,
    "paymentDate": paymentDate,
    "PaymentMethod":paymentMethod,
    "notes":notes,
    });

    try {
      var response = await http.post(
        Uri.parse('https://www.invoicemint.in/create-invoice/paid?id=$userId&taxAmount=$taxAmount&total=$total&amountRecived=$amountRecived&transactionCharge=$transactionCharge&tds=$tds&tdsWithheld=$tdsWithheld&amountToSettle=$amountToSettle&$InvoiceNo&$billedTo&paymentDate=$paymentDate&PaymentMethod=$paymentMethod&notes=$notes.&$paymentStatus'),
        headers: {'Authorization': accessToken},
        body: requestBody,
      );

       if (response.statusCode == 200) {
        print(response);
        var data = json.decode(response.body);
        print("Response Data: $data");
        notifyListeners();
      } else {
        print("Error: ${response.statusCode}");
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (e) {
      Exception("Error:$e}");
    } finally {
      notifyListeners();
    }
  }
}
