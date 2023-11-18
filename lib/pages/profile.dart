import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:portfolio/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import '../constant/Colors.dart';
import '../function/helper_functions.dart';
import '../function/section_functions.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(const ProfilePage());
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: darkMode ? TColors.black : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTopContainer(context),
            const SizedBox(height: 20),
            SingleChildScrollView(
              child: _buildProfileDetails(),
            ),
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
    );
  }

  Widget _buildTopContainer(BuildContext context) {
    return Container(
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
    );
  }

  Widget _buildProfileDetails() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          TSectionHeading(title: 'About Me!'),
          TSectionHeading(title: '_______________________________'),
          const SizedBox(height: 16.0),
          TSettingsMenuTile(
            icon: Icons.verified,
            title: 'Akram Hamdi',
            subTitle:
                'Currently a student at the Higher Institute of Technological Studies of Sfax, pursuing in-depth training in computer science. Passionate about creating innovative and functional web applications, with solid skills in front-end and back-end development.',
          ),
          const SizedBox(height: 16.0),
          TSectionHeading(title: 'Education'),
          TSectionHeading(title: '_______________________________'),
          const SizedBox(height: 16.0),
          _buildEducationTiles(),
          const SizedBox(height: 16.0),
          TSectionHeading(title: 'Professional Experience'),
          TSectionHeading(title: '_______________________________'),
          const SizedBox(height: 16.0),
          _buildExperienceTiles(),
          const SizedBox(height: 16.0),
          TSectionHeading(title: 'Clubs Experience'),
          TSectionHeading(title: '_______________________________'),
          const SizedBox(height: 16.0),
          _buildClubsExperienceTiles(),
          const SizedBox(height: 16.0),
          TSectionHeading(title: 'Soft Skills Training'),
          TSectionHeading(title: '_______________________________'),
          const SizedBox(height: 16.0),
          _buildSoftSkillsTrainingTiles(),
        ],

      ),

    );
  }

  Widget _buildEducationTiles() {
    return Column(
      children: [
        TSettingsMenuTile(
          icon: Iconsax.teacher,
          title: 'IT Bachelor Diploma',
          subTitle: 'Iset Sfax - 2024',
        ),
        TSettingsMenuTile(
          icon: Iconsax.courthouse,
          title: 'High School Diploma ',
          subTitle: 'Lyceé Majida Boulila Sfax - 2021',
        ),
      ],
    );
  }

  Widget _buildExperienceTiles() {
    return Column(
      children: [
        TSettingsMenuTile(
          icon: Icons.business,
          title: 'Improvement Internship',
          subTitle: 'BestBuy Tunisie - BBT',
        ),
        TSettingsMenuTile(
          icon: Icons.business,
          title: 'Initiation Internship',
          subTitle: 'B.E.C.A - BECA',
        ),
      ],
    );
  }

  Widget _buildClubsExperienceTiles() {
    return Column(
      children: [
        TSettingsMenuTile(
          icon: Icons.add_circle,
          title: 'Futurs Entrepreneurs IIT',
          subTitle: '2020-2021 - Member',
        ),
        TSettingsMenuTile(
          icon: Icons.add_circle,
          title: 'TWS Club',
          subTitle: '2022-2023 - Member',
        ),
      ],
    );
  }

  Widget _buildSoftSkillsTrainingTiles() {
    return Column(
      children: [
        _buildCustomTile(
          icon: Icons.school,
          title: 'Leadership And Problem-Solving',
        ),
        _buildCustomTile(
          icon: Icons.text_fields,
          title: 'Adaptability And Teamwork',
        ),
        _buildCustomTile(

          icon: Icons.insert_chart,
          title: 'Mentoring And Conflict Resolution',
        ),
      ],
    );
  }

  Widget _buildCustomTile({
    required IconData icon,
    required String title,
  }) {
    return ListTile(
      leading: Icon(icon, size: 28, color: Colors.blue),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 17,
            ),
      ),
    );
  }
}
