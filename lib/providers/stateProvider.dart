import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchStateProvider =
    StateNotifierProvider<SearchStateNotifier, SearchState>((ref) {
  return SearchStateNotifier();
});

class SearchStateNotifier extends StateNotifier<SearchState> {
  SearchStateNotifier() : super(SearchState());

  void changeSearch(String? e, String? n, String? a, String? p) {
    final SearchState newState = SearchState();
    newState.element = e;
    newState.nutriscore = n;
    newState.additives = a;
    newState.palmOil = p;

    state = newState;
  }
}

class SearchState {
  String? element = "banane";
  String? nutriscore = "b";
  String? additives = "indifferent";
  String? palmOil = "indifferent";
}
