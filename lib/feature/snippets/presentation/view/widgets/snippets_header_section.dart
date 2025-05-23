import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app-text_styles.dart';

class SnippetsHeaderSection extends StatelessWidget {
  const SnippetsHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Code Snippets', style: AppTextStyles.bold48),
        SizedBox(height: 45),
        Text('Search code snippet', style: AppTextStyles.bold18),
        SizedBox(height: 20),
      ],
    );
  }
}
