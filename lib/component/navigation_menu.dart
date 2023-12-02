import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:portfolio/pages/skills.dart';
import 'package:portfolio/pages/contact.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../function/helper_functions.dart';
import '../constant/Colors.dart';
import '../pages/profile.dart';
import '../pages/projects.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: Container(
        color: darkMode ? TColors.black : Colors.white,
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: (index) {
                  controller.selectedIndex.value = index;
                },
                children: controller.screens,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SmoothPageIndicator(
                controller: controller.pageController,
                count: controller.screens.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.deepPurple.shade400,
                  dotColor: Colors.deepPurple.shade100,
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 16,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
            () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            controller.pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 100),
              curve: Curves.ease,
            );
          },
          backgroundColor: darkMode ? TColors.black : Colors.white,
          indicatorColor: darkMode
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Profile'),
            NavigationDestination(icon: Icon(Iconsax.scroll), label: 'Skills'),
            NavigationDestination(
                icon: Icon(Iconsax.brifecase_cross), label: 'Projects'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'About'),
          ],
        ),
      ),

    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final List<Widget> screens = [
    const ProfilePage(),
    const SkillsWidget(),
    const ProjectPage(),
    const ContactPage(),
  ];
  final PageController pageController = PageController(initialPage: 0);
}
