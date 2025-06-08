import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';
import 'package:portfolio_web/feature/home/presentation/view/widgets/biography_text.dart';
import 'package:portfolio_web/feature/home/presentation/view/widgets/connect_section.dart';

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
          child:
              isMobile
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // الصورة
                      CircleAvatar(
                        radius: 48,
                        backgroundColor: AppColors.accent,
                        child: CircleAvatar(radius: 45, child: FlutterLogo()),
                      ),
                      const SizedBox(height: 24),

                      // النص
                      const BiographyText(),

                      const SizedBox(height: 24),

                      // let’s connect
                      const ConnectSection(),
                    ],
                  )
                  : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // الصورة
                      CircleAvatar(
                        radius: 48,
                        backgroundColor: AppColors.accent,
                        child: CircleAvatar(radius: 45, child: FlutterLogo()),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.022,
                      ),
                      const BiographyText(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.057,
                      ),
                      const ConnectSection(),
                    ],
                  ),
        );
      },
    );
  }
}
