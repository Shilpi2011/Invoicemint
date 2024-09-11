import 'package:Invoicemint/model/progress_indicator_response.dart';
import 'package:Invoicemint/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProgressInvoiceIndicator with ChangeNotifier {
  DashboardProgressResponse? _data;

  DashboardProgressResponse? get data => _data;

  Future<void> fetchData() async {
    try {
      var response = await http.get(  Uri.parse('https://www.invoicemint.in/dashboards/all/$userId'),
        headers: {
          "Authorization": 'Bearer $accessToken',
        },
      );
      if (response.statusCode == 200) {
        print(response);
        var data = json.decode(response.body);
        print("Response Data: $data");
        _data = DashboardProgressResponse.fromJson(data);
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
   List<Map<String, dynamic>> get dashboardProgressList {
    if (_data == null) return [];
    return [
      {'label': 'Total Invoices', 'value': _data!.totalInvoiceData},
      {'label': 'Paid Invoices', 'value': _data!.paidInvoiceData},
      {'label': 'Unpaid Invoices', 'value': _data!.unpaidInvoiceData},
      {'label': 'Overdue Invoices', 'value': _data!.overdueInvoiceData},
      {'label': 'Total Amount', 'value': _data!.totalAmountData?.toString() ?? 'N/A'},
      {'label': 'Paid Amount', 'value': _data!.paidAmountData?.toString() ?? 'N/A'},
      {'label': 'Unpaid Amount', 'value': _data!.unpaidAmountData?.toString() ?? 'N/A'},
      {'label': 'Overdue Amount', 'value': _data!.overdueAmountData?.toString() ?? 'N/A'},
    ];
  }
}



