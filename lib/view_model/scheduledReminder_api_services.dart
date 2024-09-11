import 'package:Invoicemint/model/scheduled_reminder_response.dart';
import 'package:Invoicemint/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ScheduledReminderProvider with ChangeNotifier {
ScheduledReminderResponse? _data;

ScheduledReminderResponse? get data => _data;
  final String baseUrl = "https://www.invoicemint.in/";

  ScheduledReminderProvider() {
    fetchData(0);  
  }

 Future<void> fetchData(int selectedScheduleTypeIndex) async {
  String type;
  switch (selectedScheduleTypeIndex) {
    case 0:
      type = "scheduler/all";
      break;
    case 1:
      type = "scheduler";
      break;
    case 2:
      type = "scheduler/sent";
      break;
    case 3:
      type = "scheduler/deleted";
      break;
    default:
      type = "scheduler/all";
  }

  String url = "$baseUrl$type/1";
  print('Fetching data from URL: $url');

  try {
    var response = await http.get(Uri.parse(url),
      headers: {
        "Authorization": 'Bearer $accessToken',
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}'); 
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      _data = ScheduledReminderResponse.fromJson(data);
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

}
