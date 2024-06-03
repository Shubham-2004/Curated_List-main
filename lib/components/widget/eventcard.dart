import 'package:flutter/material.dart';
import 'package:curated_list_task/domain/models/event_list_model.dart';

class EventCard extends StatelessWidget {
  final Datum event;

  EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (event.thumbUrl != null)
              Image.network(
                event.thumbUrl!,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            Text(
              event.eventname?.cdata ?? 'No Title',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              event.location?.cdata ?? 'No Location',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
            Text(
              event.startTimeDisplay ?? 'No Date',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
