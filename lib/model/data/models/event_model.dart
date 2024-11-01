import 'package:events_app/model/domain/entity/event_entity.dart';

class EventModel extends EventEntity {
  const EventModel({
    super.eventName,
    super.eventDescription,
    super.eventDate,
    super.eventAttendeesName,
  });
}

