import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBarButtonNotifier extends AutoDisposeFamilyNotifier<bool, String> {
  @override
  bool build(String arg) => false; // Default state, arg is the family parameter

  void setBtnState(bool newState) {
    state = newState;
  }

  bool getBtnState() {
    return state;
  }
}

final searchbarBtnNotifierProvider =
    NotifierProvider.family.autoDispose<SearchBarButtonNotifier, bool, String>(
      SearchBarButtonNotifier.new,
    );
