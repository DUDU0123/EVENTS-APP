import 'package:events_app/core/components/text_widget_common.dart';
import 'package:events_app/core/constants/dummy_data.dart';
import 'package:events_app/view/event_home/widgets/event_card.dart';
import 'package:flutter/material.dart';

class EventsHome extends StatelessWidget {
  const EventsHome({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    bool br1 = screenWidth > 980;
    bool br2 = screenWidth < 839 && screenWidth > 664;
    bool br3 = screenWidth < 532 && screenWidth > 415;
    bool br4 = screenWidth < 416 && screenWidth > 320;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
           const SliverAppBar(
              elevation: 0,
              title:  TextWidgetCommon(
                text: "ChronoConnect",
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ];
        },
        body: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          gridDelegate: screenWidth < 390
              ? const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                )
              : SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: br1
                      ? 0.85
                      : br2
                          ? 0.8
                          : br3
                              ? 0.75
                              : br4
                                  ? 0.6
                                  : 1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
          itemCount: events.length,
          itemBuilder: (context, index) {
            return EventCard(event: events[index]);
          },
        ),
      ),
    );
  }
}
