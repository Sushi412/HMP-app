import 'package:get/get.dart';

class DynamicSize {
  static double screenWidth = Get.context!.width;
  static double screenHeight = Get.context!.height;

  //Aayushi's Screen (866 X 411.4)
  static double Aaheight(double val) => screenHeight * (val / 866);
  static double Aawidth(double val) => screenWidth * (val / 411.4);

  //Fahad's Screen (800 X 360)
  static double Faheight(double val) => screenHeight * (val / 800);
  static double Fawidth(double val) => screenWidth * (val / 360);
}
