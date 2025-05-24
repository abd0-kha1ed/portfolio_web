import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app-text_styles.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';
import 'package:portfolio_web/core/widgets/custom_header.dart';

class AboutMeView extends StatelessWidget {
  const AboutMeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const Divider(color: AppColors.normalText),
            const SizedBox(height: 40),
            _buildTitle(),
            const SizedBox(height: 20),
            _buildBiographySection(),
            const SizedBox(height: 40),
            _buildExperienceSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return CustomHeader(selectedItem: 'About', onNavItemClick: (_) {});
  }

  Widget _buildTitle() {
    return SelectableText('About Me', style: AppTextStyles.bold36);
  }

  Widget _buildBiographySection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 48,
          backgroundColor: AppColors.white,
          child: Icon(Icons.person, size: 48, color: AppColors.background),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                "Hi, I'm a passionate Flutter developer focused on UI/UX, clean architecture, and modern web/mobile experiences.",
                style: AppTextStyles.normal16,
              ),
              const SizedBox(height: 12),
              SelectableText(
                "Currently working part-time at Khadmaty startup, building LMS and attendance systems.",
                style: AppTextStyles.normal16.copyWith(
                  color: AppColors.secondaryText,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.email, size: 20, color: AppColors.accent),
                  const SizedBox(width: 8),
                  SelectableText("your.email@example.com", style: AppTextStyles.normal14),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExperienceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText('Experience', style: AppTextStyles.bold24),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.backgroundCards,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText('Flutter Developer – Khadmaty', style: AppTextStyles.bold18),
              const SizedBox(height: 8),
              SelectableText(
                'Nov 2024 – Present',
                style: AppTextStyles.normal14.copyWith(
                  color: AppColors.secondaryText,
                ),
              ),
              const SizedBox(height: 12),
              SelectableText(
                "Working on mobile apps for education and internal tools. Built features like user auth, LMS dashboards, and attendance tracking.",
                style: AppTextStyles.normal14,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
