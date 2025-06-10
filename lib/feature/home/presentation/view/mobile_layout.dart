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

  void showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black87,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Text(
                'About Me',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                GoRouter.of(context).pop(); 
                GoRouter.of(context).push(AppRouter.kAbout);
              },
            ),
            ListTile(
              leading: const Icon(Icons.mail, color: Colors.white),
              title: const Text(
                'Contact',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                GoRouter.of(context).push(AppRouter.kContact);
              },
            ),
          ],
        );
      },
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
          } else if (index == 2) {
            GoRouter.of(context).push(AppRouter.kMobileSnippets);
          } else if (index == 3) {
            showMoreOptions(context);
          } else {
            setState(() {
              currentIndex = index;
            });
          }
        },
      ),
      body: MobileLayoutBody(
        homeKey: homeKey,
        scrollController: _scrollController,
      ),
    );
  }
}
