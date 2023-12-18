import 'package:flutter/material.dart';

class AppSizes {
  static const wGap20 = SizedBox(
    width: 20,
  );
  static const hGap20 = SizedBox(
    height: 20,
  );
}
Size displaySize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  return displaySize(context).width;
}