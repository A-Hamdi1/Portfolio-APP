import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../constant/Colors.dart';
import '../function/helper_functions.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const SkillPage());
}

class SkillPage extends StatelessWidget {
  const SkillPage({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: darkMode ? TColors.black : Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
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
                  title: Text('Akram Hamdi',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                              )),
                  subtitle: Text('FullStack Developer',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white70,
                          )),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/me.jpg'),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  color: darkMode ? TColors.black : Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(200),
                  )),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard(context, 'HTML', "assets/frameworks/html-5.svg",
                      Colors.deepOrange, darkMode),
                  itemDashboard(
                      context,
                      'Bootstrap',
                      "assets/frameworks/bootstrap.svg",
                      Colors.purple,
                      darkMode),
                  itemDashboard(context, 'Android',
                      "assets/frameworks/android.svg", Colors.teal, darkMode),
                  itemDashboard(context, 'Angular',
                      "assets/frameworks/angular.svg", Colors.red, darkMode),
                  itemDashboard(context, 'Python',
                      "assets/frameworks/python.svg", Colors.indigo, darkMode),
                  itemDashboard(context, 'JavaScript',
                      "assets/frameworks/js.svg", Colors.yellow, darkMode),
                  itemDashboard(context, 'Flutter',
                      "assets/frameworks/flutter.svg", Colors.blue, darkMode),
                  itemDashboard(
                      context,
                      'Laravel',
                      "assets/frameworks/laravel.svg",
                      Color(0xFFD4423A),
                      darkMode),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget itemDashboard(BuildContext context, String title, String svgPath,
          Color background, bool darkMode) =>
      Container(
        decoration: BoxDecoration(
            color: darkMode ? TColors.grey : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 2),
                  color: Theme.of(context).primaryColor.withOpacity(.2),
                  spreadRadius: 2,
                  blurRadius: 2),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(svgPath,
                  width: 24, height: 24, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(title.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      );
}
