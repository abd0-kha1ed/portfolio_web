import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_web/core/constants/app-text_styles.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';
import 'package:portfolio_web/core/helpers/functions/url_launcher_function.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(color: AppColors.normalText),
        const SizedBox(height: 48),
        const SelectableText('Reach me out', style: AppTextStyles.semibold14),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                lunchCustomUrl('https://github.com/abd0-kha1ed');
              },
              icon: const Icon(
                FontAwesomeIcons.github,
                size: 20,
                color: AppColors.white,
              ),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () {
                lunchCustomUrl('https://www.linkedin.com/in/abdelrahman-khaled-dev/');
              },
              icon: const Icon(
                FontAwesomeIcons.linkedin,
                size: 20,
                color: AppColors.white,
              ),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () {
                lunchCustomUrl(
                  'https://www.instagram.com/abdelrhmankhaleddev?igsh=b2ZzMWhpNGR3OTFl',
                );
              },
              icon: const Icon(
                FontAwesomeIcons.instagram,
                size: 20,
                color: AppColors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 43),
      ],
    );
  }
}
