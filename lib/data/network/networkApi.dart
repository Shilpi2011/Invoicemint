import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Invoicemint/data/network/app_exceptions.dart';
import 'BaseApiServices.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url, headers) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getGetApiOnlyResponse(String url) async {
    dynamic responseJson;

    try {
      final response =
     await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
 responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getGetApiWithParamsResponse(
      String baseURL, String endPointurl, params, headers) async {
    dynamic responseJson;
    try {
      final uri = Uri.http(baseURL, endPointurl, params);
      // final urii = Uri.decodeComponent(uri.toString());
      print("requestUrl: ${Uri.decodeComponent(uri.toString())}");
      print(headers.toString());
      final response = await http
          .get(Uri.parse(Uri.decodeComponent(uri.toString())), headers: headers)
          .timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
      print(response.body);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  //POST Request x-www-form-urlencoded
  @override
  Future getPOSTApiWithBodyResponse(
      String baseURL, String endPointurl, body, headers) async {
    dynamic responseJson;
    try {
      final uri = Uri.http(baseURL, endPointurl);
      print("requestUrl: $uri");
      print(headers.toString());
      final response = await http
          .post(uri,
              headers: headers,
              encoding: Encoding.getByName('utf-8'),
              body: body)
          .timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
      print(responseJson.toString());
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }
  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  //POST Request x-www-form-urlencoded
  @override
  Future getPOSTApiWithBodyResponseGPT(String url, body, headers) async {
    dynamic responseJson;
    try {
      final uri = Uri.parse(url);
      print("requestUrl: $uri");
      print(headers.toString());
      final response = await http
          .post(uri, headers: headers, body: body)
          .timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
      print(responseJson.toString());
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

// Simple POST request Header
  @override
  Future getPostHeaderApiResponse(String url, data, header) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: data, headers: header)
          .timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
        throw ServerException(response.statusCode.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(response.statusCode.toString());
    }
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
