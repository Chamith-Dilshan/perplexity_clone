import 'package:flutter_riverpod/flutter_riverpod.dart';

class SideBarState {
  final bool isOpen;
  // final int? extraInt;
  // final String? extraString;

  SideBarState({
    required this.isOpen,
    //  this.extraInt, this.extraString
  });

  SideBarState copyWith({required bool isOpen}) {
    return SideBarState(
      isOpen: isOpen,
      // extraInt: this.extraInt,
      // extraString: this.extraString,
    );
  }
}

class SideBarNotifier extends AutoDisposeNotifier<SideBarState> {
  @override
  SideBarState build() => SideBarState(isOpen: false); // Default state

  void toggleSideBar() {
    state = state.copyWith(isOpen: !state.isOpen);
  }

  bool getSideBarState() {
    return state.isOpen;
  }
}

final sideBarNotifierProvider = NotifierProvider.autoDispose<SideBarNotifier, SideBarState>(
  SideBarNotifier.new,
);
