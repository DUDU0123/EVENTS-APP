import 'dart:math';

import 'package:events_app/core/constants/common_keys.dart';
import 'package:flutter/material.dart';

double responsiveFontSize({
  required double baseSize,
}) {
  // Screen width and height
  double screenWidth = MediaQuery.of(navigatorKey.currentContext!).size.width;
  double screenHeight = MediaQuery.of(navigatorKey.currentContext!).size.height;

  // Calculate the diagonal size of the screen
  double screenDiagonal = sqrt(screenWidth * screenWidth + screenHeight * screenHeight);

  // Calculate the scale factor based on diagonal size for better responsiveness
  double scaleFactor = screenDiagonal / 1440; // 1440 is an arbitrary large screen diagonal

  // Clamp the scale factor between 0.8 and 1.4 to prevent extremes
  scaleFactor = scaleFactor.clamp(0.8, 1.4);

  // Return the adjusted font size
  return baseSize * scaleFactor;
}