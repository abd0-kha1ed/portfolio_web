import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app-text_styles.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';

class ProjectText extends StatelessWidget {
  const ProjectText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SelectableText(
          'Project that i',
          style: AppTextStyles.bold56,
        ),
        Row(
          children: [
            SelectableText('has been', style: AppTextStyles.bold56),
            const SizedBox(width: 8),
            SelectableText(
              'done',
              style: AppTextStyles.bold56.copyWith(
                color: AppColors.accent,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
