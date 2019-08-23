import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:search_provider/src/search/search_service.dart';
import 'package:async/async.dart';

class SearchNotifier extends ChangeNotifier {
  final GithubApi _api;
  
  Timer _timer;
  CancelableOperation<SearchResult> _operation;
  SearchResult _result;
  
  SearchResult get result => _result;
  
  set result(SearchResult result) {
    _result = result;
    notifyListeners();
  }

  SearchNotifier({GithubApi api}) : _api = api ?? GithubApi();

  void search(String term) {
    if (term.isEmpty) {
      _result = null;
      return;
    }

    _timer?.cancel();
    _operation?.cancel();

    _timer = Timer(Duration(milliseconds: 350), () async {
      result = null;

      _operation = CancelableOperation.fromFuture(_api.search(term));

      try {
        final _result = await _operation.value;

        if (_result.isEmpty) {
          result = null;
        } else {
          result = _result;
        }
      } catch (e) {
        result = null;
      }
    });
  }
}
