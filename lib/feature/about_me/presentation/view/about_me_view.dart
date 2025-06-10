import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app-text_styles.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';
import 'package:portfolio_web/core/constants/helper.dart';
import 'package:portfolio_web/core/utils/assets.dart';
import 'package:portfolio_web/core/widgets/custom_header.dart';
import 'package:portfolio_web/feature/about_me/presentation/view/widgets/experince_section.dart';

class AboutMeView extends StatelessWidget {
  const AboutMeView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * horizontalPadding,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            screenWidth < 800 ? const SizedBox() : _buildHeader(),
            screenWidth < 800
                ? const SizedBox()
                : const Divider(color: AppColors.normalText),
            const SizedBox(height: 40),
            _buildBiographySection(context),
            const SizedBox(height: 40),
            const ExperienceSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return CustomHeader(selectedItem: 'What I Do', onNavItemClick: (_) {});
  }

  Widget _buildBiographySection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: SelectableText(
              "Hi I'm Abd El-Rhman, a special human with some ability to love learning and working on teamwork.",
              style:
                  screenWidth < 800
                      ? AppTextStyles.bold24
                      : AppTextStyles.bold56,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 51),
        Center(
          child: Wrap(
            spacing: 40,
            runSpacing: 40,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              // Icons column
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      Assets.imagesInsta,
                      width: 32,
                      height: 32,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.email,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              // Profile picture
              CircleAvatar(
                radius: 80,
                backgroundColor: AppColors.accentBlue,
                backgroundImage: AssetImage(Assets.imagesFacebook),
              ),

              // Biography text
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 350),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      "Biography",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SelectableText(
                      "Passionate Flutter developer focused on scalable apps, "
                      "clean code, and intuitive design. Delivering production-level "
                      "solutions using Firebase, REST APIs, Cubit, and modern UI.",
                      style: AppTextStyles.normal14.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[400],
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
