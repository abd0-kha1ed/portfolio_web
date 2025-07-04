import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';
import 'package:portfolio_web/core/utils/assets.dart';

class HomeProfile extends StatelessWidget {
  const HomeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 100,
      backgroundColor: AppColors.accent,
      child: CircleAvatar(
        radius: 98,
        backgroundColor: AppColors.accentBlue,
        child: Image.asset(Assets.imagesProfileNoBackground),
      ),
    );
  }
}
