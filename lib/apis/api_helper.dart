import 'dart:convert';

import 'package:e_comm/model/config_model.dart';
import 'package:e_comm/model/latest_product_model.dart';
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

  //* Get All Latest Product Data

  // static Future<LatestProductModel> getLatestProductApi(
  //     {required String mUrl, int mLimit = 10, int mPage = 1}) async {
  //   var url = Uri.parse("${mUrl.toString()}?limit=$mLimit&offset=$mPage");
  //   var response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     return data;
  //   } else {
  //     throw Exception();
  //   }
  // }
}
