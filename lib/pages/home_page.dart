import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:perplexity_clone/services/chat_web_service.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:perplexity_clone/widgets/search_section.dart';
import 'package:perplexity_clone/widgets/side_bar.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    ChatWebService().connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Side Navigation Bar
          kIsWeb ? SideBar() : SizedBox.shrink(),
          // Main Content Area
          Expanded(
            child: Padding(
              padding: !kIsWeb ? const EdgeInsets.all(8.0) : const EdgeInsets.all(0),
              child: Column(
                children: [
                  //Search Section
                  Expanded(child: SearchSection()),
                  // StreamBuilder(
                  //   stream: ChatWebService().contentStream,
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return Center(child: CircularProgressIndicator());
                  //     }
                  //     // Check if the snapshot has data
                  //     // If not, show a message or handle it accordingly
                  //     else if (snapshot.hasData) {
                  //       final data = snapshot.data;
                  //       fullResponse += data?['data'] ?? '';
                  //       return Container(
                  //         padding: const EdgeInsets.all(16),
                  //         child: Text(
                  //           fullResponse,
                  //           style: TextStyle(fontSize: 16),
                  //         ),
                  //       );
                  //     } else if (snapshot.hasError) {
                  //       return Center(child: Text('Error: ${snapshot.error}'));
                  //     }
                  //     return Center(child: CircularProgressIndicator());
                  //   },
                  // ),
                  //Footer
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Pro",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.footerGrey,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Enterprice",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.footerGrey,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Store",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.footerGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
