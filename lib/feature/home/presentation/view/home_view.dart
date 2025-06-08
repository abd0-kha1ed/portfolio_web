import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';
import 'package:portfolio_web/feature/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:portfolio_web/feature/home/presentation/view/widgets/featured_projects_section.dart';
import 'package:portfolio_web/feature/home/presentation/view/widgets/home_biography_section.dart';
import 'package:portfolio_web/feature/home/presentation/view/widgets/home_hero_section.dart';
import 'package:portfolio_web/feature/home/presentation/view/widgets/home_snippets_section.dart';
import 'package:portfolio_web/feature/home/presentation/view/widgets/home_what_i_do_section.dart';
import 'package:portfolio_web/feature/home/presentation/view/widgets/show_contact_in_home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final heroKey = GlobalKey();
  final whatIDoKey = GlobalKey();
  final featuredKey = GlobalKey();
  final snippetsKey = GlobalKey();
  final contactKey = GlobalKey();

  String selectedItem = 'Home'; // يبدأ بـ Home تلقائيًا

  void scrollTo(String section) {
    setState(() => selectedItem = section);

    if (section == 'Home') {
      Scrollable.ensureVisible(
        heroKey.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else if (section == 'What I Do') {
      Scrollable.ensureVisible(
        whatIDoKey.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else if (section == 'Portfolio') {
      Scrollable.ensureVisible(
        featuredKey.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else if (section == 'Snippets') {
      Scrollable.ensureVisible(
        snippetsKey.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else if (section == 'Contact') {
      Scrollable.ensureVisible(
        contactKey.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }

    // Add other sections here later...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppBar(onNavItemClick: scrollTo, selectedItem: selectedItem),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
              ),
              child: const Divider(color: AppColors.normalText),
            ),
            const SizedBox(height: 20),
            HomeHeroSection(
              key: heroKey,
            ).animate().fade(duration: 600.ms).slideY(begin: 0.2),
            HomeBiographySection()
                .animate()
                .fade(duration: 600.ms, delay: 200.ms)
                .slideY(begin: 0.2),
            HomeWhatIDoSection(key: whatIDoKey)
                .animate()
                .fade(duration: 600.ms, delay: 400.ms)
                .slideY(begin: 0.2),
            HomeFeaturedProjectSection(key: featuredKey),
            HomeSnippetsSection(key: snippetsKey),
            const SizedBox(height: 60),
            ShowContactInHome(key: contactKey),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
