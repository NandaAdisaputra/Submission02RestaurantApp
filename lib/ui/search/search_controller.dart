import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:submission02/data/const/constants.dart';
import 'package:submission02/utils/error_helper/error_handler.dart';
import 'package:submission02/data/base/endpoints.dart' as Endpoints;

class SearchRestaurantController extends GetxController {
  final queryRestaurantsSearch = TextEditingController();
  var queryInp = ''.obs;
  var listBodyRestaurants;
  var isDataLoading = false.obs;
  Future<dynamic> getListRestaurant() async {
    WidgetsFlutterBinding.ensureInitialized();
    String urlSearch = Endpoints.getSearch.search + "?q=$queryInp";
    final response = await http
        .get(Uri.parse(urlSearch))
        .timeout(const Duration(seconds: 5));
    var responseJson = json.decode(response.body)[Constants.restaurants];
    listBodyRestaurants = responseJson;
    try {
      isDataLoading(true);
      if (response.statusCode == 200) {
        return listBodyRestaurants;
      } else {
        throw Exception(ErrorHandler.handle(dynamic));
      }
    } on Error {
      rethrow;
    } finally {
      isDataLoading(false);
    }
  }
}