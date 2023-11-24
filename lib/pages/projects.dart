import 'package:flutter/material.dart';
import 'package:portfolio/component/ProjectCart.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import '../function/helper_functions.dart';
import '../constant/Colors.dart';

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
                      title: Text(
                        'Akram Hamdi',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
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
                    const SizedBox(height: 25),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  ProjectCard(
                    project: ProjectModel(
                      title: 'Car Platform',
                      rating: 5.0,
                      author: 'Akram Hamdi',
                      description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
                          'tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim'
                          ' veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
                      technologies: ['ReactJS', 'NodeJS', 'MongoDB'],
                      steps: ['Step 1', 'Step 2', 'Step 3'],
                      image: 'assets/images/website1.jpg',
                    ),
                    darkMode: darkMode,
                  ),
                  ProjectCard(
                    project: ProjectModel(
                      title: 'GYM Store',
                      rating: 4.5,
                      author: 'Akram Hamdi',
                      description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
                          'tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim'
                          ' veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
                      technologies: ['Flutter', 'Firebase'],
                      steps: ['Step 1', 'Step 2', 'Step 3'],
                      image: 'assets/images/website2.jpg',
                    ),
                    darkMode: darkMode,
                  ),
                  ProjectCard(
                    project: ProjectModel(
                      title: 'TWS Platform',
                      rating: 4.7,
                      author: 'Akram Hamdi',
                      description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
                          'tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim'
                          ' veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
                      technologies: ['Django', 'ReactJS', 'PostgreSQL'],
                      steps: ['Step 1', 'Step 2', 'Step 3'],
                      image: 'assets/images/website3.jpg',
                    ),
                    darkMode: darkMode,
                  ),
                  ProjectCard(
                    project: ProjectModel(
                      title: 'B.E.C.A Company',
                      rating: 4.9,
                      author: 'Akram Hamdi',
                      description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
                          'tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim'
                          ' veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
                      technologies: ['.NET', 'Laravel', 'SQL Server'],
                      steps: ['Step 1', 'Step 2', 'Step 3'],
                      image: 'assets/images/website4.jpg',
                    ),
                    darkMode: darkMode,
                  ),
                  ProjectCard(
                    project: ProjectModel(
                      title: "Big Bites Food's",
                      rating: 4.5,
                      author: 'Akram Hamdi',
                      description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
                          'tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim'
                          ' veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
                      technologies: ['Laravel', 'Flutter', 'Firebase'],
                      steps: ['Step 1', 'Step 2', 'Step 3'],
                      image: 'assets/images/website5.jpg',
                    ),
                    darkMode: darkMode,
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
            color: Colors.white,
          ),
          backgroundColor: darkMode ? Color(0xFFF2A359) : Colors.grey,
        ),
      ),
    );
  }
}
