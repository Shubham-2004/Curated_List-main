import 'package:curated_list_task/presentation/screens/event_list_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:curated_list_task/presentation/provider/curated_provider.dart';
import 'package:curated_list_task/components/widget/listcard.dart';
import 'package:curated_list_task/components/widget/newlist.dart';
import 'package:shimmer/shimmer.dart';

class CuratedHomeScreen extends StatefulWidget {
  CuratedHomeScreen({super.key});

  @override
  State<CuratedHomeScreen> createState() => _CuratedHomeScreenState();
}

class _CuratedHomeScreenState extends State<CuratedHomeScreen> {
  final TextEditingController _search = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CuratedProvider>(context, listen: false).fetchList();
    });
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  void _showAddListDialog() {
    showDialog(
      context: context,
      builder: (context) => AddListDialog(),
    );
  }

  void _navigateToEventList(String listId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventListScreen(listId: listId),
      ),
    );
  }

  Widget _buildShimmerEffect() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Container(
              height: 100,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Curated List'),
      ),
      body: Consumer<CuratedProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _search,
                  decoration: InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (text) {
                    provider.searchList(text);
                  },
                ),
              ),
              Expanded(
                child: provider.isLoading
                    ? _buildShimmerEffect()
                    : provider.isError
                        ? Center(
                            child: Text(
                                'Failed to load events. Please try again later.'),
                          )
                        : provider.list.isEmpty
                            ? Center(child: Text('No events found'))
                            : ListView.builder(
                                keyboardDismissBehavior:
                                    ScrollViewKeyboardDismissBehavior.onDrag,
                                itemCount: _search.text.isNotEmpty
                                    ? provider.filteredlist.length
                                    : provider.list.length,
                                itemBuilder: (context, index) {
                                  final list = _search.text.isNotEmpty
                                      ? provider.filteredlist[index]
                                      : provider.list[index];

                                  return GestureDetector(
                                    onTap: () {
                                      _navigateToEventList(list.id!);
                                    },
                                    child: Listcard(list: list),
                                  );
                                },
                              ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddListDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
