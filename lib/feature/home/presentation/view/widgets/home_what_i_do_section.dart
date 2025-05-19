import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';

class HomeWhatIDoSection extends StatelessWidget {
  const HomeWhatIDoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWide = constraints.maxWidth > 850;

        return Container(
          color: AppColors.background,
          padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 60),
          child:
              isWide
                  ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'What I do',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.secondaryText,
                                  height: 1.6,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        'Build and maintain applications using ',
                                  ),
                                  TextSpan(
                                    text: 'Flutter',
                                    style: TextStyle(color: Colors.greenAccent),
                                  ),
                                  TextSpan(
                                    text:
                                        ', focusing on UI/UX and performance. Also mentoring at ',
                                  ),
                                  TextSpan(
                                    text: 'MOFON',
                                    style: TextStyle(color: AppColors.accent),
                                  ),
                                  TextSpan(
                                    text:
                                        '. I value clean code, teamwork, and continuous learning.',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 32),

                      Expanded(
                        flex: 3,
                        child: Wrap(
                          spacing: 24,
                          runSpacing: 24,
                          children: const [
                            ServiceCard(
                              icon: Icons.flutter_dash,
                              title: 'Flutter Development',
                              description:
                                  'I build fast, responsive, and beautiful mobile & web apps using Flutter.',
                            ),
                            ServiceCard(
                              icon: Icons.design_services,
                              title: 'UI/UX in Flutter',
                              description:
                                  'I focus on creating smooth and user-friendly designs with Flutter best practices.',
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                  : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'What I do',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.secondaryText,
                            height: 1.6,
                          ),
                          children: [
                            TextSpan(
                              text: 'Build and maintain applications using ',
                            ),
                            TextSpan(
                              text: 'Flutter',
                              style: TextStyle(color: Colors.greenAccent),
                            ),
                            TextSpan(
                              text:
                                  ', focusing on UI/UX and performance. Also mentoring at ',
                            ),
                            TextSpan(
                              text: 'MOFON',
                              style: TextStyle(color: AppColors.accent),
                            ),
                            TextSpan(
                              text:
                                  '. I value clean code, teamwork, and continuous learning.',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Wrap(
                        spacing: 24,
                        runSpacing: 24,
                        children: const [
                          ServiceCard(
                            icon: Icons.flutter_dash,
                            title: 'Flutter Development',
                            description:
                                'I build fast, responsive, and beautiful mobile & web apps using Flutter.',
                          ),
                          ServiceCard(
                            icon: Icons.design_services,
                            title: 'UI/UX in Flutter',
                            description:
                                'I focus on creating smooth and user-friendly designs with Flutter best practices.',
                          ),
                        ],
                      ),
                    ],
                  ),
        );
      },
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServiceCard({super.key, 
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFF1C1F2A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.background,
            child: Icon(icon, color: AppColors.accent),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(
              color: AppColors.secondaryText,
              fontSize: 14,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
