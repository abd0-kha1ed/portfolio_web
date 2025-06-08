import 'package:flutter/material.dart';
import 'package:portfolio_web/core/helpers/screen_helper.dart';
import 'package:portfolio_web/feature/home/presentation/view/home_view.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      mobile: const SizedBox(),
      tablet: const SizedBox(),
      desktop: HomeView(),
    );
  }
}
