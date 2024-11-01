import 'package:equatable/equatable.dart';

class EventEntity extends Equatable {
  final String? id;
  final String? eventName;
  final String? eventDescription;
  final String? eventDate;
  final List<String>? eventAttendeesName;
  const EventEntity({
    this.eventName,
    this.eventDescription,
    this.eventDate,
    this.eventAttendeesName,
    this.id,
  });

  @override
  List<Object?> get props => [
    id,
        eventName,
        eventDescription,
        eventDate,
        eventAttendeesName,
      ];
}
