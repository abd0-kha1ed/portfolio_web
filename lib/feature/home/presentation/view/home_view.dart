import 'package:flutter/material.dart';
import 'package:portfolio_web/feature/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:portfolio_web/feature/home/presentation/view/widgets/home_biography_section.dart';
import 'package:portfolio_web/feature/home/presentation/view/widgets/home_hero_section.dart';
import 'package:portfolio_web/feature/home/presentation/view/widgets/home_what_i_do_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A192F),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            CustomAppBar(),
            HomeHeroSection(),
            HomeBiographySection(),
            HomeWhatIDoSection(),
          ],
        ),
      ),
    );
  }
}
