import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeFeaturedProjectSection extends StatefulWidget {
  const HomeFeaturedProjectSection({super.key});

  @override
  State<HomeFeaturedProjectSection> createState() =>
      _HomeFeaturedProjectSectionState();
}

class _HomeFeaturedProjectSectionState extends State<HomeFeaturedProjectSection>
    with TickerProviderStateMixin {
  bool showMore = false;
  bool _isVisible = false;

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  void toggleShowMore() {
    setState(() {
      showMore = !showMore;
    });
  }

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

                List<Widget> projectCards = [
                  const _ProjectCard(
                    imagePath: 'assets/images/project1.png',
                    type: 'Flutter App',
                    title: 'Task Manager',
                    description:
                        'A productivity app built using Flutter that helps users manage their daily tasks with reminders and analytics.',
                  ),
                  const _ProjectCard(
                    imagePath: 'assets/images/project2.png',
                    type: 'Flutter Web',
                    title: 'Portfolio Website',
                    description:
                        'A personal portfolio website built with Flutter Web, showcasing skills, projects, and contact info with responsive UI.',
                  ),
                  if (showMore)
                    const _ProjectCard(
                      imagePath: 'assets/images/project3.png',
                      type: 'Flutter LMS',
                      title: 'Learning Platform',
                      description:
                          'Flutter LMS built for students and teachers with clean architecture and state management.',
                    ),
                  if (showMore)
                    const _ProjectCard(
                      imagePath: 'assets/images/project4.png',
                      type: 'Flutter Attendance',
                      title: 'Attendance System',
                      description:
                          'QR-based check-in system using Flutter, integrated with Firebase for real-time data sync.',
                    ),
                ];

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
                        onPressed: toggleShowMore,
                        icon: Icon(
                          showMore ? Icons.expand_less : Icons.expand_more,
                        ),
                        label: Text(showMore ? 'See Less' : 'See More'),
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

class _ProjectCard extends StatelessWidget {
  final String imagePath;
  final String type;
  final String title;
  final String description;

  const _ProjectCard({
    required this.imagePath,
    required this.type,
    required this.title,
    required this.description,
  });

  @override
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 600;

    if (isWide) {
      // layout for wide screens (Row)
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 300,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFF1C1F2A),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 32),
          Expanded(
            child: _ProjectDetails(
              type: type,
              title: title,
              description: description,
            ),
          ),
        ],
      );
    } else {
      // layout for small screens (Column)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFF1C1F2A),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          _ProjectDetails(type: type, title: title, description: description),
        ],
      );
    }
  }
}
class _ProjectDetails extends StatelessWidget {
  final String type;
  final String title;
  final String description;

  const _ProjectDetails({
    required this.type,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type,
          style: const TextStyle(
            color: AppColors.secondaryText,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(
            color: AppColors.secondaryText,
            fontSize: 15,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

