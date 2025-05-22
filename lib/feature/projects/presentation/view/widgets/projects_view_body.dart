import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app-text_styles.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';
import 'package:portfolio_web/core/utils/assets.dart';
import 'package:portfolio_web/core/widgets/custom_header.dart';
import 'package:portfolio_web/feature/projects/presentation/view/widgets/all_projects_layout.dart';

class ProjectsViewBody extends StatefulWidget {
  const ProjectsViewBody({super.key});

  @override
  State<ProjectsViewBody> createState() => _ProjectsViewBodyState();
}

class _ProjectsViewBodyState extends State<ProjectsViewBody> {
  String selectedItem = 'Portfolio';

  void onNavItemClick(String section) {
    setState(() => selectedItem = section);

    if (section == 'Projects') {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeader(
              onNavItemClick: onNavItemClick,
              selectedItem: selectedItem,
            ),
            const Divider(color: AppColors.normalText),
            const SizedBox(height: 72),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Project that i', style: AppTextStyles.bold56),
                    Row(
                      children: [
                        Text('has been', style: AppTextStyles.bold56),
                        const SizedBox(width: 8),
                        Text(
                          'done',
                          style: AppTextStyles.bold56.copyWith(
                            color: AppColors.accent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 72),
                Image.asset(Assets.imagesProjectArrow2),
              ],
            ),
            const SizedBox(height: 82),
            AllProjectsLayout(),
            const SizedBox(height: 82),
          ],
        ),
      ),
    );
  }
}
