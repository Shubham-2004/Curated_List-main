import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:curated_list_task/domain/models/event_list_model.dart';

class EventProvider with ChangeNotifier {
  List<Datum> elist = [];
  List<Datum> filteredlist = [];
  bool isLoading = true;
  bool isError = false;

  Future<void> fetchListForCuratedList(String listId) async {
    isLoading = true;
    isError = false;
    notifyListeners();

    const String baseUrl = 'https://allevents.in/api/index.php';
    const String endPoint = '/users/lists/get_events';
    final Uri url = Uri.parse(baseUrl + endPoint);

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final Map<String, String> body = {
      'email': 'shubhambera100@gmail.com',
      'user_id': '11820070',
      'ae_token': '778c5b5f84b9d8d48d60da22a5ad0593',
      'list_id': listId,
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        final EventList curatedList = eventListFromJson(response.body);
        elist = curatedList.data ?? [];
        filteredlist = elist;
      } else {
        isError = true;
      }
    } catch (e) {
      isError = true;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void searchList(String query) {
    filteredlist = elist
        .where((event) =>
            event.eventId!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
