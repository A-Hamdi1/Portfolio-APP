import 'package:flutter/material.dart';
import 'package:portfolio/models/project_model.dart';
import '../pages/project_details_widget.dart';

class ProjectScreen5 extends StatelessWidget {
  const ProjectScreen5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProjectModel project = ProjectModel(
      title: "Big Bites Food's",
      rating: 5.0,
      author: "Akram Hamdi",
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
          'tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim'
          ' veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      technologies: ["Laravel", "Flutter", "Firebase"],
      steps: ["Step 1", "Step 2", "Step 3"],
      image: 'assets/images/website5.jpg',

    );

    return ProjectDetailsWidget(project: project);
  }
}
