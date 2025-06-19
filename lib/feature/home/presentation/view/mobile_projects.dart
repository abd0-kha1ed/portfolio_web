import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/aii_projects_list.dart';
import 'package:portfolio_web/feature/home/presentation/view/widgets/project_card.dart';
import 'package:portfolio_web/feature/projects/presentation/view/widgets/project_text.dart';

class MobileProjects extends StatelessWidget {
  const MobileProjects({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MobileProjectsBody());
  }
}

class MobileProjectsBody extends StatelessWidget {
  const MobileProjectsBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 28),
            FittedBox(fit: BoxFit.scaleDown, child: const ProjectText()),
            const SizedBox(height: 15),
            const Divider(),
            const SizedBox(height: 15),
            const MobileAllProjects(),
          ],
        ),
      ),
    );
  }
}

class MobileAllProjects extends StatelessWidget {
  const MobileAllProjects({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: allProjects.length,
      itemBuilder: (context, index) {
        final project = allProjects[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ProjectCard(
            imagePath: project.imagePath,
            type: project.type,
            title: project.title,
            description: project.description,
            url: project.url,
          ),
        );
      },
    );
  }
}
