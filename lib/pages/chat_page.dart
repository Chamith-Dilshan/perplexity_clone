import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:perplexity_clone/widgets/answer_section.dart';
import 'package:perplexity_clone/widgets/side_bar.dart';
import 'package:perplexity_clone/widgets/source_section.dart';

class ChatPage extends StatelessWidget {
  final String question;
  const ChatPage({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
           kIsWeb ? SideBar() : SizedBox.shrink(),
          kIsWeb ? const SizedBox(width: 100) : SizedBox.shrink(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    //references section
                    SourceSection(),
                    const SizedBox(height: 20),
                    //answer section
                    AnswerSection(),
                  ],
                ),
              ),
            ),
          ),
          //add a placeholder for the right side
          //here you can show additional details such as images videos.
          kIsWeb ? Placeholder(strokeWidth: 0, color: AppColors.background) : SizedBox.shrink(),
        ],
      ),
    );
  }
}
