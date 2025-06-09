import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';
import 'package:portfolio_web/core/helpers/functions/url_launcher_function.dart';
import 'package:portfolio_web/core/utils/assets.dart';
import 'package:portfolio_web/feature/home/presentation/view/widgets/connection_icons.dart';
import 'package:portfolio_web/feature/home/presentation/view/widgets/social_icon.dart';

class ConnectSection extends StatelessWidget {
  const ConnectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: const SelectableText(
            'Let’s connect',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(height: 12),
        ConnectionIcons(),
      ],
    );
  }
}

