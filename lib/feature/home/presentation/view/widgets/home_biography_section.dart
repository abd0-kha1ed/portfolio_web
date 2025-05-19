import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';

class HomeBiographySection extends StatelessWidget {
  const HomeBiographySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة دائرية
          CircleAvatar(
            radius: 48,
            backgroundColor: AppColors.accent,
            child: CircleAvatar(
              radius: 45,
              // backgroundImage: AssetImage('assets/images/dev_avatar.png'),
              child: FlutterLogo(),
            ),
          ),
          const SizedBox(width: 32),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Biography',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.secondaryText,
                      height: 1.5,
                    ),
                    children: [
                      TextSpan(
                        text:
                            'Passionate about crafting scalable Flutter applications with ',
                      ),
                      TextSpan(
                        text: 'clean architecture',
                        style: TextStyle(color: AppColors.accent),
                      ),
                      TextSpan(
                        text:
                            '. I enjoy learning, writing documentation, and collaborating with teams. Excited about ',
                      ),
                      TextSpan(
                        text: 'Flutter',
                        style: TextStyle(color: Colors.greenAccent),
                      ),
                      TextSpan(text: ', '),
                      TextSpan(
                        text: 'UI/UX',
                        style: TextStyle(color: AppColors.accent),
                      ),
                      TextSpan(
                        text: ', and building adaptive apps for all platforms.',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Let’s connect
          const SizedBox(width: 48),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Let’s connect',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: const [
                  _SocialIcon(icon: Icons.email),
                  SizedBox(width: 12),
                  _SocialIcon(icon: Icons.facebook),
                  SizedBox(width: 12),
                  // _SocialIcon(icon: Icons.twitter),
                  // SizedBox(width: 12),
                  _SocialIcon(icon: Icons.code),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;

  const _SocialIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: AppColors.accent, size: 24);
  }
}
