
import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;

  const SocialIcon({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: AppColors.white, size: 24),
    );
  }
}