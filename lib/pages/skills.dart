import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import '../constant/Colors.dart';
import '../function/helper_functions.dart';
import '../theme/theme_provider.dart';

class SkillsWidget extends StatefulWidget {
  const SkillsWidget({Key? key}) : super(key: key);

  @override
  _SkillsWidgetState createState() => _SkillsWidgetState();
}

class _SkillsWidgetState extends State<SkillsWidget> {
  CarouselController _carouselController = CarouselController();
  int _current = 0;

  List<dynamic> _skills = [
    {'title': 'Flutter', 'image': 'assets/skills/flutter.png', 'description': 'Front-End'},
    {'title': 'AngularJS', 'image': 'assets/skills/angularjs.png', 'description': 'Front-End'},
    {'title': 'Python', 'image': 'assets/skills/python.png', 'description': 'Back-End'},
    {'title': 'Java', 'image': 'assets/skills/java.png', 'description': 'Back-End'},
    {'title': 'ReactJS', 'image': 'assets/skills/react.png', 'description': 'Front-End'},
    {'title': 'PHP', 'image': 'assets/skills/php.png', 'description': 'Back-End'},
    {'title': 'Javascript', 'image': 'assets/skills/javascript.png', 'description': 'Front-End'},
    {'title': 'C#', 'image': 'assets/skills/c-sharp.png', 'description': 'Back-End'},
    {'title': 'VueJS', 'image': 'assets/skills/vue.png', 'description': 'Front-End'},
    {'title': 'MongoDB', 'image': 'assets/skills/mongo-db.png', 'description': 'SGBD'},
    {'title': 'SQL', 'image': 'assets/skills/sql.png', 'description': 'SGBD'},
    {'title': 'MySQL', 'image': 'assets/skills/mysql.png', 'description': 'SGBD'},
  ];

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    List<Color> lightModeColors = [
      Colors.grey.shade50.withOpacity(0.0),
      Colors.grey.shade50.withOpacity(0.0),
      Colors.grey.shade50.withOpacity(0.0),
      Colors.grey.shade50.withOpacity(0.0),
      Colors.grey.shade50.withOpacity(0.0),
      Colors.grey.shade50.withOpacity(0.0),
      Colors.grey.shade50.withOpacity(0.0),
      Colors.grey.shade50.withOpacity(0.0),
    ];

    List<Color> darkModeColors = [
      Colors.black12.withOpacity(1),
      Colors.black12.withOpacity(1),
      Colors.black12.withOpacity(1),
      Colors.black12.withOpacity(1),
      Colors.black12.withOpacity(0.0),
      Colors.black12.withOpacity(0.0),
      Colors.black12.withOpacity(0.0),
      Colors.black12.withOpacity(0.0),
    ];

    List<Color> gradientColors = darkMode ? darkModeColors : lightModeColors;

    return Scaffold(
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
                  title: Text('Akram Hamdi',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
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
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Image.asset(_skills[_current]['image'], fit: BoxFit.cover),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: gradientColors)),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 315.0,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.70,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                    carouselController: _carouselController,
                    items: _skills.map((movie) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: darkMode ? TColors.black : Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    height: 220,
                                    margin: const EdgeInsets.only(top: 20),
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.asset(movie['image'], fit: BoxFit.cover),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    movie['title'],
                                    style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    child: Text(
                                      movie['description'],
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: darkMode ? Colors.white : Colors.grey.shade600,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
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
          color: Colors.white,
        ),
        backgroundColor: darkMode ? Color(0xFFF2A359) : Colors.grey,
      ),
    );
  }
}
