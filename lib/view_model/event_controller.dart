import 'dart:developer';

import 'package:get/get.dart';

class EventController extends GetxController {
  static EventController get to => Get.find();
  RxMap<String, bool> hoveredItems = <String, bool>{}.obs;

  void changeIsHovered({required String? id}) {
    try {
      if (id != null) {
        hoveredItems[id] = !(hoveredItems[id] ?? false);
      }
    } catch (e, stackTrace) {
      log("Error: ${e.toString()} and $stackTrace");
    }
  }

  bool isCardHovered({required String? id}) {
    if (id != null) {
      return hoveredItems[id] ?? false;
    } else {
      return false;
    }
  }
}
