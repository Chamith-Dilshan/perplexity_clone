import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:perplexity_clone/providers/side_bar_notifier.dart';
import 'package:perplexity_clone/theme/colors.dart';

class SideBar extends ConsumerWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(sideBarStateNotifierProvider);
    final sideBarActions = ref.read(sideBarStateNotifierProvider.notifier);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: sideBarActions.getSideBarState() ? 250 : 60,
      color: AppColors.sideNav,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Icon(
              Icons.auto_awesome_mosaic_rounded,
              color: AppColors.whiteColor,
              size: 30,
            ),
          ),
          const SizedBox(height: 25),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Icon(Icons.add, color: AppColors.iconGrey, size: 30),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Icon(Icons.search, color: AppColors.iconGrey, size: 30),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Icon(Icons.language, color: AppColors.iconGrey, size: 30),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Icon(
              Icons.auto_awesome_rounded,
              color: AppColors.iconGrey,
              size: 30,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Icon(
              Icons.cloud_outlined,
              color: AppColors.iconGrey,
              size: 30,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              sideBarActions.toggleSideBar();
              log('Sidebar toggled: ${sideBarActions.getSideBarState()} ');
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              margin: EdgeInsets.symmetric(vertical: 15),
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
