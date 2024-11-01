import 'package:events_app/root_widget_page.dart';
import 'package:events_app/view_model/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(EventController());
  runApp(
    const RootWidgetPage(),
  );
}







