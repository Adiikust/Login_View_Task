// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class CustomSnackBar {
//   static success(String message) {
//     return Get.snackbar('success', message,
//         margin: const EdgeInsets.symmetric(
//             horizontal: 24.00 * 0.5, vertical: 24.00 * 0.5),
//         backgroundColor: Colors.black,
//         colorText: Colors.white,
//         leftBarIndicatorColor: Colors.green,
//         progressIndicatorBackgroundColor: Colors.red,
//         isDismissible: true,
//         animationDuration: const Duration(microseconds: 800),
//         snackPosition: SnackPosition.BOTTOM,
//         borderRadius: 5.0,
//         mainButton: TextButton(
//             onPressed: () => Get.back(), child: const Text('Dismiss')),
//         // boxShadows: BoxShadow()
//         icon: const Icon(Icons.check_circle_rounded, color: Colors.green));
//   }
//
//   static error(String message) {
//     return Get.snackbar('Alert', message,
//         margin: const EdgeInsets.symmetric(
//             horizontal: 24.00 * 0.5, vertical: 24.00 * 0.5),
//         backgroundColor: Colors.black,
//         colorText: Colors.white,
//         leftBarIndicatorColor: Colors.red,
//         progressIndicatorBackgroundColor: Colors.red,
//         isDismissible: true,
//         animationDuration: const Duration(microseconds: 800),
//         snackPosition: SnackPosition.BOTTOM,
//         borderRadius: 5.0,
//         mainButton: TextButton(
//             onPressed: () => Get.back(), child: const Text('Dismiss')),
//         // boxShadows: BoxShadow()
//         icon: const Icon(Icons.warning, color: Colors.red));
//   }
// }
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static success(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static error(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
