import 'dart:convert';
import 'package:Invoicemint/model/user_client_list_response.dart';
import 'package:Invoicemint/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClientListProvider extends ChangeNotifier {
  List<UserClientListResponse> _clientList = [];
  String _errorMessage = '';
  bool _isLoading = false;

  List<UserClientListResponse> get clientList => _clientList;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<void> getClientListApi() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('https://www.invoicemint.in/clients/api/$businessId'),
        headers: {
          "Authorization": 'Bearer $accessToken'
        },
      );

      var jsonRes = json.decode(response.body);
      if (response.statusCode == 200) {
        print('Client Success Response');
        _clientList = (jsonRes as List) .map((json) => UserClientListResponse.fromJson(json)).toList();
        print("Client List Response:$_clientList");
        _errorMessage = '';
      } else if (response.statusCode == 401) {
        _errorMessage = "Unauthorized access";
        _clientList = [];
      } else {
        _errorMessage = response.reasonPhrase ?? "Unknown error";
        _clientList = [];
      }
    } catch (e) {
      _errorMessage = "Error occurred: $e";
      _clientList = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

}
