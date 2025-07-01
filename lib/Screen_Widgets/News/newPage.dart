import 'package:flutter/material.dart';
import 'package:full_app/constant/Dimensions.dart';
import 'package:get/get.dart';
import 'package:full_app/constant/MyAppBar.dart';

import '../Navigation_Pages/controller.dart'; // ✅ For navigation
import 'SecoundNewsPage.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> articles = [
    {
      'title':
      'The Future of AI: How Artificial Intelligence Will Change the World',
      'image': 'assets/images/Ai.jpeg',
      'content': '''
Innovations in the field of artificial intelligence continue to shape the future of humanity across nearly every industry.

AI is already the main driver of emerging technologies like big data, robotics and IoT, and generative AI has further expanded the possibilities and popularity of AI.
''',
    },
    {
      'title': 'Principles of Healthy Eating: Fruits and Vegetables',
      'image': 'assets/images/healthyfood.jpeg',
      'content': '''
Fruits and vegetables are essential to a healthy diet. They are rich in fiber, vitamins, and antioxidants.

Maintaining a balanced diet with a variety of colorful produce can help reduce the risk of chronic diseases.
''',
    },
    {
      'title': 'Workout Routines for Men: The Ultimate Guide',
      'image': 'assets/images/gym.jpeg',
      'content': '''
Building a consistent workout routine helps improve strength, endurance, and mental health.

Include compound lifts, rest days, and proper nutrition to optimize your fitness journey.
''',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final navController = Get.find<NavigationController>(); // ✅

    return Scaffold(
      appBar: MyAppBar(
        title: 'News',
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => navController.goBack(), // ✅ Go back using controller
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: [


            /// 🔄 PageView Slider
            SizedBox(
              height: 180,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        articles[index]['image'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  );
                },
              ),
            ),

            /// PageView indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(articles.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentPage == index ? 20 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Colors.grey[700]
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }),
            ),

            /// News List
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: DimensionsApp.height * 0.05,
                horizontal: DimensionsApp.width * 0.04,
              ),
              child: Column(
                children: articles.map((article) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                            () => Secoundnewspage(
                          title: article['title'],
                          image: article['image'],
                          content: article['content'],
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              article['image'],
                              height: 110,
                              width: 110,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              article['title'],
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}