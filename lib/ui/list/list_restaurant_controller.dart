import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:submission02/data/base/endpoints.dart' as Endpoints;
import 'package:submission02/data/const/constants.dart';
import 'package:submission02/utils/error_helper/error_handler.dart';

class ListRestaurantController extends GetxController {
  var listBodyRestaurants = [];
  var foods;
  var drinks;

  Future<dynamic> getListRestaurant() async {
    WidgetsFlutterBinding.ensureInitialized();
    final response =
        await http.get(Uri.parse(Endpoints.getListRestaurant.list));
    var responseJson = json.decode(response.body)[Constants.restaurants];
    listBodyRestaurants = responseJson;
    try {
      if (response.statusCode == 200) {
        return listBodyRestaurants;
      } else {
        throw Exception(ErrorHandler.handle(dynamic));
      }
    } catch (e) {
      rethrow;
    }
  }
}
