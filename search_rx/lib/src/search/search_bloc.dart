import 'package:rxdart/rxdart.dart';
import 'package:search_rx/src/search/search_service.dart';

class SearchBloc {
  Observable<SearchResult> result;
  final _query = PublishSubject<String>();
  Sink<String> get addQuery => _query.sink;

  SearchBloc() {
    final _api = GithubApi();
    result = _query
        // Accepting only differents querys
        .distinct()
        // Waiting to search when user stop changing query
        .debounceTime(Duration(milliseconds: 350))
        // Reset result if query changes and calling api
        .switchMap(
            (i) => Observable(_api.search(i).asStream()).startWith(null));
  }
}
