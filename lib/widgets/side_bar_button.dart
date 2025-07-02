import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:perplexity_clone/theme/colors.dart';

class SideBarButton extends ConsumerWidget {
  final String title;
  final bool isOpen;
  final IconData icon;
  const SideBarButton({
    super.key,
    required this.title,
    required this.isOpen,
    required this.icon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child:
          isOpen
              ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(icon, color: AppColors.iconGrey, size: 30),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )
              : Center(child: Icon(icon, color: AppColors.iconGrey, size: 30)),
    );
  }
}
