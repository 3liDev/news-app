import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model.dart';

class NewsController extends GetxController {
  RxInt currentIndex = 1.obs;

  Future<dynamic> getData(
      {required String category, @required String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    String basicUrl =
        'https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=6f39ca0047704ad1a59e62d25aeb38a5';
    final url = Uri.parse(basicUrl);
    http.Response response = await http.get(url, headers: headers);
    try {
      if (response.statusCode == 200) {
        return NewsModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }
}
