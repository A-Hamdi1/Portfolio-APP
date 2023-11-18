import 'package:portfolio/component/project_screen1.dart';
import 'package:portfolio/component/project_screen2.dart';
import 'package:portfolio/component/project_screen3.dart';
import 'package:portfolio/component/project_screen4.dart';
import 'package:portfolio/component/project_screen5.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import '../component/ProjectCart.dart';
import '../constant/Colors.dart';
import '../function/helper_functions.dart';

void main() => runApp(ProjectPage());

class ProjectPage extends StatelessWidget {
  const ProjectPage({Key? key}) : super(key: key);

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
        body: SingleChildScrollView(
          child: Column(
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
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 30),
                      title: Text('Akram Hamdi',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: Colors.white)),
                      subtitle: Text('FullStack Developer',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Colors.white70)),
                      trailing: const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/me.jpg'),
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  ProjectCard(
                    titre: 'Car Platform',
                    image: 'assets/images/website1.jpg',
                    darkMode: darkMode,
                    detailsPage: ProjectScreen1(),
                  ),
                  ProjectCard(
                    titre: 'GYM Store',
                    image: 'assets/images/website2.jpg',
                    darkMode: darkMode,
                    detailsPage: ProjectScreen2(),
                  ),
                  ProjectCard(
                      titre: 'TWS Platform',
                      image: 'assets/images/website3.jpg',
                      darkMode: darkMode,
                    detailsPage: ProjectScreen3(),
                  ),
                  ProjectCard(
                      titre: 'B.E.C.A Company',
                      image: 'assets/images/website4.jpg',
                      darkMode: darkMode,
                    detailsPage: ProjectScreen4(),
                  ),
                  ProjectCard(
                      titre: "Big Bites Food's",
                      image: 'assets/images/website5.jpg',
                      darkMode: darkMode,
                    detailsPage: ProjectScreen5(),
                  ),
                ],
              ),
              const SizedBox(height: 60),
            ],
          ),
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
}
