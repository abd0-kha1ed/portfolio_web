import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_web/core/helpers/functions/send_email_from_fkutter_function.dart';
import 'package:portfolio_web/feature/contact_section/presentation/view/widgets/social_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 50,
          left: 40,
          child: _blurredCircle(180, Colors.teal.withOpacity(0.08))
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .move(
                duration: 6000.ms,
                begin: const Offset(0, 0),
                end: const Offset(30, 0),
              ),
        ),

        Positioned(
          bottom: 60,
          right: 60,
          child: _blurredCircle(140, Colors.purple.withOpacity(0.07))
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .move(
                duration: 8000.ms,
                begin: const Offset(0, 0),
                end: const Offset(0, -20),
              ),
        ),

        Positioned(
          top: 200,
          right: 120,
          child: _blurredCircle(100, Colors.blueGrey.withOpacity(0.06))
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .move(
                duration: 10000.ms,
                begin: const Offset(0, 0),
                end: const Offset(-20, 10),
              ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 32),
          child: Column(
            children: [
              Text(
                "Contact Me",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ).animate().slideY(duration: 500.ms).fadeIn(),

              const SizedBox(height: 12),
              const Text(
                "I'm open to freelance projects, collaborations, or just a friendly chat.",
                style: TextStyle(color: Colors.grey, fontSize: 16),
                textAlign: TextAlign.center,
              ).animate().fadeIn(delay: 200.ms),

              const SizedBox(height: 60),

              // Content: Row layout
              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 700;
                  return isMobile
                      ? Column(
                        children: [
                          _buildContactInfo().animate().fadeIn(),
                          const SizedBox(height: 32),
                          _buildForm().animate().fadeIn(delay: 200.ms),
                        ],
                      )
                      : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: _buildContactInfo().animate().fadeIn(),
                          ),
                          const SizedBox(width: 48),
                          Expanded(
                            flex: 1,
                            child: _buildForm().animate().fadeIn(delay: 200.ms),
                          ),
                        ],
                      );
                },
              ),

              const SizedBox(height: 60),

              // Footer
              const Text(
                "Designed & Developed with ❤️ by Abd El-Rhman",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _contactRow(
          Icons.email,
          "abdelrahmankhaleddev@gmail.com",
          "mailto:abdelrahmankhaleddev@gmail.com",
          Colors.tealAccent,
        ),
        const SizedBox(height: 16),
        _contactRow(
          FontAwesomeIcons.whatsapp,
          "WhatsApp me",
          "https://wa.me/+201007287335",
          Colors.greenAccent,
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 24,
          children: const [
            SocialIcon(
              icon: Icons.code,
              label: "GitHub",
              url: "https://github.com/abd0-kha1ed",
            ),
            SocialIcon(
              icon: Icons.business,
              label: "LinkedIn",
              url: "https://www.linkedin.com/public-profile/settings?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_self_edit_contact-info%3BYYQieOSqTkySWOAXTWvr5w%3D%3D",
            ),
            SocialIcon(
              icon: Icons.camera_alt,
              label: "Instagram",
              url: "https://www.instagram.com/abdelrhmankhaleddev?igsh=b2ZzMWhpNGR3OTFl",
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _textInput(_nameController, "Your Name"),
          const SizedBox(height: 16),
          _textInput(_emailController, "Your Email"),
          const SizedBox(height: 16),
          _textInput(_messageController, "Your Message", maxLines: 5),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                sendEmail(
                  _nameController.text,
                  _emailController.text,
                  _messageController.text,
                );
                _nameController.clear();
                _emailController.clear();
                _messageController.clear();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.tealAccent,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text("Send"),
          ),
        ],
      ),
    );
  }

  Widget _textInput(
    TextEditingController controller,
    String hint, {
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "This field is required";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _contactRow(IconData icon, String label, String url, Color color) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: color,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

  Widget _blurredCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
