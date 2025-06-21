
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';
import 'package:portfolio_web/core/routing/app_router.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) {
        return PortfolioWebApp();
      },
    ),
  );
}

class PortfolioWebApp extends StatelessWidget {
  const PortfolioWebApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Abdelrahman | Flutter Developer',
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.background,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
