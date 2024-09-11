import 'dart:convert';
import 'package:Invoicemint/model/bank_response.dart';
import 'package:Invoicemint/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class BankListProvider extends ChangeNotifier {
  List<BankResponse> _bankList = [];
  String _errorMessage = '';
  bool _isLoading = false;

  List<BankResponse> get businessList => _bankList;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<void> getBankListApi() async {
  _isLoading = true;
  notifyListeners();
  try {
      final response = await http.get(
        Uri.parse('https://www.invoicemint.in/bank/list/$businessId'),
        headers: {
        "Authorization": 'Bearer $accessToken'
        },
      );
      var jsonRes = json.decode(response.body);
      if (response.statusCode == 200) {
  print("Api is successfully :${response}");
        _bankList = (jsonRes as List) .map((json) =>BankResponse.fromJson(json))
            .toList();
            print(_bankList);
        _errorMessage = '';
      } else if (response.statusCode == 401) {
        _errorMessage = "Unauthorized access";
        _bankList = [];
      } else {
        _errorMessage = response.reasonPhrase ?? "Unknown error";
        _bankList = [];
      }
    } catch (e) {
      _errorMessage = "Error occurred: $e";
      _bankList = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

}
