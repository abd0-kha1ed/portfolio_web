import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle greeting = TextStyle(
    fontSize: 18,
    color: AppColors.accent,
    letterSpacing: 1.2,
  );

  static const TextStyle name = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
  );

  static const TextStyle role = TextStyle(
    fontSize: 24,
    color: AppColors.secondaryText,
  );

  static const TextStyle navItem = TextStyle(
    fontSize: 16,
    color: AppColors.secondaryText,
  );
}
