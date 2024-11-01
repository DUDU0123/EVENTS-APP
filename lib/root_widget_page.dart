import 'package:events_app/core/constants/common_keys.dart';
import 'package:events_app/view/event_home/event_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootWidgetPage extends StatelessWidget {
  const RootWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: const EventsHome(),
    );
  }
}
