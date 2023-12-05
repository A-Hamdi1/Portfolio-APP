import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/component/desktop.dart';
import 'package:portfolio/component/mobile.dart';
import 'package:portfolio/component/web.dart';
import 'package:portfolio/constant/Colors.dart';
import 'package:portfolio/function/helper_functions.dart';
import 'package:portfolio/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../function/localisation.dart';

void main() => runApp(ContactPage());

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final List<Widget> tabs = const [
    Tab(
      icon: Icon(
        Icons.web_stories,
        color: Colors.grey,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.android,
        color: Colors.grey,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.computer,
        color: Colors.grey,
      ),
    ),
  ];

  final List<Widget> tabBarViews = [
    WebSites(),
    AndroidApp(),
    DesktopApp(),
  ];

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: darkMode ? TColors.black : Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/me.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Akram Hamdi',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: darkMode ? TColors.white : Colors.grey.shade800,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'UI Designer • Programmer • Freelancer',
              style: TextStyle(
                  color: darkMode
                      ? Colors.white.withOpacity(0.9)
                      : Colors.grey[700]),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSocialIcon(
                  FontAwesomeIcons.github,
                  onTap: () => _launchGithub(),
                  darkMode: darkMode,
                ),
                SizedBox(width: 25),
                buildSocialIcon(
                  FontAwesomeIcons.facebook,
                  onTap: () => _launchFacebook(),
                  darkMode: darkMode,
                ),
                SizedBox(width: 25),
                buildSocialIcon(
                  FontAwesomeIcons.linkedin,
                  onTap: () => _launchLinkedin(),
                  darkMode: darkMode,
                ),
                SizedBox(width: 25),
                buildSocialIcon(
                  FontAwesomeIcons.locationDot,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LocalisationPage())),
                  darkMode: darkMode,
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _sendEmail();
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: darkMode
                              ? Colors.white.withOpacity(0.5)
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "Mailing",
                            style: TextStyle(
                                color: TColors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        callNumber();
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "Contact",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TabBar(
              tabs: tabs,
            ),
            Expanded(
              child: TabBarView(children: tabBarViews),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          },
          child: Icon(
            Icons.brightness_4,
            color: Colors.white,
          ),
          backgroundColor: darkMode ? Color(0xFFF2A359) : Colors.grey,
        ),
      ),
    );
  }

  Widget buildSocialIcon(IconData icon,
          {required VoidCallback onTap, required bool darkMode}) =>
      CircleAvatar(
        radius: 25,
        child: Material(
          shape: CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: darkMode ? TColors.grey : Colors.grey,
          child: InkWell(
            onTap: onTap,
            child: Center(child: Icon(icon, size: 32)),
          ),
        ),
      );
}

Future<void> _launchFacebook() async {
  final Uri _urlFac = Uri.parse('https://www.facebook.com/Akram.Hamdi.Dev');
  if (!await launchUrl(_urlFac)) {
    throw Exception('Could not launch $_urlFac');
  }
}

Future<void> _launchGithub() async {
  final Uri _urlGit = Uri.parse('https://github.com/A-Hamdi1');
  if (!await launchUrl(_urlGit)) {
    throw Exception('Could not launch $_urlGit');
  }
}

Future<void> _launchLinkedin() async {
  final Uri _urlLink = Uri.parse('https://www.linkedin.com/in/hamdi-akram');
  if (!await launchUrl(_urlLink)) {
    throw Exception('Could not launch $_urlLink');
  }
}

Future<void> _launchMaps() async {
  final Uri _urlLink = Uri.parse('https://maps.app.goo.gl/CJN6UJx4uRpF18KQA');
  if (!await launchUrl(_urlLink)) {
    throw Exception('Could not launch $_urlLink');
  }
}

void callNumber() async {
  Uri dialNumber = Uri(scheme: 'tel', path: '+21623757648');
  if (!await launchUrl(dialNumber)) {
    throw Exception('Could not launch $dialNumber');
  }
}

void _sendEmail() async {
  final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'hamdi.akram.dev@gmail.com',
    queryParameters: {'subject': 'Demande Projet'},
  );

  if (!await launchUrl(_emailLaunchUri)) {
    throw 'Could not launch $_emailLaunchUri';
  }

  await launchUrl(_emailLaunchUri);
}
