import 'package:flutter/material.dart';
import 'package:full_app/constant/Dimensions.dart';
import 'package:full_app/constant/MyAppBar.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Navigation_Pages/controller.dart';
import 'Controller.dart';

class BenefitsPage extends StatelessWidget {
  BenefitsPage({super.key});

  final BenefitsController controller = Get.put(BenefitsController());

  final Map<String, List<Map<String, String>>> articleTabs = {
    'Deals': [
      {
        'title': 'The Future of AI: How Artificial Intelligence Will Change the World',
        'image': 'assets/images/Ai.jpeg',
      },
      {
        'title': 'Principles of Healthy Eating: Fruits and Vegetables',
        'image': 'assets/images/healthyfood.jpeg',
      },
      {
        'title': 'Workout Routines for Men: The Ultimate Guide',
        'image': 'assets/images/gym.jpeg',
      },
    ],
    'Phone directory': [
      {
        'title': 'Reception: +961-1-234567',
        'image': 'assets/images/phone.jpeg',
      },
      {
        'title': 'Maintenance: +961-1-765432',
        'image': 'assets/images/phone2.jpeg',
      },
    ],
    'Useful links': [
      {
        'title': 'Company Website',
        'url': 'https://en.wikipedia.org/wiki/Company',
      },
      {
        'title': 'HR Portal',
        'url': 'https://hr.un.org/',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<NavigationController>();

    return Scaffold(
      appBar: MyAppBar(
        title: 'Benefits',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => navController.goBack(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: DimensionsApp.width * 0.03,
            vertical: DimensionsApp.height * 0.04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Filter buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildFilterButton("Deals"),
                  _buildFilterButton("Phone directory"),
                  _buildFilterButton("Useful links"),
                ],
              ),
              const SizedBox(height: 24),

              // Articles List
              Expanded(
                child: Obx(() {
                  final selected = controller.selectedTab.value;
                  final currentArticles = articleTabs[selected] ?? [];

                  return ListView.separated(
                    itemCount: currentArticles.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final article = currentArticles[index];
                      final url = article['url'];

                      // Check if it's Useful links tab to show text only
                      final isUsefulLinks = selected == 'Useful links';

                      return GestureDetector(
                        onTap: () async {
                          if (url != null) {
                            final uri = Uri.parse(url);
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri);
                            } else {
                              Get.snackbar('Error', 'Cannot open link');
                            }
                          }
                        },
                        child: isUsefulLinks
                            ? Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            article['title']!,
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                            ),
                          ),
                        )
                            : Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                article['image']!,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                article['title']!,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterButton(String label) {
    return GestureDetector(
      onTap: () => controller.selectTab(label),
      child: Obx(() {
        final isSelected = controller.selectedTab.value == label;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue[100] : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        );
      }),
    );
  }
}
