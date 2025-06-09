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
            _buildHeader(),
            const Divider(color: AppColors.normalText),
            const SizedBox(height: 40),
            _buildBiographySection(context),
            const SizedBox(height: 40),
            ExperienceSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return CustomHeader(selectedItem: 'What I Do', onNavItemClick: (_) {});
  }

  Widget _buildBiographySection(context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            width: screenWidth * 0.6703637822,
            child: SelectableText(
              "Hi Im Abd El-Rhman, a special human with some ability to love learning and working on teamwork.",
              style: AppTextStyles.bold56,
            ),
          ),
        ),
        const SizedBox(height: 51),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(Assets.imagesInsta),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.email)),
              ],
            ),
            const SizedBox(width: 87),
            SizedBox(
              width: screenWidth * 0.1395137944,
              child: CircleAvatar(
                radius: 100,
                backgroundColor: AppColors.accentBlue,
                backgroundImage: AssetImage(Assets.imagesFacebook),
              ),
            ),
            const SizedBox(width: 51),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SelectableText(
                  "Biography",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: screenWidth * 0.3480869171,
                  child: SelectableText(
                    "Passionate Flutter developer focused on scalable apps, \nclean code, and intuitive design. Delivering production-level \nsolutions using Firebase, REST APIs, Cubit, and modern UI.",
                    style: AppTextStyles.normal14.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
