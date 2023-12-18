import 'package:flutter/material.dart';

const String IMAGE_PATH = "assets/images";
const String JSON_PATH = "assets/animations";

class ImageAssets {
  static String imageNewPlaceHolder = "$IMAGE_PATH/place_holder.jpg";
  static String imageLeading = "$IMAGE_PATH/sendok_garpu.png";
  static String imageProfile = "$IMAGE_PATH/profile.png";
}

class JsonAssets {
  static String loading = "$JSON_PATH/loading.json";
  static String search = "$JSON_PATH/search.json";
  static String splash = "$JSON_PATH/lottie_restaurant.json";
  static String error = "$JSON_PATH/error.json";
  static String empty = "$JSON_PATH/empty.json";
  static String success = "$JSON_PATH/success.json";
}
class IconAssets {
  static Icon  nextIcon = const Icon(Icons.arrow_forward_ios);
  static Icon  addIcon = const Icon(Icons.add, color: Colors.white);
}