import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/helper.dart';
import 'package:portfolio_web/feature/contact_section/presentation/view/widgets/contact_section.dart';

class ContactView extends StatelessWidget {
const ContactView({ super.key });
@override
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
return Scaffold(
body: SingleChildScrollView(child: Padding(
  padding:  EdgeInsets.symmetric(horizontal: screenWidth < 800 ? 24 : screenWidth * horizontalPadding),
  child: ContactSection(),
)),

);
}
}