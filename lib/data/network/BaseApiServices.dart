
abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url, headers);

  Future<dynamic> getGetApiOnlyResponse(String url);

  Future<dynamic> getGetApiWithParamsResponse(
      String baseURL, String endPointurl, params, headers);

  Future<dynamic> getPOSTApiWithBodyResponse(
      String baseURL, String endPointurl, dynamic body, headers);

  Future<dynamic> getPOSTApiWithBodyResponseGPT(String url, dynamic body, headers);


  Future<dynamic> getPostApiResponse(String url, dynamic data);

  Future<dynamic> getPostHeaderApiResponse(String url, data, header);
}
