import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SourceSection extends StatefulWidget {
  const SourceSection({super.key});

  @override
  State<SourceSection> createState() => _SourceSectionState();
}

class _SourceSectionState extends State<SourceSection> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<Map<String, dynamic>> sources = [
    {
      'title': 'Wikipedia',
      'url': 'https://en.wikipedia.org/wiki/Main_Page',
      'icon': Icons.public,
    },
    {
      'title': 'Google Scholar',
      'url': 'https://scholar.google.com/',
      'icon': Icons.school,
    },
    {'title': 'arXiv', 'url': 'https://arxiv.org/', 'icon': Icons.article},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.source, size: 25, color: AppColors.iconGrey),
        const SizedBox(width: 10),
        Text(
          'Sources',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.textGrey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children:
              sources.map((res) {
                return InkWell(
                  onTap: () {
                    // Open the URL in a web browser
                    launchUrl(Uri.parse(res['url']));
                  },
                  child: Container(
                    width: 150,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(blurRadius: 4, offset: const Offset(0, 2)),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          res['title'],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textGrey,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          res['url'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
