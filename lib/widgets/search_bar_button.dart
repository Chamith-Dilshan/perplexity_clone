import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:perplexity_clone/providers/search_bar_button_notifier.dart';
import 'package:perplexity_clone/theme/colors.dart';

class SearchBarButton extends ConsumerWidget {
  final IconData icon;
  final String label;
  final String familyParameter;
  const SearchBarButton({super.key, required this.icon, required this.label,required this.familyParameter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchBarButtonState = ref.watch(searchbarBtnNotifierProvider(familyParameter));
    final searchBarButtonActions = ref.read(
      searchbarBtnNotifierProvider(familyParameter).notifier,
    );

    return MouseRegion(
      onEnter: (event) {
        searchBarButtonActions.setBtnState(true);
      },
      onExit: (event) {
        searchBarButtonActions.setBtnState(false);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color:
              searchBarButtonState ? AppColors.proButton : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.iconGrey, size: 20),
            const SizedBox(width: 10),
            Text(label, style: TextStyle(color: AppColors.textGrey)),
          ],
        ),
      ),
    );
  }
}
