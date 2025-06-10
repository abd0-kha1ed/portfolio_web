import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';
import 'package:portfolio_web/core/constants/helper.dart';
import 'package:portfolio_web/core/utils/assets.dart';
import 'package:portfolio_web/core/widgets/custom_footer.dart';
import 'package:portfolio_web/core/widgets/custom_header.dart';
import 'package:portfolio_web/feature/home/presentation/view/mobile_projects.dart';
import 'package:portfolio_web/feature/projects/presentation/view/widgets/all_projects_layout.dart';
import 'package:portfolio_web/feature/projects/presentation/view/widgets/project_text.dart';

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
    final width = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder:
          (context, constrains) =>
              constrains.maxWidth < 800
                  ? MobileProjects()
                  : buildProjectsDesktopLayout(width),
    );
  }

  SingleChildScrollView buildProjectsDesktopLayout(double width) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * horizontalPadding),
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
                ProjectText(),
                SizedBox(width: width * 0.050224966),
                Image.asset(
                  Assets.imagesProjectArrow2,
                  width: width * 0.1163684559,
                ),
              ],
            ),
            const SizedBox(height: 82),
            AllProjectsLayout(),
            const SizedBox(height: 82),
            const CustomFooter(),
          ],
        ),
      ),
    );
  }
}
