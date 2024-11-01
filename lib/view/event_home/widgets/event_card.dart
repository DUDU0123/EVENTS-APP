import 'package:events_app/core/constants/height_width.dart';
import 'package:events_app/model/domain/entity/event_entity.dart';
import 'package:events_app/view/event_home/widgets/event_small_widgets.dart';
import 'package:events_app/view_model/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event});
  final EventEntity event;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
       event.id!=null? EventController.to.changeIsHovered(id: event.id):null;
      },
      onExit: (_) {
        event.id!=null? EventController.to.changeIsHovered(id: event.id):null;
      },
      child: Obx(() {
        return AnimatedContainer(
          padding: const EdgeInsets.all(20.0),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          transform: Matrix4.identity()..scale(EventController.to.isCardHovered(id: event.id!) ? 1.00 : 0.95),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF1E3A8A),
                Color(0xFF1E40AF),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: EventController.to.isCardHovered(id: event.id)  ? 25 : 15,
                spreadRadius: EventController.to.isCardHovered(id: event.id)  ? 5 : 3,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Event Badge
              featuredEventText(),
              kHeight10,

              // Event Name
              eventTitle(
                eventName: event.eventName ?? "No event",
              ),
              kHeight10,

              // Event Description
              eventShortDescription(
                eventDescription:
                    event.eventDescription ?? "No description",
              ),
              kHeight15,
              // Event date showing
              eventDateShow(
                eventDate: event.eventDate ?? "00 Jan",
              ),
              kHeight15,
              // event attending people list
              buildAttendeesList(
                event.eventAttendeesName ?? [],
              )
            ],
          ),
        );
      }),
    );
  }
}
