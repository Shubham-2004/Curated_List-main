import 'package:flutter/material.dart';
import 'package:curated_list_task/domain/models/curated_list_models.dart';
import 'package:curated_list_task/services/api_services.dart';

class CuratedProvider with ChangeNotifier {
  final ApiServices apiServices = ApiServices();

  List<Datum> _list = [];
  List<Datum> get list => _list;

  List<Datum> _filteredlist = [];
  List<Datum> get filteredlist => _filteredlist;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool _isError = false;
  bool get isError => _isError;

  Future<void> fetchList() async {
    _isLoading = true;
    _isError = false;
    notifyListeners();

    final CuratedList response = await apiServices.fetchList();

    if (response.error == 0) {
      _list = response.data ?? [];
      _filteredlist = _list;
      _isLoading = false;
    } else {
      _isError = true;
      _isLoading = false;
    }
    notifyListeners();
  }

  Future<void> addNewList(String listTitle) async {
    _isLoading = true;
    _isError = false;
    notifyListeners();

    final CuratedList response = await apiServices.addNewList(listTitle);

    if (response.error == 0) {
      _list = response.data ?? [];
      _filteredlist = _list;
      _isLoading = false;
    } else {
      _isError = true;
      _isLoading = false;
    }
    notifyListeners();
  }

  void searchList(String searchTerm) {
    _filteredlist = apiServices.searchList(searchTerm, _list);
    notifyListeners();
  }
}
