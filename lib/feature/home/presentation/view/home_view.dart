import 'package:flutter/material.dart';
import 'package:portfolio_web/feature/home/presentation/view/tablet_and_desktop_layout.dart';
import 'package:portfolio_web/feature/home/presentation/view/widgets/adaptive_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (BuildContext context) => const Placeholder(),
      tabletLayout: (BuildContext context) => const TabletAndDesktopLayout(),
      desktopLayout: (BuildContext context) => const TabletAndDesktopLayout(),
    );
  }
}
