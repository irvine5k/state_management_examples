import 'package:flutter/material.dart';
import 'package:search_rx/src/search/search_bloc.dart';
import 'package:search_rx/src/search/search_service.dart';


class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchBloc _bloc;
  
  @override
  void initState() {
   _bloc = SearchBloc();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
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
                onChanged: _bloc.addQuery.add),
            Expanded(
                child: StreamBuilder<SearchResult>(
              stream: _bloc.result,
              builder:
                  (BuildContext context, AsyncSnapshot<SearchResult> snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.items.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(
                                  "${snapshot.data.items[index].fullName}"),
                            ),
                          );
                        },
                      )
                    : Container();
              },
            ))
          ],
        ),
      ),
    );
  }
}
