import 'package:flutter/material.dart';

class PlatformUtils {
  
  static double getSizeHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static double getSizeWidth(context) {
    return MediaQuery.of(context).size.width;
  }
}
