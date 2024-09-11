import 'dart:convert';
import 'package:Invoicemint/model/user_business_list_response.dart';
import 'package:Invoicemint/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BusinessListProvider extends ChangeNotifier {
  List<UserBusinessListResponse> _businessList = [];
  String _errorMessage = '';
  bool _isLoading = false;

  List<UserBusinessListResponse> get businessList => _businessList;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<void> getBusinessListApi() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await http.get(
        Uri.parse('https://www.invoicemint.in/businesses/selectBusiness?userId=$userId'),
        headers: {
          "Authorization": 'Bearer $accessToken'
        },
      );

      var jsonRes = json.decode(response.body);
      if (response.statusCode == 200) {
        _businessList = (jsonRes as List) .map((json) => UserBusinessListResponse.fromJson(json))
            .toList();
            print(_businessList);
        _errorMessage = '';
      } else if (response.statusCode == 401) {
        _errorMessage = "Unauthorized access";
        _businessList = [];
      } else {
        _errorMessage = response.reasonPhrase ?? "Unknown error";
        _businessList = [];
      }
    } catch (e) {
      _errorMessage = "Error occurred: $e";
      _businessList = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

}
