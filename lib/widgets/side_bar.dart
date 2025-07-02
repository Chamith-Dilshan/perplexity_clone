import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:perplexity_clone/providers/side_bar_notifier.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:perplexity_clone/widgets/side_bar_button.dart';

class SideBar extends ConsumerWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(sideBarNotifierProvider);
    final sideBarActions = ref.read(sideBarNotifierProvider.notifier);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: sideBarActions.getSideBarState() ? 200 : 60,
      color: AppColors.sideNav,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Icon(
            Icons.auto_awesome_mosaic_rounded,
            color: AppColors.whiteColor,
            size: sideBarActions.getSideBarState() ? 50 : 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  sideBarActions.getSideBarState()
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                SideBarButton(
                  title: "Add",
                  isOpen: sideBarActions.getSideBarState(),
                  icon: Icons.add,
                ),
                SideBarButton(
                  title: "Search",
                  isOpen: sideBarActions.getSideBarState(),
                  icon: Icons.search,
                ),
                SideBarButton(
                  title: "Spaces",
                  isOpen: sideBarActions.getSideBarState(),
                  icon: Icons.language,
                ),
                SideBarButton(
                  title: "Discover",
                  isOpen: sideBarActions.getSideBarState(),
                  icon: Icons.auto_awesome_rounded,
                ),
                SideBarButton(
                  title: "Library",
                  isOpen: sideBarActions.getSideBarState(),
                  icon: Icons.cloud_outlined,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              sideBarActions.toggleSideBar();
              log('Sidebar toggled: ${sideBarActions.getSideBarState()} ');
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Icon(
                sideBarActions.getSideBarState()
                    ? Icons.keyboard_arrow_left_rounded
                    : Icons.keyboard_arrow_right_rounded,
                color: AppColors.iconGrey,
                size: 30,
              ),
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
