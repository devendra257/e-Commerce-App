import 'dart:convert';
import 'dart:io';

import 'package:e_comm/apis/my_exception.dart';
import 'package:e_comm/model/config_model.dart';
import 'package:e_comm/model/latest_product_model.dart';
import 'package:e_comm/model/login_model.dart';
import 'package:e_comm/model/signup_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  //* Get All Config Data
  static Future<ConfigModel> getConfigAPI({required String url}) async {
    var response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ConfigModel.fromJson(json);
    } else {
      return ConfigModel();
    }
  }

  //* Get All Banner Data
  static Future<dynamic> getBannerApi({required String url}) async {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      return null;
    }
  }

  //* Get All Latest Product Data
  static Future<LatestProductModel> getLatestProductApi({
    required String mUrl,
    int mLimit = 10,
    int mPage = 1,
  }) async {
    var url = Uri.parse("${mUrl.toString()}?limit=$mLimit&offset=$mPage");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return LatestProductModel.fromJson(json);
    } else {
      return LatestProductModel();
    }
  }

  //* Get Login Data..
  static Future<dynamic> getLoginApi(
      {required String mUrl, required LoginModel loginModel}) async {
    var loginData;

    try {
      var res = await http.post(Uri.parse(mUrl), body: loginModel.toJson());

      loginData = returnDataResponse(res);
      // print("Login Data -- ${res.body}");
    } on SocketException {
      throw FetchDataException(body: "Internet Error");
    }
    return loginData;
  }

  //* Get Sign Data...
  static Future<dynamic> postSignUpApi(
      {required String mUrl, required SignUpModel signUpModel}) async {
    var signUpData;
    try {
      var res = await http.post(Uri.parse(mUrl), body: signUpModel.toJson());
      signUpData = returnDataResponse(res);
      print("SignUpdata -- ${res.body}");
    } on SocketException {
      throw FetchDataException(body: 'Internet Error');
    }
    return signUpData;
  }

  static dynamic returnDataResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var mData = response.body;
        return jsonDecode(mData);

      //* if bad request for data (Internet erroe)

      case 400:
        throw BadRequestException(body: response.body.toString());

      //* if you r authorised data

      case 401:
      case 403:
        print(response.body.toString());
        throw UnAuthorisedException(body: response.body.toString());

      //* Seever Error
      case 500:
      default:
        throw FetchDataException(body: "Communcation Error to Server");
    }
  }
}
