import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_provider/src/search/search_notifier.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final _notifier = Provider.of<SearchNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("GitHub Search"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: "Input the repo name",
              ),
              onChanged: _notifier.search,
            ),
            Expanded(
              child: Consumer<SearchNotifier>(
                builder:
                    (BuildContext context, SearchNotifier value, Widget child) {
                  return value.result == null
                      ? Container()
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: value.result.items.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(
                                    "${value.result.items[index].fullName}"),
                              ),
                            );
                          },
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
