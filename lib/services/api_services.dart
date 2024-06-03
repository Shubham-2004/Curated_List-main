import 'dart:convert';
import 'package:curated_list_task/domain/models/curated_list_models.dart';
import 'package:http/http.dart' as http;
import 'package:curated_list_task/services/api_routes.dart';

class ApiServices {
  final _routes = ApiRoutes.instance;
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  Future<CuratedList> addNewList(String listTitle) async {
    final Uri url = Uri.parse(_routes.baseUrl + _routes.listupdateendPoint);
    final Map<String, String> body = {
      'email': 'shubhambera100@gmail.com',
      'user_id': '11820070',
      'title': listTitle,
      'ae_token': '778c5b5f84b9d8d48d60da22a5ad0593',
      'list_id': '0',
    };
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        return CuratedList.fromJson(jsonDecode(response.body));
      } else {
        return CuratedList(error: 1);
      }
    } catch (e) {
      return CuratedList(error: 1);
    }
  }

  Future<CuratedList> fetchList() async {
    final Uri url = Uri.parse(_routes.baseUrl + _routes.getlistendpoint);

    final Map<String, String> body = {
      'email': 'shubhambera100@gmail.com',
      'user_id': '11820070',
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        return CuratedList.fromJson(jsonDecode(response.body));
      } else {
        return CuratedList(error: 1);
      }
    } catch (e) {
      return CuratedList(error: 1);
    }
  }

  List<Datum> searchList(String searchTerm, List<Datum> list) {
    if (searchTerm.isEmpty) {
      return list;
    } else {
      return list
          .where((item) =>
              item.title?.toLowerCase().contains(searchTerm.toLowerCase()) ??
              false)
          .toList();
    }
  }
}
