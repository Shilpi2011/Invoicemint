import 'dart:convert';
import 'package:Invoicemint/model/get_fields.dart';
import 'package:Invoicemint/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClientFieldsProvider extends ChangeNotifier {
  List<ClientFieldsResponse> _clientFields = [];

  String _errorMessage = '';
  bool _isLoading = false;

 List<ClientFieldsResponse> get clientFields => _clientFields;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<void> fetchClientFields() async {
    _isLoading = true;
    try {
      final response = await http.get(
        Uri.parse('https://www.invoicemint.in/fields/client/72'),
        headers: {
          "Authorization": 'Bearer $accessToken'
        },
      );
      var jsonRes = json.decode(response.body);
      if (response.statusCode == 200) {
       _clientFields = (jsonRes as List) .map((json) => ClientFieldsResponse.fromJson(json))
            .toList();
        _errorMessage = '';
      } else if (response.statusCode == 401) {
        _errorMessage = "Unauthorized access";
       _clientFields = [];
      } else {
        _errorMessage = response.reasonPhrase ?? "Unknown error";
       _clientFields = [];
      }
    } catch (e) {
      _errorMessage = "Error occurred: $e";
     _clientFields = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

}

