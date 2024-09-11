// import 'package:Invoicemint/model/DashBoardResponse.dart';
// import 'package:Invoicemint/utils/global.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class DataProvider with ChangeNotifier {
//   DashBoardInvoiceResponse? _data;
//   DashBoardInvoiceResponse? get data => _data;
//   final String baseUrl = "https://www.invoicemint.in/create-invoice/";

//   final String invoiceParams = "?page=0&size=15&from=2024-01-01&to=2024-07-02&userId=$userId";
//   final String queryAllParams = "?page=0&size=15&from=2023-01-01&to=2024-07-02";


                                                                                                                                                                 
//     DataProvider() {
//     fetchData(0);  
//   }


//   Future<void> fetchData(int selectedInvoiceTypeIndex, {int? businessId, int? clientId}) async {
//     String type;

//     if ( businessId != null &&  clientId != null) {
//       type = _getClientType(selectedInvoiceTypeIndex);
//       String url = "$baseUrl$type$queryAllParams";
//       print("API URL for Client: $url");

//       try {
//         var response = await http.get(Uri.parse(url), headers: {
//           "Authorization": 'Bearer $accessToken',
//         });

//         if (response.statusCode == 200) {
//           var data = json.decode(response.body);
//           print("Response Data: $data");
//           _data = DashBoardInvoiceResponse.fromJson(data);
//           notifyListeners();
//         } else {
//           print("Error: ${response.statusCode}");
//           throw Exception("Error: ${response.statusCode}");
//         }
//       } catch (e) {
//         print("Exception: $e");
//         throw Exception("Exception: $e");
//       }

//     } else if (businessId != null) {
//       type = _getBusinessType(selectedInvoiceTypeIndex);
//       String url = "$baseUrl$type$queryAllParams";
//       print("API URL for Business: $url");

//       try {
//         var response = await http.get(Uri.parse(url), headers: {
//           "Authorization": 'Bearer $accessToken',
//         });

//         if (response.statusCode == 200) {
//           var data = json.decode(response.body);
//           print("Response Data: $data");
//           _data = DashBoardInvoiceResponse.fromJson(data);
//           notifyListeners();
//         } else {
//           print("Error: ${response.statusCode}");
//           throw Exception("Error: ${response.statusCode}");
//         }
//       } catch (e) {
//         print("Exception: $e");
//         throw Exception("Exception: $e");
//       }

//     } else {
//       type = _getDefaultType(selectedInvoiceTypeIndex);
//       String url = "$baseUrl$type$invoiceParams";
//       print("API URL for Invoice: $url");

//       try {
//         var response = await http.get(Uri.parse(url), headers: {
//           "Authorization": 'Bearer $accessToken',
//         });

//         if (response.statusCode == 200) {
//           var data = json.decode(response.body);
//           print("Response Data: $data");
//           _data = DashBoardInvoiceResponse.fromJson(data);
//           notifyListeners();
//         } else {
//           print("Error: ${response.statusCode}");
//           throw Exception("Error: ${response.statusCode}");
//         }
//       } catch (e) {
//         print("Exception: $e");
//         throw Exception("Exception: $e");
//       }
//     }
//   }

//   String _getBusinessType(int selectedInvoiceTypeIndex) {
//     switch (selectedInvoiceTypeIndex) {
//       case 0:
//         return "";
//       case 1:
//         return "payed";
//       case 2:
//         return "pending";
//       case 3:
//         return "due";
//       case 4:
//         return "deleted";
//       default:
//         return "";
//     }
//   }

//   String _getClientType(int selectedInvoiceTypeIndex) {
//     switch (selectedInvoiceTypeIndex) {
//       case 0:
//         return "client";
//       case 1:
//         return "payed-client";
//       case 2:
//         return "pending-client";
//       case 3:
//         return "due-client";
//       case 4:
//         return "deleted-client";
//       default:
//         return "client";
//     }
//   }

//   String _getDefaultType(int selectedInvoiceTypeIndex) {
//     switch (selectedInvoiceTypeIndex) {
//       case 0:
//         return "all";
//       case 1:
//         return "payed";
//       case 2:
//         return "pending";
//       case 3:
//         return "due";
//       case 4:
//         return "deleted";
//       default:
//         return "all";
//     }
//   }
// }








































import 'package:Invoicemint/model/dashboard_response.dart';
import 'package:Invoicemint/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataProvider with ChangeNotifier {
  DashBoardInvoiceResponse? _data;

  DashBoardInvoiceResponse? get data => _data;
  final String baseUrl = "https://www.invoicemint.in/create-invoice/";
  final String queryParams = "?page=0&size=15&from=2024-01-01&to=2024-07-02&userId=$userId";
  final String queryAllParams = "?page=0&size=15&from=2023-01-01&to=2024-07-02";

  DataProvider() {
    fetchData(0);  
  }



  Future<void> fetchData(int selectedInvoiceTypeIndex) async {
    String type;
    switch (selectedInvoiceTypeIndex) {
      case 0:
        type = "all";
        break;
      case 1:
        type = "all-payed";
        break;
      case 2:
        type = "all-pending";
        break;
      case 3:
        type = "all-due";
        break;
      case 4:
        type = "all-deleted";
        break;
      default:
        type = "all";
    }

    String url = 
    "$baseUrl$type$queryParams$userId";

    try {
      var response = await http.get(Uri.parse(url),
        headers: {
          "Authorization": 'Bearer $accessToken',
        },
      );
      if (response.statusCode == 200) {
        print(response);
        var data = json.decode(response.body);
        print("Response Data: $data");
        _data = DashBoardInvoiceResponse.fromJson(data);
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
