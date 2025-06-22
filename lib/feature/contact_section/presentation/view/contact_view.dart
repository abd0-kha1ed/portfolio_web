import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_web/core/constants/helper.dart';
import 'package:portfolio_web/core/helpers/functions/show_more_options_nav_bar.dart';
import 'package:portfolio_web/core/routing/app_router.dart';
import 'package:portfolio_web/core/widgets/mobile_bottom_nav.dart';
import 'package:portfolio_web/feature/contact_section/presentation/view/widgets/contact_section.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  int currentIndex = 3;
  late ScrollController _scrollController;
  bool isNavBarVisible = true;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 100 && isNavBarVisible) {
        setState(() {
          isNavBarVisible = false;
        });
      } else if (_scrollController.position.pixels <= 100 && !isNavBarVisible) {
        setState(() {
          isNavBarVisible = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar:
          screenWidth > 800
              ? null
              : MobileBottomNav(
                isNavBarVisible: isNavBarVisible,
                currentIndex: currentIndex,
                onTap: (index) {
                  if (index == 0) {
                    GoRouter.of(context).push(AppRouter.kHome);
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
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal:
                screenWidth < 800 ? 24 : screenWidth * horizontalPadding,
          ),
          child: ContactSection(),
        ),
      ),
    );
  }
}
