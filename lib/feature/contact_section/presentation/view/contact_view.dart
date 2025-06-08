import 'package:flutter/material.dart';
import 'package:portfolio_web/feature/contact_section/presentation/view/widgets/contact_section.dart';

class ContactView extends StatelessWidget {
const ContactView({ super.key });
@override
Widget build(BuildContext context) {
return Scaffold(
body: SingleChildScrollView(child: ContactSection()),

);
}
}