import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';

class WhatIDoText extends StatelessWidget {
  const WhatIDoText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SelectableText(
          'What I do',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        SizedBox(height: 12),
        SelectableText.rich(
          TextSpan(
            style: TextStyle(
              fontSize: 16,
              color: AppColors.secondaryText,
              height: 1.6,
            ),
            children: [
              TextSpan(
                text:
                    'Build and maintain applications using ',
              ),
              TextSpan(
                text: 'Flutter',
                style: TextStyle(color: AppColors.accent),
              ),
              TextSpan(
                text:
                    ', focusing on UI/UX and performance. Also mentoring at ',
              ),
              TextSpan(
                text: 'MOFON',
                style: TextStyle(
                  color: AppColors.blueDark,
                ),
              ),
              TextSpan(
                text:
                    '. I value clean code, teamwork, and continuous learning.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
