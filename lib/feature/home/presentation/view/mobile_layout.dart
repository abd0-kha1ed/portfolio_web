import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_web/core/routing/app_router.dart';
import 'package:portfolio_web/core/widgets/mobile_bottom_nav.dart';
import 'package:portfolio_web/feature/home/presentation/view/widgets/mobile_layout_body.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  final GlobalKey homeKey = GlobalKey();
  int currentIndex = 0;

  final ScrollController _scrollController = ScrollController();

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MobileBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == currentIndex) {
            scrollToSection(homeKey);
          } else if (index == 1) {
            GoRouter.of(context).push(AppRouter.kMobileProjects);
          }
          else if (index == 2) {
            GoRouter.of(context).push(AppRouter.kMobileSnippets);
          }
          else if (index == 3) {}
          else {
            setState(() {
              currentIndex = index;
            });
          }
        },
      ),
      body: MobileLayoutBody(homeKey: homeKey, scrollController: _scrollController),
    );
  }
}
