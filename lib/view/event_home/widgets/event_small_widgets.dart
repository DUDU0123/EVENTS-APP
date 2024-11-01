
 import 'package:events_app/core/components/responsive.dart';
import 'package:events_app/core/components/text_widget_common.dart';
import 'package:events_app/core/constants/common_keys.dart';
import 'package:events_app/core/constants/height_width.dart';
import 'package:flutter/material.dart';

Widget buildAttendeesList(List<String> attendees) {
    return Row(
      children: [
        ...attendees.take(1).map((attendee) {
          int index = attendees.indexOf(attendee);
          return Container(
            decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.white.withOpacity(0.2), width: 2),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              // radius: 22,
              backgroundColor: Color.fromRGBO(
                (index * 50 % 255),
                (index * 100 % 255),
                (index * 150 % 255),
                0.7,
              ),
              child: TextWidgetCommon(
                text: attendee[0].toUpperCase(),
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: responsiveFontSize(baseSize: 16),
              ),
            ),
          );
        }),

        // Additional attendees indicator
        if (attendees.length > 3)
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.white.withOpacity(0.2),
            child: TextWidgetCommon(
              text: '+${attendees.length - 1}',
              textColor: Colors.white.withOpacity(0.8),
              fontWeight: FontWeight.bold,
              fontSize: responsiveFontSize(baseSize: 14),
            ),
          ),
      ],
    );
  }

Widget featuredEventText() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: const Color(0xFF4338CA).withOpacity(0.7),
      borderRadius: BorderRadius.circular(12),
    ),
    child: TextWidgetCommon(
      text: 'Featured Event',
      textColor: Colors.white.withOpacity(0.8),
      fontSize: responsiveFontSize(baseSize: 10),
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget eventTitle({
  required String eventName,
}) {
  return TextWidgetCommon(
    text: eventName,
    textColor: Colors.white,
    fontSize: responsiveFontSize(baseSize: 20),
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}

Widget eventShortDescription({
  required String eventDescription,
}) {
  bool isLessthan720 =
      screenWidth(context: navigatorKey.currentContext!) < 720;
  return TextWidgetCommon(
    text: eventDescription,
    textColor: Colors.white.withOpacity(0.7),
    fontSize: responsiveFontSize(baseSize: 14),
    fontWeight: FontWeight.w300,
    maxLines: isLessthan720 ? 2 : 3,
    overflow: TextOverflow.ellipsis,
  );
}

Widget eventDateShow({required String eventDate}) {
  return Row(
    children: [
      Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.calendar_today,
          color: Colors.white.withOpacity(0.8),
          size: 18,
        ),
      ),
      kWidth10,
      Expanded(
        child: TextWidgetCommon(
          text: eventDate,
          textColor: Colors.white.withOpacity(0.9),
          fontSize: responsiveFontSize(
            baseSize: 14,
          ),
          fontWeight: FontWeight.w500,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}
