import 'dart:convert';
import 'dart:io';
import 'package:payment_app_with_mvvm/data/api_network/base_api_services.dart';
import 'package:payment_app_with_mvvm/data/app_exception.dart';
import 'package:http/http.dart' as http;

class NetWorkApiServices extends BaseApiServices {
  @override
  Future get({required String url}) async {
    dynamic resposeJson;
    try {
      var response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      resposeJson = returnResponse(response: response);
    } on SocketException {
      throw InterNetExceptions('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return resposeJson;
  }

  @override
  Future post(
      {required String url, required body, required String token}) async {
    dynamic responseJson;
    try {
      var response = await http.post(Uri.parse(url), body: body, headers: {
        'Authorization': "Bearer $token"
      }).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response: response);
    } on SocketException {
      throw InterNetExceptions('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

  returnResponse({required http.Response response}) {
    switch (response.statusCode) {
      case 200:
        dynamic respon = jsonDecode(response.body);
        return respon;
      case 400:
        dynamic respon = jsonDecode(response.body);
        return respon;
      default:
        return FetchDataException(
            "Error accoured while communication with server ${response.statusCode}");
    }
  }
}
