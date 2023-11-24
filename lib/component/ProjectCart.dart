import 'package:flutter/material.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/pages/project_details_widget.dart';
import '../constant/Colors.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;
  final bool darkMode;

  const ProjectCard({
    Key? key,
    required this.project,
    required this.darkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: darkMode ? TColors.black : Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: darkMode
                ? Colors.white.withOpacity(.2)
                : Theme.of(context).colorScheme.primary.withOpacity(.2),
            spreadRadius: 5,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(project.image,
                height: 150, width: 150, fit: BoxFit.cover),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(project.title,
                    style: darkMode
                        ? Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Colors.white)
                        : Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 3),
                Row(
                  children: List.generate(
                    5,
                    (index) =>
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ',
                  style: darkMode
                      ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w300, color: Colors.white)
                      : Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProjectDetailsWidget(project: project),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkMode ? Colors.grey : Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Show Details'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
