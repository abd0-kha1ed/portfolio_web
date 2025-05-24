import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';
import 'package:portfolio_web/core/routing/app_router.dart';
import 'package:portfolio_web/core/utils/assets.dart';
import 'package:portfolio_web/feature/home/presentation/view/widgets/service_card.dart';

class HomeWhatIDoSection extends StatelessWidget {
  const HomeWhatIDoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWide = constraints.maxWidth > 850;

        return Container(
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
                            SelectableText(
                              'What I do',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(height: 12),
                            SelectableText.rich(
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
                                    style: TextStyle(color: AppColors.accent),
                                  ),
                                  TextSpan(
                                    text:
                                        ', focusing on UI/UX and performance. Also mentoring at ',
                                  ),
                                  TextSpan(
                                    text: 'MOFON',
                                    style: TextStyle(color: AppColors.blueDark),
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
                          children: [
                            const ServiceCard(
                              icon: Icons.flutter_dash,
                              title: 'Flutter Development',
                              description:
                                  'I build fast, responsive, and beautiful mobile & web apps using Flutter.',
                            ),
                            const ServiceCard(
                              icon: Icons.design_services,
                              title: 'UI/UX in Flutter',
                              description:
                                  'I focus on creating smooth and user-friendly designs with Flutter best practices.',
                            ),
                            SizedBox(width: 50),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 80),
                              child: IconButton(
                                onPressed: () {
                                  GoRouter.of(context).push(AppRouter.kAbout);
                                },
                                icon: Image.asset(Assets.imagesWhatIDoArrow),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                  : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SelectableText(
                        'What I do',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const SelectableText.rich(
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
