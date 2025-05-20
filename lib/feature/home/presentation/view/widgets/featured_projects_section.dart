import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';
import 'package:portfolio_web/feature/home/data/models/project_model.dart';
import 'package:portfolio_web/feature/home/presentation/view/widgets/project_card.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeFeaturedProjectSection extends StatefulWidget {
  const HomeFeaturedProjectSection({super.key});

  @override
  State<HomeFeaturedProjectSection> createState() =>
      _HomeFeaturedProjectSectionState();
}

class _HomeFeaturedProjectSectionState extends State<HomeFeaturedProjectSection>
    with TickerProviderStateMixin {
  bool _isVisible = false;

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.3, 0.0), // Slide from right
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.25 && !_isVisible) {
      _controller.forward();
      _isVisible = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('featured-project-section'),
      onVisibilityChanged: _onVisibilityChanged,
      child: SlideTransition(
        position: _slideAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            color: AppColors.background,
            padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 60),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 850;

                const List<ProjectModel> allProjects = [
                  ProjectModel(
                    imagePath: 'assets/images/project1.png',
                    type: 'Flutter App',
                    title: 'Task Manager',
                    description:
                        'A productivity app built using Flutter that helps users manage their daily tasks with reminders and analytics.',
                  ),
                  ProjectModel(
                    imagePath: 'assets/images/project2.png',
                    type: 'Flutter Web',
                    title: 'Portfolio Website',
                    description:
                        'A personal portfolio website built with Flutter Web, showcasing skills, projects, and contact info with responsive UI.',
                  ),
                  ProjectModel(
                    imagePath: 'assets/images/project3.png',
                    type: 'Flutter LMS',
                    title: 'Learning Platform',
                    description:
                        'Flutter LMS built for students and teachers with clean architecture and state management.',
                  ),
                  ProjectModel(
                    imagePath: 'assets/images/project4.png',
                    type: 'Flutter Attendance',
                    title: 'Attendance System',
                    description:
                        'QR-based check-in system using Flutter, integrated with Firebase for real-time data sync.',
                  ),
                ];
                List<ProjectModel> displayedProjects =
                     allProjects.take(2).toList();

                List<Widget> projectCards =
                    displayedProjects
                        .map(
                          (project) => ProjectCard(
                            imagePath: project.imagePath,
                            type: project.type,
                            title: project.title,
                            description: project.description,
                          ),
                        )
                        .toList();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Featured Project',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 40),

                    isWide
                        ? Wrap(
                          spacing: 32,
                          runSpacing: 32,
                          children: projectCards,
                        )
                        : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              projectCards
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 32,
                                      ),
                                      child: e,
                                    ),
                                  )
                                  .toList(),
                        ),

                    const SizedBox(height: 16),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.expand_more,
                        ),
                        label: Text('See More'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.background,
                          foregroundColor: AppColors.white,
                          side: const BorderSide(
                            color: AppColors.secondaryText,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

