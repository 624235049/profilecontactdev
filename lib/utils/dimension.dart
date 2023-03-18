import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Responsive
class Dimensions {
  static double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  static double pageView(BuildContext context) => screenHeight(context) / 2.44;
  static double pageViewContainer(BuildContext context) => screenHeight(context) / 3.55;
  static double pageViewTextContainer(BuildContext context) => screenHeight(context) / 7.03;



  static double height10(BuildContext context) => screenHeight(context) / 78.11;
  static double height20(BuildContext context) => screenHeight(context) / 39.05;
  static double height30(BuildContext context) => screenHeight(context) / 26.03;


  double fontSize(BuildContext context, double size) {
    return Dimensions.screenHeight(context) / size;
  }
  static double radius(BuildContext context, double radiusValue) => screenWidth(context) * (radiusValue / 375);
}
