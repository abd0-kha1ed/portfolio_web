import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';
import 'package:portfolio_web/core/helpers/functions/url_launcher_function.dart';

class HomeBiographySection extends StatelessWidget {
  const HomeBiographySection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 850;

        return Container(
          color: AppColors.background,
          padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 40),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // الصورة
                    CircleAvatar(
                      radius: 48,
                      backgroundColor: AppColors.accent,
                      child: CircleAvatar(
                        radius: 45,
                        child: FlutterLogo(),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // النص
                    const _BiographyText(),

                    const SizedBox(height: 24),

                    // let’s connect
                    const _ConnectSection(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // الصورة
                    CircleAvatar(
                      radius: 48,
                      backgroundColor: AppColors.accent,
                      child: CircleAvatar(
                        radius: 45,
                        child: FlutterLogo(),
                      ),
                    ),
                    const SizedBox(width: 32),

                    // النص
                    const Expanded(child: _BiographyText()),

                    const SizedBox(width: 48),

                    // let’s connect
                    const _ConnectSection(),
                  ],
                ),
        );
      },
    );
  }
}

class _BiographyText extends StatelessWidget {
  const _BiographyText();

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class _ConnectSection extends StatelessWidget {
  const _ConnectSection();

  @override
  Widget build(BuildContext context) {
    return Column(
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
          children: [
            SocialIcon(icon: Icons.email),
            const SizedBox(width: 12),
            SocialIcon(
              icon: FontAwesomeIcons.whatsapp,
              onPressed: () => openWhatsApp('+201007287335'),
            ),
            const SizedBox(width: 12),
            SocialIcon(
              icon: FontAwesomeIcons.facebook,
              onPressed: () => lunchCustomUrl(
                  'https://www.facebook.com/abd.el.rhman.khaled.584963'),
            ),
          ],
        ),
      ],
    );
  }
}


class SocialIcon extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;

  const SocialIcon({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: AppColors.accent, size: 24),
    );
  }
}
