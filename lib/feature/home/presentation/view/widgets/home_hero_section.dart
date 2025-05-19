import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';
import 'package:portfolio_web/feature/home/presentation/view/widgets/gradiant_text.dart';

class HomeHeroSection extends StatelessWidget {
  const HomeHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: GradientText(
            'Hi I\'m Abdelrahman, a special human\n'
            'with some ability to love learning\n'
            'and working on teamwork.',
            gradient: const LinearGradient(
              colors: [
                Color(0xFF64FFDA),
                Color(0xFF00B5FF),
              ],
            ),
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w800,
              height: 1.4,
            ),
          ),
        ),
      ),
    );
  }
}
