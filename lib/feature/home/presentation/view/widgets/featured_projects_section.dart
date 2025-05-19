import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';

class HomeFeaturedProjectSection extends StatefulWidget {
  const HomeFeaturedProjectSection({super.key});

  @override
  State<HomeFeaturedProjectSection> createState() =>
      _HomeFeaturedProjectSectionState();
}

class _HomeFeaturedProjectSectionState
    extends State<HomeFeaturedProjectSection> {
  bool showMore = false;

  void toggleShowMore() {
    setState(() {
      showMore = !showMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 60),
      child: Column(
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

          // ✅ مشروعين افتراضيين
          const _ProjectCard(
            imagePath: 'assets/images/project1.png',
            type: 'Flutter App',
            title: 'Task Manager',
            description:
                'A productivity app built using Flutter that helps users manage their daily tasks with reminders and analytics.',
          ),
          const SizedBox(height: 32),
          const _ProjectCard(
            imagePath: 'assets/images/project2.png',
            type: 'Flutter Web',
            title: 'Portfolio Website',
            description:
                'A personal portfolio website built with Flutter Web, showcasing skills, projects, and contact info with responsive UI.',
          ),

          const SizedBox(height: 32),

          // ✅ مشاريع إضافية تظهر عند الضغط
          if (showMore) ...[
            const _ProjectCard(
              imagePath: 'assets/images/project3.png',
              type: 'Flutter LMS',
              title: 'Learning Platform',
              description:
                  'Flutter LMS built for students and teachers with clean architecture and state management.',
            ),
            const SizedBox(height: 32),
            const _ProjectCard(
              imagePath: 'assets/images/project4.png',
              type: 'Flutter Attendance',
              title: 'Attendance System',
              description:
                  'QR-based check-in system using Flutter, integrated with Firebase for real-time data sync.',
            ),
            const SizedBox(height: 32),
          ],

          // ✅ زر See More / See Less
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton.icon(
              onPressed: toggleShowMore,
              icon: Icon(showMore ? Icons.expand_less : Icons.expand_more),
              label: Text(showMore ? 'See Less' : 'See More'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.background,
                foregroundColor: AppColors.white,
                side: const BorderSide(color: AppColors.secondaryText),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
  Widget build(BuildContext context) {
    return Row(
      children: [
        // الصورة
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

        // النصوص
        Expanded(
          child: Column(
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
          ),
        ),
      ],
    );
  }
}
