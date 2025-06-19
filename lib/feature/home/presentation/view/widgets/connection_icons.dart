import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_web/core/helpers/functions/url_launcher_function.dart';
import 'package:portfolio_web/core/utils/assets.dart';
import 'package:portfolio_web/feature/home/presentation/view/widgets/social_icon.dart';

class ConnectionIcons extends StatelessWidget {
  const ConnectionIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SocialIcon(
          icon: Icon(
            FontAwesomeIcons.linkedinIn,
            size: 30,
            color: Colors.white,
          ),
          onPressed:
              () => lunchCustomUrl(
                'https://www.linkedin.com/in/abdelrahman-khaled-dev/',
              ),
        ),
        const SizedBox(width: 12),
        SocialIcon(
          icon: Icon(
            FontAwesomeIcons.github,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () => lunchCustomUrl('https://github.com/abd0-kha1ed'),
        ),
        const SizedBox(width: 12),
        SocialIcon(
          icon: Icon(FontAwesomeIcons.envelope, size: 30, color: Colors.white),
          onPressed:
              () => lunchCustomUrl(
                'mailto:abdelrahmankhaleddev@gmail.com',
              ),
        ),
      ],
    );
  }
}
