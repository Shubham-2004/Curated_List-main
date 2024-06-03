import 'package:curated_list_task/components/widget/eventcard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:curated_list_task/presentation/provider/event_provider.dart';

class EventListScreen extends StatefulWidget {
  final String listId;

  EventListScreen({required this.listId});

  @override
  _EventListScreenState createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<EventProvider>(context, listen: false)
          .fetchListForCuratedList(widget.listId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event List'),
      ),
      body: Consumer<EventProvider>(
        builder: (context, provider, child) {
          return provider.isLoading
              ? Center(child: CircularProgressIndicator())
              : provider.isError
                  ? Center(
                      child: Text(
                          'Failed to load events. Please try again later.'),
                    )
                  : provider.elist.isEmpty
                      ? Center(child: Text('No events found'))
                      : ListView.builder(
                          itemCount: provider.elist.length,
                          itemBuilder: (context, index) {
                            final event = provider.elist[index];
                            return EventCard(event: event);
                          },
                        );
        },
      ),
    );
  }
}
