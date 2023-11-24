class ProjectModel {
  final String title;
  final double rating;
  final String author;
  final String description;
  final List<String> technologies;
  final List<String> steps;
  final String image;

  ProjectModel({
    required this.title,
    required this.rating,
    required this.author,
    required this.description,
    required this.technologies,
    required this.steps,
    required this.image,
  });
}
