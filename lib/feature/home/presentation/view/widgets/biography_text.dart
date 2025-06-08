import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';

class BiographyText extends StatelessWidget {
  const BiographyText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.34,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SelectableText(
            'Biography',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 8),
          SelectableText.rich(
            TextSpan(
              style: TextStyle(
                fontSize: 16,
                color: AppColors.secondaryText,
                height: 1.5,
              ),
              children: [
                TextSpan(
                  text:
                      'Passionate about crafting scalable Flutter applications with ',
                ),
                TextSpan(
                  text: 'clean architecture. ',
                  style: TextStyle(color: AppColors.blueDark),
                ),
                TextSpan(
                  text:
                      'I enjoy learning, writing documentation, and collaborating with teams. Excited about ',
                ),
                TextSpan(
                  text: 'Flutter',
                  style: TextStyle(color: AppColors.accentBlue),
                ),
                TextSpan(text: ', '),
                TextSpan(
                  text: 'UI/UX',
                  style: TextStyle(color: AppColors.accent),
                ),
                TextSpan(
                  text: ', and building adaptive apps for all platforms.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
