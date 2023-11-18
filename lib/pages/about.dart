import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constant/Colors.dart';
import '../function/helper_functions.dart';

void main() => runApp(AboutPage());

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: darkMode ? TColors.black : Colors.white,
      ),
      home: Scaffold(
        backgroundColor: darkMode ? TColors.black : Colors.white,
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                    title: Text(
                      'Akram Hamdi',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.white),
                    ),
                    subtitle: Text(
                      'FullStack Developer',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white70),
                    ),
                    trailing: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/me.jpg'),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildIconCard(
                      context: context,
                      onTap: _launchFacebook,
                      image: "assets/images/facebook.png",
                      text: '     Akram.Hamdi.Dev',
                    ),
                    buildIconCard(
                      context: context,
                      onTap: () => _launchLinkedin(),
                      image: "assets/images/linkedin.png",
                      text: '     hamdi-akram',
                    ),
                    buildIconCard(
                      context: context,
                      onTap: () => _launchGithub(),
                      image: "assets/images/github.png",
                      text: '     A-Hamdi1',
                    ),
                    buildIconCard(
                      context: context,
                      onTap: () => callNumber(),
                      image: "assets/images/whatsapp.png",
                      text: '     +216 23 757 648',
                    ),
                    buildIconCard(
                      context: context,
                      onTap: () => _sendEmail(),
                      image: "assets/images/gmail.png",
                      text: '     hamdi.akram.dev@gmail.com',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          },
          child: Icon(
            Icons.brightness_4,
          ),
          backgroundColor: darkMode ? Color(0xFFF2A359) : Colors.grey,
        ),
      ),
    );
  }

  Widget buildIconCard({
    required BuildContext context,
    required VoidCallback onTap,
    required String image,
    required String text,
  }) {
    bool isDarkMode(BuildContext context) {
      return Theme.of(context).brightness == Brightness.dark;
    }

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        color: isDarkMode(context) ? Colors.grey : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: 369,
          height: 80,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                image,
                height: 40,
                width: 40,
              ),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
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
