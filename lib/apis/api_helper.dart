import 'dart:io';

import 'package:http/http.dart' as http;

class ApiHelper {
  getAPI({required String url}) async {
    try {
      var response = await http.get(
        Uri.parse(url),
      );
    } on SocketException {}
  }
}
